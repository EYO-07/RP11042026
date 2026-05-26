/// BEGIN GOLEM main.cpp { termios }

// -- preprocessor directives 
#include "CODEX_termios.h"

static std::string USAGE_TEXT = R"(
Usage: <application> [options]

Options:
    --help                              Show usage.
    --terminal=<terminal_application>   Set the terminal application.
)";

// -- ENTRY POINT 
int main(int argc, char *argv[]) {
    // -- components
    bool b_exit = false;
    termios settings;
    TerminalExplorer Explorer = TerminalExplorer();
    // -- arguments 
    if (argc>1) { // processing argument options
        int i;
        for (int i = 1; i < argc; ++i) {
            std::string strArgument = argv[i];
            std::wstring wstrArgument = utf8_to_wstring(strArgument);
            if( strArgument.starts_with("--terminal") ) {
                Explorer.setTerminal( split(strArgument,'=').back() );
            }
            if( strArgument.starts_with("--help") ) {
                std::cout << USAGE_TEXT << std::endl;
                b_exit = true;
                break;
            }
        }
    }
    // -- start 
    if (!disableRawMode(settings)) {
        std::cout << std::endl;
        std::cerr << "Failed to set raw mode." << std::endl;
        return 1;
    }
    if (b_exit) return 0;
    saveCursorPosition();
    std::wcout << std::endl;
    std::wcout << L"Last key: [ ]\n";
    std::wcout << std::endl;
    Explorer.update();    
    char key;
    while (!b_exit) {
        if (read(STDIN_FILENO, &key, 1) == 1) {
            if (key == 'q' || key == 'Q') break;
            clearOutput();
            std::wcout << std::endl;
            std::wcout << L"\033[2KLast key: [" << key << L"]\n";
            std::wcout << std::endl;
            if (key=='A') Explorer.up();
            if (key=='B') Explorer.down();
            if (key=='C') Explorer.right();
            if (key=='D') Explorer.left();
            if (key=='t') Explorer.openTerminal();
            if (key=='H') Explorer.up(10);
            if (key=='F') Explorer.down(10);
            if (key=='s') Explorer.selectFile(); // select current file or directory
            if (key=='d') Explorer.clearSelectedFiles(); // select current file or directory
            if (key=='m') ; // move selected to current directory
            if (key=='c') ; // copy selected to current directory
            Explorer.update();
            std::cout.flush(); // Force output immediately
        }
    }
    // 
end_main:
    restoreMode(settings);
    return 0;
}

/// END GOLEM main.cpp { termios }