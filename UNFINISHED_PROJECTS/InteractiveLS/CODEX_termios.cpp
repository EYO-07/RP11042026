/// BEGIN CODEX_termios.h 

// -- preprocessor directives
#include "CODEX_termios.h"

// -- implementations 
bool disableRawMode(TermiosSettings& settings) {
    if (tcgetattr(STDIN_FILENO, &settings.original) != 0) {
        return false;
    }
    termios raw = settings.original;
    // Disable canonical mode (line buffering) and echo
    raw.c_lflag &= ~(ICANON | ECHO);
    // Disable signals like Ctrl+C for custom handling if needed
    // raw.c_lflag &= ~(ISIG); 
    if (tcsetattr(STDIN_FILENO, TCSADRAIN, &raw) != 0) {
        return false;
    }
    return true;
}
void restoreMode(const TermiosSettings& settings) {
    tcsetattr(STDIN_FILENO, TCSADRAIN, &settings.original);
    std::cout << "\n"; // Ensure a newline after exit
}
void saveCursorPosition() {
    // ANSI code: Save cursor position
    std::cout << "\033[s" << std::flush;
}
void clearOutput() {
    // 1. Move cursor to saved position
    std::cout << "\033[u"; 
    // 2. Clear from cursor to end of screen
    std::cout << "\033[J" << std::flush;
}
bool commandOutput(std::wstring command, std::vector<std::wstring>& lines) {
    int pipefd[2];
    if (pipe(pipefd) == -1) return false;
    pid_t pid = fork();
    if (pid == -1) {
        close(pipefd[0]); close(pipefd[1]);
        return false;
    }
    if (pid == 0) {
        close(pipefd[0]);
        dup2(pipefd[1], STDOUT_FILENO);
        dup2(pipefd[1], STDERR_FILENO);
        close(pipefd[1]);
        // Convert wstring command to UTF-8 narrow string
        std::wstring_convert<std::codecvt_utf8<wchar_t>> conv;
        std::string narrowCommand = conv.to_bytes(command);
        execl("/bin/sh", "sh", "-c", narrowCommand.c_str(), nullptr);
        _exit(127);
    } else {
        close(pipefd[1]);
        size_t originalSize = lines.size();
        size_t writeIdx = 0;
        std::wstring currentLine;
        char buffer[4096];
        ssize_t bytesRead;
        auto commitLine = [&](std::wstring& line) {
            if (writeIdx < originalSize) {
                lines[writeIdx] = std::move(line);
            } else {
                lines.push_back(std::move(line));
            }
            writeIdx++;
            line.clear();
        };
        while ((bytesRead = read(pipefd[0], buffer, sizeof(buffer))) > 0) {
            for (ssize_t i = 0; i < bytesRead; ++i) {
                if (buffer[i] == '\n') {
                    if (!currentLine.empty() && currentLine.back() == L'\r') {
                        currentLine.pop_back();
                    }
                    commitLine(currentLine);
                } else {
                    // Convert char to wchar_t (assuming UTF-8 input)
                    unsigned char c = buffer[i];
                    currentLine += static_cast<wchar_t>(c);
                }
            }
        }
        if (!currentLine.empty()) {
            commitLine(currentLine);
        }
        // Fill remaining original slots with empty strings
        for (size_t i = writeIdx; i < originalSize; ++i) {
            lines[i] = L"";
        }
        close(pipefd[0]);
        int status;
        waitpid(pid, &status, 0);
        return WIFEXITED(status) && WEXITSTATUS(status) == 0;
    }
}
bool changeDirectory(std::wstring path) {
    std::wstring_convert<std::codecvt_utf8<wchar_t>> conv;
    std::string narrowPath = conv.to_bytes(path);
    return chdir(narrowPath.c_str()) == 0;
}
std::vector<std::wstring> split(const std::wstring& input, wchar_t delimiter) {
    std::vector<std::wstring> tokens;
    std::wstring current;
    for (wchar_t ch : input) {
        if (ch == delimiter) {
            tokens.push_back(current);
            current.clear();
        } else {
            current += ch;
        }
    }
    if (!current.empty()) {
        tokens.push_back(current);
    }
    return tokens;
}
std::vector<std::string> split(const std::string& input, char delimiter) {
    std::vector<std::string> tokens;
    std::string current;
    for (char ch : input) {
        if (ch == delimiter) {
            tokens.push_back(current);
            current.clear();
        } else {
            current += ch;
        }
    }
    if (!current.empty()) {
        tokens.push_back(current);
    }
    return tokens;
}
void openTerminal(const std::filesystem::path& path, const std::string& term) {
    pid_t pid = fork();
    if (pid == 0) {
        if(term.empty()) {
            execlp("xterm", "xterm", "-e",
                   ("cd " + path.string() + " && bash").c_str(),
                   nullptr);
        } else {
            execlp(term.c_str(), term.c_str(), "-e",
                   ("cd " + path.string() + " && bash").c_str(),
                   nullptr);
        }
        _exit(127); // exec failed
    }
}
std::wstring utf8_to_wstring(const std::string& str) {
    iconv_t cd = iconv_open("WCHAR_T", "UTF-8");
    if (cd == (iconv_t)-1) {
        throw std::runtime_error("iconv_open failed");
    }
    size_t in_bytes = str.size();
    const char* in_ptr_const = str.data();
    char* in_ptr = const_cast<char*>(in_ptr_const);
    // Worst case: 1 UTF-8 byte → 1 wchar_t (but wchar_t may be 4 bytes)
    size_t out_bytes = (in_bytes + 1) * sizeof(wchar_t);
    std::vector<char> buffer(out_bytes);
    char* out_ptr = buffer.data();
    size_t out_bytes_left = out_bytes;
    size_t res = iconv(cd, &in_ptr, &in_bytes, &out_ptr, &out_bytes_left);
    if (res == (size_t)-1) {
        iconv_close(cd);
        throw std::runtime_error("iconv conversion failed");
    }
    iconv_close(cd);
    // Calculate how many wchar_t were written
    size_t bytes_written = out_bytes - out_bytes_left;
    size_t wchar_count = bytes_written / sizeof(wchar_t);
    wchar_t* wdata = reinterpret_cast<wchar_t*>(buffer.data());
    return std::wstring(wdata, wchar_count);
}

//
TerminalExplorer::TerminalExplorer() {
    this->updateLsCommand();
    this->currentDir = std::filesystem::current_path();
    this->path2index[this->currentDir] = 0;
}
int TerminalExplorer::getIndex(const std::filesystem::path& dirPath) { 
    if ( this->path2index.count(dirPath) == 0 ) return 0;
    if ( this->path2index[dirPath] < 0 ) {
        this->path2index[dirPath] = 0;
    }
    return this->path2index[dirPath];
}
void TerminalExplorer::update() { 
    std::wcout << "Current Directory :" << this->currentDir << std::endl;
    std::wcout << "1. q : exit" << std::endl;
    std::wcout << "2. t : open terminal in current directory" << std::endl;
    std::wcout << "3. Arrow Keys : navigation" << std::endl;
    std::wcout << "4. Home, End : fast navigation" << std::endl;
    std::wcout << std::endl;
    if ( this->updateLsCommand() ) { 
        int it = 0;
        for(const std::wstring& item: this->lines) {
            if (item.empty()) break; 
            int index = getIndex(this->currentDir);
            if ( it == index - this->range ) {
                std::wcout << "..." << std::endl;
                it++;
                continue; 
            }
            if ( it < index - this->range ) { 
                it++;
                continue; 
            }
            if ( it > index + this->range ) { 
                std::wcout << "..." << std::endl;
                break; 
            }
            if ( index == it ) {
                std::wcout << "> " << item << " <" << std::endl;
            } else {
                std::wcout << item << std::endl;
            }
            it++;
        }
    }
}
void TerminalExplorer::up(int step) {
    int count = 0;
    if ( this->path2index.count(this->currentDir)==0 ) return ;
    int currentIndex = this->path2index[this->currentDir];
    currentIndex=currentIndex-step;
    if ( currentIndex < 0 ) return;
    this->path2index[this->currentDir] = currentIndex;
}
void TerminalExplorer::down(int step) {
    int count = 0;
    if ( this->path2index.count(this->currentDir)==0 ) return ;
    int currentIndex = this->path2index[this->currentDir];
    // -- 
    for(const std::wstring& item: this->lines) {
        if (item.empty()) continue; 
        count++;
    }
    if (count == 0) return; 
    currentIndex=currentIndex+step;
    if ( currentIndex>=count ) return;
    this->path2index[this->currentDir] = currentIndex;
}
void TerminalExplorer::left() {
    changeDirectory(L"..");
    this->currentDir = std::filesystem::current_path();
    if ( this->path2index.count(this->currentDir) == 1 ) return;
    this->path2index[this->currentDir] = 0;
}
void TerminalExplorer::right() {
    int index = this->getIndex(this->currentDir);
    if (index<0 || index >= this->raw_lines.size() ) return; 
    std::wstring str_path = split(this->raw_lines[index],L' ').back();
    std::filesystem::path path(str_path);
    if (!std::filesystem::exists(path)) return; 
    if (!std::filesystem::is_directory(path)) return;    
    changeDirectory(str_path);
    this->currentDir = std::filesystem::current_path();
    if ( this->path2index.count(this->currentDir) == 1 ) return;
    this->path2index[this->currentDir] = 0;
}
void TerminalExplorer::openTerminal() {
    ::openTerminal( this->currentDir, this->terminal );
}
bool TerminalExplorer::updateLsCommand() {
    //std::wstring grep_cmd = L"";
    std::wstring cmd = L"ls -la --human-readable --no-group --group-directories-first "+this->currentDir.wstring();
    //if(!this->grep_arg.empty()) { 
    //    grep_cmd = L" | grep -iE '"+this->grep_arg+L"'"; 
    //} 
    return 
        commandOutput(cmd+L" --color=always", this->lines ) &&
        commandOutput(cmd, this->raw_lines)
    ;
}

/// END CODEX_termios.h 