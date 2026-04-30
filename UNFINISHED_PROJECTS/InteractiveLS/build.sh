# 
clear 

# -- gcc
g++ -std=c++20 \
    main.cpp \
    CODEX_termios.cpp \
-o ils
        
# -- 
echo "Script Finished"