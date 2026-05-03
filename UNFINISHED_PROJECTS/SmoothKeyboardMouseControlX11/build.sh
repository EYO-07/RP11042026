# build 
clear 
# -- gcc
g++ -std=c++20 -fpermissive \
    main.cpp \
    CODEX_X11KMC.cpp \
-lX11 -o keyboardMouseControlX11
# -- 
echo "Script Finished"    