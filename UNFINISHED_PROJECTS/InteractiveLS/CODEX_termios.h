/// BEGIN CODEX_termios.h 

// -- preprocessor directives
#pragma once 
#include <iostream>
#include <termios.h>
#include <unistd.h>
#include <vector>
#include <string>
#include <sstream>
#include <cstring>
#include <sys/wait.h>
#include <fcntl.h>
#include <array>
#include <filesystem>
#include <unordered_map>
#include <iconv.h>
#include <stdexcept>
#include <codecvt>
#include <locale>

// -- forward declarations 
struct TermiosSettings;

// -- function declarations
bool disableRawMode(TermiosSettings& settings); // Disable echo and set raw mode
void restoreMode(const TermiosSettings& settings); // Restore terminal settings
void saveCursorPosition(); // Necessary for clearOutput to know where to start clearing 
void clearOutput();
bool commandOutput(std::wstring command, std::vector<std::wstring>& lines);
bool changeDirectory(std::wstring path);
std::vector<std::wstring> split(const std::wstring& input, wchar_t delimiter);
std::vector<std::string> split(const std::string& input, char delimiter);
void openTerminal(const std::filesystem::path& path, const std::string& term);

// -- classes and structs
struct TermiosSettings { // Struct to store original terminal settings
    termios original;
};
struct Cleanup { // Ensure restoration on exit
    const TermiosSettings* s;
    ~Cleanup() { restoreMode(*s); }
};
// 
class TerminalExplorer {
public:    
    TerminalExplorer();
    std::vector<std::wstring>& getLines() { return this->lines; }
    void update();
    void up(int step = 1);
    void down(int step = 1);
    void left();
    void right();
    int getIndex(const std::filesystem::path&);
    //void setIndex(const std::filesystem::path&);
    void setTerminal(std::string term) { this->terminal = term; }
    void openTerminal();
private:
    std::vector<std::wstring> lines;
    std::vector<std::wstring> raw_lines;
    std::filesystem::path currentDir;
    std::unordered_map<std::filesystem::path, int> path2index;
    int range = 15;
    std::string terminal = "xterm";
    // -- methods
    bool updateLsCommand();
};


/// END CODEX_termios.h 