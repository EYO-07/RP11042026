/// BEGIN CODEX_termios.h 

// -- preprocessor directives
#include "CODEX_termios.h"

// -- local functions
std::string wstringToUtf8(const std::wstring& wide) {
    if (wide.empty()) return "";
    iconv_t cd = iconv_open("UTF-8", "WCHAR_T");
    if (cd == (iconv_t)-1) {
        throw std::runtime_error("iconv_open failed: " + std::string(strerror(errno)));
    }
    // iconv expects char**, so we cast the wstring data
    char* inBuf = const_cast<char*>(reinterpret_cast<const char*>(wide.data()));
    size_t inBytesLeft = wide.size() * sizeof(wchar_t);
    // Estimate output buffer size (UTF-8 max 4 bytes per char, plus safety margin)
    size_t outBytesLeft = inBytesLeft * 4 + 16; 
    std::string outBuf(outBytesLeft, '\0');
    char* outPtr = outBuf.data();
    size_t result = iconv(cd, &inBuf, &inBytesLeft, &outPtr, &outBytesLeft);
    iconv_close(cd);
    if (result == (size_t)-1) {
        throw std::runtime_error("iconv conversion failed: " + std::string(strerror(errno)));
    }
    // Resize to actual used length
    outBuf.resize(outBuf.size() - outBytesLeft);
    return outBuf;
}

// -- implementations 
bool disableRawMode(termios& settings) {
    if (tcgetattr(STDIN_FILENO, &settings) != 0) {
        return false;
    }
    termios raw = settings;
    // Disable canonical mode (line buffering) and echo
    raw.c_lflag &= ~(ICANON | ECHO);
    // Disable signals like Ctrl+C for custom handling if needed
    // raw.c_lflag &= ~(ISIG); 
    if (tcsetattr(STDIN_FILENO, TCSADRAIN, &raw) != 0) {
        return false;
    }
    return true;
}
void restoreMode(const termios& settings) {
    tcsetattr(STDIN_FILENO, TCSADRAIN, &settings);
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
        //std::wstring_convert<std::codecvt_utf8<wchar_t>> conv;
        //std::string narrowCommand = conv.to_bytes(command);
        try {
            std::string narrowCommand = wstringToUtf8(command);
            execl("/bin/sh", "sh", "-c", narrowCommand.c_str(), nullptr);
        } catch(...) {
            // todo 
        }
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
                if(line.compare(lines[writeIdx])!=0)
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
                    unsigned char c = buffer[i];
                    currentLine += static_cast<wchar_t>(c);
                }
            }
        }
        if (!currentLine.empty()) commitLine(currentLine);
        // Fill remaining original slots with empty strings
        int it_count = 0;
        for (size_t i = writeIdx; i < originalSize; ++i) {
            if(it_count>5) break;
            lines[i] = L"";
            it_count++;
        }
        close(pipefd[0]);
        int status;
        waitpid(pid, &status, 0);
        return WIFEXITED(status) && WEXITSTATUS(status) == 0;
    }
}
bool changeDirectory(const std::wstring& path) {
    try {
        std::filesystem::current_path(path);
        return true;
    } catch (const std::filesystem::filesystem_error&) {
        return false;
    }
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


std::wstring getTimeStamp() {
fail:
    return L"YYYY-MM-DDT00-00-00";
}

bool saveFile(std::filesystem::path dest, std::wstring filename, std::wstring content) {
    // ...
fail:
    return false;    
}

bool createCopyToBashScript(std::set<std::filesystem::path> list, std::filesystem::path dest) {
    if (list.empty()) return false;
    if (!dest.is_absolute()) return false;
    if (!std::filesystem::exists(dest)) return false;
    // ...    
fail:
    return false;
}

bool createMoveToBashScript(std::set<std::filesystem::path> list, std::filesystem::path dest) {
    if (list.empty()) return false;
    if (!dest.is_absolute()) return false;
    if (!std::filesystem::exists(dest)) return false;
    // ...    
fail:    
    return false;
}

bool createDeleteBashScript(std::set<std::filesystem::path> list) {
    if (list.empty()) return false;
    // ...    
fail:    
    return false;
}

// -- classes
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
    std::wcout << "-> Script Drop Directory :" << this->dropDir << std::endl;
    std::wcout << "1. q : exit -- u : update current directory list" << std::endl;
    std::wcout << "2. t : open terminal (" << utf8_to_wstring(this->terminal) << ") in current directory" << std::endl;
    std::wcout << "3. i,j,k,l : navigation -- y, h : fast navigation" << std::endl;
    std::wcout << "4. s,d : select/deselect files" << std::endl;
    coutSelectedFiles();
    if ( this->b_update_ls_list ) this->updateLsCommand(); 
    int it = 0;
    if (this->lines.size()>3) {
        if ( getIndex(this->currentDir)==0 )
            this->path2index[this->currentDir] = 3;
    }
    std::wstring current = L"";
    std::wstring is_selected = L"";
    for(const std::wstring& item: this->lines) {
        if (item.empty()) break; 
        int index = getIndex(this->currentDir);
        is_selected = this->isLineSelectedItem(it) ? L" * " : L"";
        if ( it == index - this->range ) {
            std::wcout << L"..." << std::endl;
            it++;
            continue; 
        }
        if ( it < index - this->range ) { 
            it++;
            continue; 
        }
        if ( it > index + this->range ) { 
            std::wcout << L"..." << std::endl;
            break; 
        }
        if ( index == it ) {
            std::wcout << L">  " << item << is_selected << L"  <" << std::endl;
            current = item;
        } else {
            std::wcout << L"   " << item << is_selected << std::endl;
        }
        it++;
    }
    std::wcout << std::endl;
    std::wcout << L"Current File/Folder: " << current << L" ";    
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
    std::filesystem::path path = getPathFromLine(index);
    if (path.empty()) return;
    if (!std::filesystem::is_directory(path)) return;    
    changeDirectory(path.wstring());
    this->currentDir = std::filesystem::current_path();
    if ( this->path2index.count(this->currentDir) == 1 ) return;
    this->path2index[this->currentDir] = 0;
}
void TerminalExplorer::openTerminal() {
    ::openTerminal( this->currentDir, this->terminal );
}
bool TerminalExplorer::updateLsCommand() {
    std::wstring cmd = L"ls -la --human-readable --no-group --group-directories-first "+this->currentDir.wstring();
    return 
        commandOutput(cmd+L" --color=always", this->lines ) &&
        commandOutput(cmd, this->raw_lines)
    ;
}
void TerminalExplorer::coutSelectedFiles() {
    int count = 1;
    if ( this->selected_files.size()==0 ) goto end;
cout_display:
    std::wcout << std::endl;
    std::wcout << "Selected Files:" << std::endl;
    for(const auto& item: this->selected_files) {
        std::wcout << count << ". " << item << std::endl;
        count++;
    }
end:    
    std::wcout << std::endl;
}
std::filesystem::path TerminalExplorer::getPathFromLine(int index) {
    std::wstring str_path = L"";
    std::filesystem::path path;
    if (index<0 || index >= this->raw_lines.size() ) goto fail;     
    str_path = this->raw_lines[index];
    if ( str_path.empty() ) goto fail;
    str_path = split(str_path,L' ').back();
    if ( str_path.empty() ) goto fail;
    path = std::filesystem::path(str_path);
    if (path.empty()) goto fail;
    if (!std::filesystem::exists(path)) goto fail;
    return path;
fail:
    return std::filesystem::path{};
} 
void TerminalExplorer::selectFile() {
    int index = getIndex(this->currentDir);
    std::filesystem::path path = getPathFromLine(index);
    if (path.string().compare(".")==0 || path.string().compare("..")==0) return;
    if (path.empty()) return;
    this->selected_files.insert( std::filesystem::absolute(path) );
}
void TerminalExplorer::deselectFile() {
    int index = getIndex(this->currentDir);
    std::filesystem::path path = getPathFromLine(index);
    if (path.string().compare(".")==0 || path.string().compare("..")==0) return;
    if (path.empty()) return;
    this->selected_files.erase( std::filesystem::absolute(path) );
}
bool TerminalExplorer::isLineSelectedItem(int index) {
    std::filesystem::path path = getPathFromLine(index);
    if (path.string().compare(".")==0 || path.string().compare("..")==0) return false;
    if (path.empty()) return false;
    return this->selected_files.contains( std::filesystem::absolute(path) );
}

/// END CODEX_termios.h 





