# {Notepad--T;Cyan:Inventory;Silver:Logic,Dialetic;lightgreen:HowTo} 

# MinimalLinuxOS 
# 1. Debian without pre-installed desktop envinronment 

# HowTo [ install minimal debian ]
# 1. Download the ISO with netinst amd 
# 2. Create a bootable USB 
# 3. Install a Boot Installer 
# 4. Uncheck all but standart system utilities 
# 5. Create a root password and a user+password 

# Etapas de Instalação :
# 1. Seleção de Interface de Instalação.
# 2. Seleção de Linguagem de Instalação.
# 3. Seleção de Linguagem , Localização, Teclado
# 4. Configuração o de Rede
# 5. Seleção de Endereços de Repositórios
# 6. Registro de Hostname : Nome do Computador
# 7. Registro de Dom ´ı nio : Desnecess ´a rio para uso dom ´e stico .
# 8. Criação da senha para o root
# 9. Criação do do login e senha para o primeiro usuário
# 10. Configuração do Relógio pela Localização
# 11. Particionamento
# 12. Instalação Básica
# 13. Seleção de Softwares Iniciais
# 14. Instalação do Bootloader no MBR / ESP

# -- DIALETICS -- 

# -- INVENTORIES --

# Inventory [ Linux Partitions ]
# 1. root    ( /       ) ; core system files, binaries, and configurations
# 2. home    ( /home   ) ; user personal files, settings, and directories
# 3. swap    ( -       ) ; overflow space when RAM is full, also used for hibernation
# 4. boot    ( /boot   ) ; kernel images and bootloader files (e.g. GRUB)
# 5. efi     ( /boot/efi ) ; EFI partition required for UEFI-based systems
# 6. var     ( /var    ) ; variable data: logs, caches, spool files, databases
# 7. tmp     ( /tmp    ) ; temporary files, cleared on reboot
# 8. usr     ( /usr    ) ; user-installed programs, libraries, and shared data
# 9. opt     ( /opt    ) ; optional third-party software packages
# 10. srv    ( /srv    ) ; data served by the system (web, FTP, etc.)
# -------------------------------------
# * How much swap a system needs ? 8 ram ~ 4 gb 
# * Considering a simple (/boot+/+/swap) partition scheme, how much space is recommended for / ? 100 GB
# * How safe is to shrink a in-use partition in ssd to create new partitions ? 
# * How to prevent linux to mess with another ssd os ? Create a dedicated /boot/efi partition on the ssd 
# -> lsblk -f ; check mounted partitions
# -> cat /etc/fstab ; check mounted partitions
# -> cd /boot/efi && efibootmgr -v ; check boot/efi 

# Inventory [ Linux Initialization & Configuration Files ]
#
# --- BOOT & BOOTLOADER ---
# /boot/grub/grub.cfg          ; GRUB main config (auto-generated, do not edit directly)
# /etc/default/grub             ; GRUB user-facing settings (timeout, kernel params, etc.)
# /etc/grub.d/                  ; scripts used to build grub.cfg
#
# --- SYSTEM INITIALIZATION ( systemd ) ---
# /etc/systemd/system/          ; user-defined units and overrides (services, timers, etc.)
# /lib/systemd/system/          ; default units provided by packages
# /etc/systemd/system.conf      ; global systemd settings (timeout, log level, etc.)
# /etc/systemd/journald.conf    ; journal logging configuration
# /etc/systemd/logind.conf      ; login/session behavior (lid close, power button, etc.)
#
# --- USERS & GROUPS ---
# /etc/passwd                   ; user accounts (name, uid, shell, home dir)
# /etc/shadow                   ; hashed passwords and password policies
# /etc/group                    ; group definitions and memberships
# /etc/sudoers                  ; sudo privileges (edit via visudo only)
# /etc/sudoers.d/               ; modular sudo rules dropped in by packages
#
# --- NETWORK ---
# /etc/network/interfaces       ; network interface config (Debian classic)
# /etc/NetworkManager/          ; NetworkManager config directory (desktop systems)
# /etc/systemd/network/         ; systemd-networkd config files
# /etc/resolv.conf              ; DNS resolver settings (often managed automatically)
# /etc/hosts                    ; static hostname to IP mappings
# /etc/hostname                 ; system hostname
#
# --- PACKAGE MANAGEMENT ---
# /etc/apt/sources.list         ; APT repository list (Debian/Ubuntu)
# /etc/apt/sources.list.d/      ; modular repo files added by packages or user
# /etc/apt/apt.conf.d/          ; APT behavior settings
#
# --- SHELL & ENVIRONMENT ---
# /etc/environment              ; system-wide environment variables (plain key=value)
# /etc/profile                  ; system-wide shell init for login shells
# /etc/profile.d/               ; modular scripts sourced by /etc/profile
# /etc/bash.bashrc              ; system-wide bashrc for interactive shells
# ~/.bashrc                     ; user bashrc (aliases, functions, prompt)
# ~/.bash_profile               ; user login shell init
# ~/.profile                    ; user-level env vars (POSIX, used by multiple shells)
#
# --- LOCALE & TIME ---
# /etc/locale.conf              ; system language and locale settings
# /etc/timezone                 ; timezone name (e.g. America/New_York)
# /etc/localtime                ; symlink to the active timezone binary
#
# --- HARDWARE & KERNEL ---
# /etc/fstab                    ; filesystem mount table (partitions, options, order)
# /etc/crypttab                 ; encrypted volumes to unlock at boot
# /etc/modules                  ; kernel modules to load at startup
# /etc/modprobe.d/              ; module loading options and blacklists
# /etc/sysctl.conf              ; kernel runtime parameters (networking, memory, etc.)
# /etc/sysctl.d/                ; modular sysctl config files
# /etc/udev/rules.d/            ; device detection and naming rules
#
# --- SECURITY ---
# /etc/pam.d/                   ; Pluggable Authentication Modules config
# /etc/security/limits.conf     ; per-user resource limits (open files, processes, etc.)
# /etc/ssh/sshd_config          ; SSH server configuration
# /etc/hosts.allow              ; TCP wrappers whitelist
# /etc/hosts.deny               ; TCP wrappers blacklist

# Inventory [ System Basics ] { Linux Bash }
# 1. root + rootpassword ; login as root (if enabled)
# 2. login USERNAME ; login as user (tty)
# 3. logout ; logout current session
# 4. exit ; exit shell session
# 5. whoami ; show current user
# 6. id ; show user id (uid, gid, groups)
# 7. passwd ; change current user password
# 8. passwd USERNAME ; change password for user (root only)
# 9. adduser USERNAME ; create new user (interactive)
# 10. userdel USERNAME ; delete user
# 11. usermod -aG sudo USERNAME ; add user to sudo group
# 12. groups USERNAME ; show groups of user
# 13. su USERNAME ; switch user (keep environment)
# 14. su - ; switch to root with full login shell
# 15. sudo COMMAND ; run command as root, sudo need to be installed first!
# 16. sudo -i ; open root login shell via sudo
# 17. hostname ; show system hostname
# 18. hostnamectl set-hostname NAME ; change hostname
# -> lsblk -l ; to see the names of mounting points
# -> udiskctl mount -b /dev/sda1 ; sda1 should be the correct name of the drive 

# Inventory [ Keyboard Settings ] { Linux Bash }
# -> sudo dpkg-reconfigure keyboard-configuration
# -> setxkbmap -query 
# -> setxkbmap br ; to change keyboard layout to br 
# -> setxkbmap -option keypad:pointerkeys

# Inventory [ Installation of Basic Tools ] { Linux Bash }
# -> apt install xorg menu dbus-x11
# -> nano /etc/apt/sources.list ; change source list 

# Inventory [ Installation of Basic Tools After WM ] { Linux Bash }
# -> apt install firefox-esr 
# -> apt install gpg wget apt-transport-https

# Inventory [ System Tools ] { Linux Bash }
# 1. apt update ; refresh package list
# 2. apt upgrade ; upgrade installed packages
# 3. apt install PACKAGE ; install package
# 4. apt remove PACKAGE ; remove package
# 5. apt purge PACKAGE ; remove package + config files
# 6. apt search KEYWORD ; search package
# 7. dpkg -l ; list installed packages
# 8. systemctl status SERVICE ; check service status
# 9. systemctl start SERVICE ; start service
# 10. systemctl stop SERVICE ; stop service
# 11. systemctl enable SERVICE ; enable service at boot
# 12. systemctl disable SERVICE ; disable service at boot
# 13. sudo reboot ; reboot system
# 14. sudo shutdown now ; shutdown immediately
# 15. sudo shutdown -h now ; power off
# 16. timedatectl ; show date/time settings
# 17. date ; show current date/time
# 18. uptime ; show system uptime
# 19. free -h ; show memory usage
# 20. df -h ; show disk usage
# 21. lsblk ; list block devices
# 22. mount ; show mounted filesystems
# 23. umount DEVICE ; unmount device
# 24. dmesg | less ; show kernel messages
# 25. journalctl -xe ; show system logs
# 26. top ; real-time process viewer
# 27. htop ; enhanced process viewer (if installed)
# 28. ps aux ; list running processes
# 29. kill PID ; terminate process
# 30. kill -9 PID ; force terminate process

# Inventory [ Graphical Server ] { Linux Bash }
# 1. apt install xorg ; install X11 graphical server
# 2. apt install xserver-xorg-core ; install core X server only
# 3. apt install xinit ; install startx utility
# 4. apt install x11-xserver-utils ; basic X utilities
# 5. apt install xterm ; minimal X terminal
# 6. startx ; start graphical session manually
# 7. echo "exec PROGRAM" > ~/.xinitrc ; define startup program
# 8. nano ~/.xinitrc ; edit X session startup file
# 9. chmod +x ~/.xinitrc ; ensure executable (optional)
# 10. Ctrl+Alt+Backspace ; terminate X session (if enabled)
# 11. apt install xwayland ; install Wayland protocol (rarely standalone)
# 12. echo $DISPLAY ; check active X display
# 13. export DISPLAY=:0 ; manually set display
# 14. xdpyinfo ; show X server information
# 15. xrandr ; manage screen resolution
# 16. xset -dpms ; disable screen blanking
# 17. xset s off ; disable screen saver

# Inventory [ Graphical Drivers ] { Linux Bash }
# -> /etc/apt/sources.list should have contrib non-free-firmware on each line 
# -> apt install firmware-linux firmware-linux-nonfree firmware-misc-nonfree
# -> apt install nvidia-detect 
# -> apt install nvidia-driver 
# -> apt install xserver-xorg-video-amdgpu 
# -> cat /sys/module/nvidia_drm/parameters/modeset ; verify if DRM is enable, which is necessary for dual-mode 
# -> nano /etc/default/grub ; add GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nvidia-drm.modeset=1" to activate dual-mode and do update-grub reboot 
# -> xrandr --listproviders
# -> xrandr --query 
# -> xrandr --setprovideroutputsource provider1 provider2 
# -> xrandr --output DP-1 --auto --right-of HDMI-1
# -> xrandr --output DISPLAY1 --primary --auto --output DISPLAY2 --auto --right-of DISPLAY1 ; dual mode monitor 
# -> xrandr --output DISPLAY --brightness FLOAT ; set brightness for desktop adjusting gamma 

# Inventory [ i3 initialization config ] { Linux Bash }
# -> setxkbmap -option keypad:pointerkeys ; for mouse keyboard control 
# -> exec_always --no-startup-id COMMAND ; put this to execute always on startx 

# Inventory [ Audio Server ] { Linux Bash }
# -> apt install alsa-utils ; basic sound utilities 
# -> apt install pipewire pipewire-audio-client-libraries wireplumber
# -> aplay -l ; list devices 
# -> amixer scontrols ; query 
# -> wpctl status ; query after initialization of pipewire wireplumber pipewire-pulse servers 
# -> wpctl set-default ID ; change the default sink (output hardware)
# -> systemctl --user status pipewire pipewire-pulse wireplumber ; checks if systemd is initializing the sound servers 
# -> speaker-test -c 2 -D pulse ; test the sound server 

# Inventory [ xdotool ] { Linux }
# 1. xdotool mousemove X Y ; Move mouse to absolute screen position (pixels)
# 2. xdotool mousemove_relative DX DY ; Move mouse relative to current position
# 3. xdotool click BUTTON ; Mouse click (1=left, 2=middle, 3=right)
# 4. xdotool mousedown BUTTON ; Press and hold mouse button
# 5. xdotool mouseup BUTTON ; Release mouse button
# 6. xdotool type "text" ; Simulate typing text
# 7. xdotool key KEY ; Send key press (e.g., Return, Ctrl+c, Alt+F4)
# 8. xdotool keydown KEY ; Press and hold key
# 9. xdotool keyup KEY ; Release key
# 10. xdotool search --name "window" ; Search window by title
# 11. xdotool search --class "class" ; Search window by class
# 12. xdotool windowactivate WINDOW_ID ; Focus and raise window
# 13. xdotool windowfocus WINDOW_ID ; Focus window without raising
# 14. xdotool windowmove WINDOW_ID X Y ; Move window to position
# 15. xdotool windowsize WINDOW_ID W H ; Resize window
# 16. xdotool getmouselocation ; Print current mouse position
# 17. xdotool getwindowfocus ; Get currently focused window ID
# 18. xdotool behave WINDOW_ID event command ; Attach command to window event
# 19. xdotool exec --sync command ; Run command and wait for window to appear
# 20. xdotool sleep SECONDS ; Pause execution
# 21. sudo apt install xdotool 

# Inventory [ xdotool ] { Linux Automation }
# -----------------------------------------------------------------------------
# [ INSTALLATION ]
# 1. sudo apt install xdotool // Installs the X11 automation tool.
#
# [ MOUSE MOVEMENT ]
# 2. xdotool mousemove X Y // Moves cursor to absolute coordinates (0 0 is top-left).
# 3. xdotool mousemove_relative [--] DX DY // Moves cursor relative to current spot; use -- for negative values.
# 4. xdotool getmouselocation // Returns X, Y, screen number, and window ID under cursor.
#
# [ CLICKING & SCROLLING ]
# 5. xdotool click [1|2|3] // Simulates instant press/release (1=Left, 2=Middle, 3=Right).
# 6. xdotool click [4|5] // Simulates Mouse Wheel Scroll (4=Up, 5=Down).
# 7. xdotool click [6|7] // Simulates Horizontal Scroll (6=Left, 7=Right).
# 8. xdotool click --repeat N --delay MS B // Clicks button 'B', 'N' times, with 'MS' milliseconds between.
# 9. xdotool mousedown/mouseup B // Manual control for click-and-drag operations.
#
# [ KEYBOARD SIMULATION ]
# 10. xdotool key [keysym] // Sends a stroke (e.g., "ctrl+alt+t", "Return", "space").
# 11. xdotool type --delay MS "text" // Types a string with a realistic delay between characters.
# 12. xdotool keydown/keyup [keysym] // Holds or releases a key (crucial for custom modifiers).
#
# [ WINDOW MANAGEMENT ]
# 13. xdotool getactivewindow // Returns the ID of the currently focused window.
# 14. xdotool windowactivate [ID] // Focuses and brings the specified window to the front.
# 15. xdotool windowsize [ID] W H // Resizes window to specific Width and Height.
# 16. xdotool windowmove [ID] X Y // Moves window to specific coordinates.
# 17. xdotool search --name "string" // Finds window IDs matching a specific title.
#
# [ FLOW CONTROL ]
# 18. xdotool sleep SECONDS // Pauses the script; supports decimals (e.g., 0.5).
# 19. xdotool --sync // Flag used with move/focus to wait for the action to finish before next command.
# 20. xdotool behave ID [mouse-click|focus] CMD // Executes CMD when a specific event happens to a window.

# Inventory [ Install/Use Window Managers ] { Linux Bash }
# 1. apt install openbox ; install lightweight stacking WM
# 2. apt install i3 ; install tiling WM (keyboard oriented)
# 3. apt install sway ; install Wayland tiling WM (i3-like)
# 4. apt install fluxbox ; install lightweight stacking WM
# 5. apt install dwm ; install minimal dynamic WM
# 6. apt install awesome ; install programmable WM (Lua)
# 7. echo "exec openbox-session" > ~/.xinitrc ; start openbox via startx
# 8. echo "exec i3" > ~/.xinitrc ; start i3 via startx
# 9. echo "exec sway" > ~/.xinitrc ; start sway (Wayland session)
# 10. startx ; start WM manually (X11)
# 11. Mod+Enter ; open terminal (i3 default)
# 12. Mod+Shift+e ; exit i3 session
# 13. apt install lightdm ; install display manager (login screen)
# 14. systemctl enable lightdm ; enable graphical login at boot
# 15. systemctl set-default graphical.target ; boot into graphical mode
# 16. systemctl set-default multi-user.target ; boot into console mode
# 17. update-alternatives --config x-session-manager ; select default WM

# Inventory [ i3 + picom ] { Linux }
# --------------------------------------------------
# [ i3 – Window Manager ]
# --------------------------------------------------
# 1. i3 ; Start i3 manually inside X
# 2. exec i3 ; Start i3 from .xinitrc
# 3. Mod (default: Super key) ; Main modifier key
# 4. Mod + Enter ; Open terminal
# 5. Mod + D ; Launch dmenu
# 6. Mod + Shift + E ; Exit i3 session
# 7. Mod + Shift + R ; Restart i3
# 8. Mod + Arrow Keys ; Change focus
# 9. Mod + Shift + Arrow ; Move window
# 10. Mod + H / V ; Split horizontal / vertical
# 11. Mod + F ; Toggle fullscreen
# 12. Mod + W ; Tabbed layout
# 13. Mod + S ; Stacking layout
# 14. Mod + E ; Toggle split layout
# 15. Mod + 1–9 ; Switch workspace
# 16. Mod + Shift + 1–9 ; Move window to workspace
# 17. ~/.config/i3/config ; Main configuration file
# 18. bindsym KEY command ; Define keybinding
# 19. exec --no-startup-id program ; Autostart program
# 20. i3-msg reload ; Reload configuration externally
# 21. i3-msg restart ; Restart i3 externally
# --------------------------------------------------
# [ picom – X Compositor ]
# --------------------------------------------------
# 22. picom & ; Start picom in background
# 23. exec picom & ; Start picom from .xinitrc
# 24. ~/.config/picom.conf ; Main configuration file
# 25. backend = "glx"; Use OpenGL backend (recommended)
# 26. vsync = true; Enable vertical sync
# 27. active-opacity = 1.0; Opacity for active window
# 28. inactive-opacity = 0.85; Opacity for inactive windows
# 29. frame-opacity = 0.9; Opacity for window borders
# 30. opacity-rule = [ "80:class_g = 'XTerm'" ]; Per-window transparency rule
# 31. shadow = true; Enable window shadows
# 32. blur-method = "dual_kawase"; Enable background blur (if supported)
# 33. picom --config ~/.config/picom.conf & ; Start picom with explicit config file

# Inventory [ Sway WM and Compositor ] { Linux }
# 1. sudo apt install sway
#    -> Installs the core Sway window manager and Wayland compositor.
# 2. sudo apt install swaybg
#    -> Wallpaper utility for Sway (sets background images).
# 3. sudo apt install swayidle
#    -> Idle management daemon (handles screen blanking, suspend, etc.).
# 4. sudo apt install swaylock
#    -> Screen locker for Sway (secure lock screen).
# 5. sudo apt install waybar
#    -> Modern status bar for Wayland compositors (battery, network, clock, etc.).
# 6. sudo apt install alacritty
#    -> GPU-accelerated terminal emulator (fast and lightweight).
#    -> Alternatives: xterm, gnome-terminal, kitty.
# 7. sudo apt install xwayland
#    -> Compatibility layer to run legacy X11 applications under Wayland.
# 8. sudo apt install fonts-dejavu
#    -> Common font set for proper text rendering.
# 9. mkdir -p ~/.config/sway
#    cp /etc/sway/config ~/.config/sway/
#    -> Copies default config for customization (keybindings, bar, wallpaper).

# Inventory [ Filesystem Operations ] { Linux Bash }
# 1. pwd ; print current directory
# 2. ls ; list directory contents
# 3. ls -la ; list all files (including hidden) with details
# 4. cd DIRECTORY ; change directory
# 5. tree ; show directory tree (if installed)
# 6. mkdir DIRECTORY ; create directory
# 7. mkdir -p PATH ; create nested directories
# 8. rmdir DIRECTORY ; remove empty directory
# 9. rm FILE ; remove file
# 10. rm -r DIRECTORY ; remove directory recursively
# 11. rm -rf DIRECTORY ; force remove recursively
# 12. cp SOURCE DEST ; copy file
# 13. cp -r SOURCE DEST ; copy directory recursively
# 14. mv SOURCE DEST ; move or rename
# 15. ln FILE LINK ; create hard link
# 16. ln -s TARGET LINK ; create symbolic link
# 17. file NAME ; detect file type
# 18. stat FILE ; show file metadata
# 19. du -h ; show directory size
# 20. df -h ; show disk usage by filesystem
# 21. mount DEVICE DIR ; mount filesystem, make the empty dir first 
# 22. umount DEVICE ; unmount filesystem
# 23. lsblk ; list block devices
# 24. blkid ; show device UUIDs
# 25. chown USER:GROUP FILE ; change ownership
# 26. chmod MODE FILE ; change permissions
# 27. find PATH -name NAME ; search file by name
# 28. locate NAME ; search file via index (if installed)
# 29. updatedb ; update locate database
# 30. tar -czf file.tar.gz DIR ; create compressed archive
# 31. tar -xzf file.tar.gz ; extract archive
# -> sudo fsck DISK ; should be unmounted and exist a risk of data corruption 
# -> sudo apt install timeshift ; to take snapshot of the system files
# -> sudo timeshift --create --comments "NAME_OF_SNAPSHOT"
# -> sudo timeshift --restore
# -> dmesg | grep -iE "error|critical|failed" ; check for erros in the log 
# -> sudo apt debsums ; system files check through checksums 
# -> sudo debsums -s ; only system file changes

# Inventory [ Process Control ] { Linux Bash }
# 1. ps aux ; list running processes
# 2. ps -ef ; full process listing
# 3. top ; real-time process monitor
# 4. htop ; enhanced process monitor (if installed)
# 5. atop ; advanced monitor (if installed)
# 6. kill PID ; terminate process
# 7. kill -9 PID ; force terminate
# 8. killall NAME ; kill by process name
# 9. pkill NAME ; kill by pattern
# 10. bg ; resume job in background
# 11. fg ; bring job to foreground
# 12. jobs ; list shell background jobs
# 13. COMMAND & ; run command in background
# 14. nohup COMMAND & ; run immune to logout
# 15. disown ; detach job from shell
# 16. nice -n VALUE COMMAND ; start with priority
# 17. renice VALUE PID ; change priority
# 18. uptime ; show system load
# 19. free -h ; show memory usage
# 20. watch COMMAND ; repeat command periodically
# 21. systemctl status SERVICE ; check service
# 22. systemctl restart SERVICE ; restart service
# 23. systemctl stop SERVICE ; stop service
# 24. systemctl start SERVICE ; start service
# 25. journalctl -u SERVICE ; view service logs

# Inventory [ Firewall basics ] { Linux Bash }
# 1. apt install ufw ; install uncomplicated firewall
# 2. ufw enable ; enable firewall
# 3. ufw disable ; disable firewall
# 4. ufw status ; show firewall status
# 5. ufw status verbose ; detailed status
# 6. ufw allow PORT ; allow port (example: 22)
# 7. ufw deny PORT ; deny port
# 8. ufw allow SERVICE ; allow service (example: ssh)
# 9. ufw delete allow PORT ; remove rule
# 10. ufw reset ; reset all rules
# 11. ufw default deny incoming ; block incoming by default
# 12. ufw default allow outgoing ; allow outgoing by default
# 13. ufw allow from IP ; allow specific IP
# 14. ufw allow from IP to any port PORT ; allow IP to port
# 15. iptables -L ; list iptables rules
# 16. iptables -F ; flush iptables rules
# 17. nft list ruleset ; list nftables rules
# 18. ss -tuln ; list listening ports
# 19. netstat -tuln ; list open ports (legacy)
# 20. systemctl enable ufw ; enable firewall at boot

# Inventory [ Networking ] { Linux Bash }
# 1. ip a ; show network interfaces
# 2. ip link ; show link-layer devices
# 3. ip route ; show routing table
# 4. ip addr add IP/MASK dev IFACE ; assign IP manually
# 5. ip link set IFACE up ; bring interface up
# 6. ip link set IFACE down ; bring interface down
# 7. ping HOST ; test connectivity
# 8. ss -tuln ; list listening ports
# 9. ss -tp ; show active connections
# 10. hostname -I ; show local IP addresses
# 11. curl URL ; fetch URL (CLI HTTP client)
# 12. wget URL ; download file
# 13. apt install net-tools ; install legacy tools
# 14. ifconfig ; show interfaces (legacy)
# 15. netstat -tuln ; show open ports (legacy)
# 16. nmcli device status ; show NetworkManager devices
# 17. systemctl restart networking ; restart networking service
# 18. nano /etc/network/interfaces ; manual interface config
# 19. resolvectl status ; show DNS configuration
# 20. traceroute HOST ; trace network route (if installed)
# -> sudo ifconfig INTERFACENAME up ; ... 
# -> sudo ifconfig INTERFACENAME down ; ...

# Inventory [ Disk & Partitioning ] { Linux Bash }
# 1. lsblk ; list block devices
# 2. blkid ; show device UUIDs and filesystem types
# 3. fdisk -l ; list partitions
# 4. fdisk /dev/sdX ; edit partition table (MBR)
# 5. cfdisk /dev/sdX ; interactive partition editor
# 6. parted /dev/sdX ; edit partition table (GPT)
# 7. mkfs.ext4 /dev/sdX1 ; create ext4 filesystem
# 8. mkfs.vfat /dev/sdX1 ; create FAT32 filesystem
# 9. mkswap /dev/sdX1 ; create swap partition
# 10. swapon /dev/sdX1 ; enable swap
# 11. swapoff /dev/sdX1 ; disable swap
# 12. mount /dev/sdX1 /mnt ; mount partition
# 13. umount /mnt ; unmount partition
# 14. mount -a ; mount all from /etc/fstab
# 15. nano /etc/fstab ; configure persistent mounts
# 16. df -h ; show mounted filesystems usage
# 17. du -sh DIRECTORY ; show directory size
# 18. tune2fs -l /dev/sdX1 ; show ext filesystem info
# 19. fsck /dev/sdX1 ; check filesystem integrity
# 20. dd if=FILE of=/dev/sdX ; raw disk write

# Inventory [ Compilation & Toolchain ] { Linux Bash }
# 1. apt install build-essential ; install GCC + make
# 2. gcc file.c -o program ; compile C program
# 3. g++ file.cpp -o program ; compile C++ program
# 4. make ; run Makefile
# 5. make install ; install compiled program
# 6. ./configure ; prepare source build
# 7. cmake . ; configure CMake project
# 8. ninja ; build with ninja (if installed)
# 9. ld --version ; show linker version
# 10. ldd program ; show shared library dependencies
# 11. strace program ; trace syscalls
# 12. objdump -d program ; disassemble binary
# 13. pkg-config --list-all ; list development libs
# 14. apt install clang ; install Clang compiler
# 15. clang file.c -o program ; compile with Clang
# 16. ar rcs lib.a file.o ; create static library
# 17. strip program ; remove debug symbols
# 18. file program ; show binary type
# 19. uname -r ; show kernel version
# 20. dpkg-buildpackage ; build Debian package

# Inventory [ System Hardening Minimal ] { Linux Bash }
# 1. apt install ufw ; install firewall
# 2. ufw default deny incoming ; deny all incoming
# 3. ufw default allow outgoing ; allow outgoing
# 4. ufw allow ssh ; allow SSH
# 5. ufw enable ; enable firewall
# 6. apt install fail2ban ; install intrusion prevention
# 7. systemctl enable fail2ban ; enable at boot
# 8. nano /etc/ssh/sshd_config ; configure SSH
# 9. PermitRootLogin no ; disable root SSH login
# 10. PasswordAuthentication no ; disable SSH password login
# 11. systemctl restart ssh ; restart SSH service
# 12. chmod 700 ~/.ssh ; secure SSH directory
# 13. chmod 600 ~/.ssh/authorized_keys ; secure SSH keys
# 14. apt install unattended-upgrades ; auto security updates
# 15. dpkg-reconfigure unattended-upgrades ; configure auto updates
# 16. sysctl -a ; show kernel parameters
# 17. nano /etc/sysctl.conf ; adjust kernel security parameters
# 18. sysctl -p ; apply sysctl changes
# 19. chown root:root FILE ; secure ownership
# 20. chmod 600 FILE ; restrict file permissions
# 21. ps aux --sort=-%mem ; detect suspicious memory usage
# 22. ss -tulnp ; check exposed services
# 23. journalctl -p 3 -xb ; show boot errors
# 24. apt update && apt upgrade ; keep system updated

# Inventory [ Bash ] { Linux }
# ->  #!/bin/bash // The "shebang" line that tells the system to use the Bash interpreter to run the script.
# -> $1 // A positional parameter representing the first argument passed to the script (e.g., "up" or "click").
# -> case ... esac // A control flow block used to compare the input argument against multiple possible patterns.
# -> up) ... ;; // A pattern match for the string "up"; the double semicolons terminate the specific case logic.
# -> xdotool mousemove_relative // Moves the mouse cursor relative to its current (X, Y) coordinates.
# -> -- // A flag separator telling xdotool that subsequent negative numbers (like -20) are not command options.
# -> 0 -$STEP // Coordinates for movement: the first number is X (horizontal), the second is Y (vertical).
# -> xdotool click 1 // Simulates a mouse button press; '1' is the left mouse button, '3' is the right.
# -> chmod +x // Command used in the terminal to grant "execute" permissions to the script file.
# -> xbindkeys // Background daemon that maps keyboard/mouse events to shell commands.
# -> xinput // Utility to list, query, and configure input devices (keyboards/mice).
# -> zenity // Display GTK+ dialog boxes from command-line; great for UI settings.
# -> sxhkd // Simple X hotkey daemon; often faster and lighter than xbindkeys.
# -> wmctrl // Control the X window manager; use with xdotool to snap windows to corners.

# Inventory [ xbindkeys ] { Linux }
# 1. xbindkeys --defaults // Generates the initial configuration file template.
# 2. ~/.xbindkeysrc // The hidden configuration file where all key-to-command mappings live.
# 3. xbindkeys -k // Interactive tool to find the specific "name" or "code" of a key.
# 4. killall xbindkeys // Essential command to stop the background process before restarting with new settings.
# 5. "command" // The first line of a mapping; specifies what xdotool or script should run.
# 6. key_name // The second line of a mapping; specifies which physical key triggers the command above it.

# Inventory [ xbindkeys ] { Linux }
# -----------------------------------------------------------------------------
# [ CONFIGURATION & DAEMON ]
# 1. xbindkeys --defaults // Generates the initial configuration file template.
# 2. ~/.xbindkeysrc // The hidden configuration file where all key-to-command mappings live.
# 3. xbindkeys -k // Interactive tool to find the specific "name" or "code" of a key.
# 4. killall xbindkeys && xbindkeys // Restarts the daemon to apply configuration changes.
# 5. "command" // The first line of a mapping; specifies what xdotool or script should run.
# 6. key_name // The second line of a mapping; specifies the physical trigger key.
#
# [ COMMON MODIFIER NAMES ]
# 7. Control / Shift / Alt // Standard global modifiers (usually maps to the left side by default).
# 8. mod4 // Common alias for the "Super" or "Windows" key.
# 9. Control_L / Control_R // Explicitly targets the Left or Right Control keys.
# 10. Shift_L / Shift_R // Explicitly targets the Left or Right Shift keys.
# 11. Alt_L / Alt_R // Explicitly targets the Left or Right Alt (AltGr) keys.
# 12. Super_L / Super_R // Explicitly targets the Left or Right Windows/Command keys.
#
# [ COMMON KEY NAMES ]
# 13. Up / Down / Left / Right // Standard arrow keys.
# 14. Prior / Next // The keysym names for Page Up and Page Down.
# 15. Home / End / Insert / Delete // Standard navigation cluster keys.
# 16. Return / space / Tab / Escape // Common action keys (note: space is lowercase).
# 17. F1...F12 // Function keys.
# 18. KP_Up / KP_Begin / KP_Insert // Keypad-specific names (Begin is Numpad 5).
# 19. b:1 / b:2 / b:3 // Mouse buttons (1=Left, 2=Middle, 3=Right).
# 20. b:4 / b:5 // Mouse wheel scrolling (4=Up, 5=Down).

# Inventory [ VPN ] { Linux }
# -> ps auxf ; list all processes 
# -> sudo systemctl enable SERVICE // enable service X disable 
# -> sudo systemctl start SERVICE // start service X stop 
# -> sudo systemctl restart SERVICE // start service 
# -> /etc/network/interfaces // location of default config for ifupdown network interface 
# -> journalctl -u NetworkManager
# -> cat /etc/NetworkManager/NetworkManager.conf
# -> networking // default service for network 
# -> nmcli device status // 
# -> nmcli device wifi list
# -> nmcli device wifi connect "SSID" password "password"
# -> nmcli device wifi connect "SSID_NAME" password "PASSWORD" ifname wlan0   
# -> nmcli device connect eth0 // wired 
# -> sudo apt install proton-vpn-cli
# -> protonvpn signin [username]
# -> protonvpn connect
# -> protonvpn connect --country [Country]
# -> protonvpn connect [server name]
# -> protonvpn disconnect
# -> protonvpn signout

# Inventory [ 7z ] { Linux, Terminal }
# SYNTAX // SHORT_DESCRIPTION
# 1. 7z x COMPRESSEDFILE -oFOLDERPATH // Extract the COMPRESSEDFILE into FOLDERPATH
# 2. 7z a ARCHIVE_NAME FILES_TO_ADD // Add FILES_TO_ADD to ARCHIVE_NAME (creates if missing)
# 3. 7z l ARCHIVE_NAME // List contents of ARCHIVE_NAME without extracting
# 4. 7z t ARCHIVE_NAME // Test ARCHIVE_NAME for integrity/errors
# 5. 7z e COMPRESSEDFILE -oFOLDERPATH // Extract files to FOLDERPATH without preserving directory structure
# 6. 7z u ARCHIVE_NAME NEW_FILES // Update ARCHIVE_NAME with NEW_FILES (adds new or replaces older)
# 7. 7z d ARCHIVE_NAME FILE_TO_DELETE // Delete FILE_TO_DELETE from ARCHIVE_NAME
# 8. 7z h ARCHIVE_NAME // Calculate CRC checksum/hash for ARCHIVE_NAME
# 9. 7z rn ARCHIVE_NAME OLD_NAME NEW_NAME // Rename OLD_NAME to NEW_NAME inside ARCHIVE_NAME
# 10. 7z m ARCHIVE_NAME FILE_TO_MOVE // Move FILE_TO_MOVE into ARCHIVE_NAME (deletes from source)

# INVENTORY: Linux Checksum Tools (Terminal)
# Standard Coreutils (Pre-installed)
# --------------------------------------------
# sha256sum <file>   # SHA-256 (256-bit) - Standard for security
# md5sum <file>      # MD5 (128-bit)     - Fast, cryptographically broken
# sha1sum <file>     # SHA-1 (160-bit)   - Deprecated, used in Git
# sha384sum <file>   # SHA-384 (384-bit) - Stronger than SHA-256
# sha512sum <file>   # SHA-512 (512-bit) - Very strong, large files
# sha224sum <file>   # SHA-224 (224-bit) - Truncated SHA-256 variant
# b2sum <file>       # BLAKE2b (512-bit) - Modern, fast, highly secure
# cksum <file>       # CRC-32            - Error detection (not security)
# sum <file>         # BSD/SysV          - Legacy checksum
#
# Verification Mode
# --------------------------------------------
# <tool> -c <hashfile>  # Verify checksums against a file
# Example: sha256sum -c checksums.sha256
#
# Notes
# --------------------------------------------
# - All tools read files in binary mode by default.
# - SHA-256 is the recommended default for most use cases.
# - MD5/SHA1 should only be used for non-security integrity checks.
# ============================================

# Logic [ startx ]
# -> startx || ~/.xinitrc | /etc/X11/xinit/xinitrc || /etc/X11/Xsession 
# -> startx || ~/.xinitrc | /etc/X11/xinit/xinitrc || /etc/X11/Xsession 

# -> sudo update-alternatives --config x-session-manager
# sudo apt install arandr

# #!/bin/sh
# # Source the system Xsession script to get all default behaviors
# . /etc/X11/Xsession

# Inventory [ initramfs ] { Linux }
# update-initramfs -u // Update current initramfs for running kernel
# update-initramfs -u -k all // Update initramfs for all installed kernels
# update-initramfs -u -k <KERNEL_VERSION> // Update specific kernel initramfs
# update-initramfs -c -k <KERNEL_VERSION> // Create new initramfs image
# update-initramfs -d -k <KERNEL_VERSION> // Delete initramfs image
# update-initramfs -k all -u // Regenerate all initramfs images
# lsinitramfs /boot/initrd.img-<KERNEL_VERSION> // List contents of initramfs image
# unmkinitramfs /boot/initrd.img-<KERNEL_VERSION> <OUTPUT_DIR> // Extract initramfs image
# mkinitramfs -o /boot/initrd.img-<KERNEL_VERSION> <KERNEL_VERSION> // Manually generate initramfs image
# mkinitramfs -o initramfs.img // Generate initramfs in current directory
# dracut --force // Regenerate initramfs using dracut
# dracut --force /boot/initramfs-<KERNEL_VERSION>.img <KERNEL_VERSION> // Generate specific dracut image
# cat /etc/initramfs-tools/modules // View modules loaded during boot
# nano /etc/initramfs-tools/modules // Edit initramfs module list
# echo <MODULE_NAME> >> /etc/initramfs-tools/modules // Add kernel module to initramfs
# modprobe <MODULE_NAME> // Load kernel module immediately
# ls /etc/initramfs-tools/ // List initramfs-tools configuration files
# ls /usr/share/initramfs-tools/ // List default initramfs scripts/hooks
# nano /etc/initramfs-tools/initramfs.conf // Configure initramfs behavior
# nano /etc/initramfs-tools/modules // Configure boot modules
# nano /etc/initramfs-tools/conf.d/<FILE> // Add custom initramfs configuration
# update-grub // Regenerate GRUB config after initramfs changes
# file /boot/initrd.img-<KERNEL_VERSION> // Detect initramfs file type
# ls -lh /boot/initrd.img-* // List installed initramfs images
# cp /boot/initrd.img-<KERNEL_VERSION> backup.img // Backup initramfs image
# mv backup.img /boot/initrd.img-<KERNEL_VERSION> // Restore initramfs backup
# gzip -dc /boot/initrd.img-<KERNEL_VERSION> | cpio -it // List compressed initramfs contents
# gzip -dc /boot/initrd.img-<KERNEL_VERSION> | cpio -id // Extract compressed initramfs contents
# uname -r // Show running kernel version
# ls /lib/modules // List installed kernel module directories
# update-initramfs -u -v // Update initramfs with verbose output
# mkinitramfs -v -o initramfs.img // Generate verbose initramfs image
# dmesg | grep initramfs // Show initramfs-related boot logs
# journalctl -b | grep initramfs // Show initramfs logs from current boot
# /etc/initramfs-tools/hooks/ // Directory for custom initramfs hooks
# /etc/initramfs-tools/scripts/ // Directory for custom initramfs boot scripts
# chmod +x /etc/initramfs-tools/hooks/<SCRIPT> // Make custom hook executable
# chmod +x /etc/initramfs-tools/scripts/<SCRIPT> // Make custom script executable
# update-initramfs -u && reboot // Regenerate initramfs and reboot system

# Inventory [ Commands on initramfs ] { Linux }
# help // Show available initramfs shell commands
# exit // Leave initramfs shell and continue boot
# reboot // Reboot system from initramfs shell
# poweroff // Shutdown system from initramfs shell
# ls // List directory contents
# ls /dev // List detected devices
# ls /sys // List sysfs entries
# ls /proc // List procfs entries
# cd <DIR> // Change current directory
# pwd // Show current directory
# cat <FILE> // Display file contents
# less <FILE> // View file with pager
# more <FILE> // View file page by page
# echo <TEXT> // Print text output
# clear // Clear terminal screen
# mount // List mounted filesystems
# mount <DEVICE> <DIR> // Mount filesystem manually
# umount <DIR> // Unmount filesystem
# blkid // Show block device UUIDs and filesystem types
# lsblk // List block devices and partitions
# fdisk -l // Show partition tables
# fsck <DEVICE> // Check filesystem integrity
# fsck.ext4 <DEVICE> // Check ext4 filesystem
# e2fsck -f <DEVICE> // Force ext filesystem check
# mkdir <DIR> // Create directory
# rm <FILE> // Remove file
# rm -r <DIR> // Remove directory recursively
# cp <SRC> <DST> // Copy files
# mv <SRC> <DST> // Move or rename files
# modprobe <MODULE> // Load kernel module
# rmmod <MODULE> // Remove loaded module
# lsmod // List loaded kernel modules
# modinfo <MODULE> // Show module information
# dmesg // Show kernel boot messages
# dmesg | less // Browse kernel logs
# dmesg | grep <TEXT> // Search kernel messages
# cat /proc/cmdline // Show kernel boot parameters
# cat /proc/modules // Show loaded modules
# cat /proc/filesystems // Show supported filesystems
# ip addr // Show network interfaces
# ip link // Show network links
# ip route // Show routing table
# dhclient <INTERFACE> // Request DHCP address
# ping <HOST> // Test network connectivity
# uname -r // Show running kernel version
# uname -a // Show kernel/system information
# chroot <DIR> // Change root into mounted system
# chroot /mnt // Enter repaired root filesystem
# mount /dev/<ROOT_PARTITION> /mnt // Mount root partition
# mount --bind /dev /mnt/dev // Bind mount /dev into chroot
# mount --bind /proc /mnt/proc // Bind mount /proc into chroot
# mount --bind /sys /mnt/sys // Bind mount /sys into chroot
# update-initramfs -u // Regenerate initramfs from chroot
# update-grub // Regenerate GRUB config from chroot
# cryptsetup luksOpen <DEVICE> <NAME> // Open encrypted LUKS device
# vgchange -ay // Activate LVM volume groups
# lvscan // Scan logical volumes
# busybox // Launch BusyBox shell
# sh // Launch shell interpreter
# resume // Attempt resume from hibernation device
# panic // Trigger kernel panic (debugging)
# sync // Flush filesystem buffers to disk

# Inventory [ apt / apt-get / dpkg ] { Linux, Debian }
# 1. apt update // Download latest package indexes from repositories
# 2. apt upgrade // Upgrade installed packages to newer versions
# 3. apt full-upgrade // Upgrade packages and resolve dependency changes
# 4. apt install PACKAGE // Install package from configured repositories
# 5. apt install PACKAGE1 PACKAGE2 // Install multiple packages at once
# 6. apt remove PACKAGE // Remove package but keep configuration files
# 7. apt purge PACKAGE // Remove package including configuration files
# 8. apt autoremove // Remove unused dependency packages
# 9. apt autoclean // Remove obsolete downloaded package files
# 10. apt clean // Remove all cached package archives
# 11. apt search KEYWORD // Search repositories for matching packages
# 12. apt show PACKAGE // Display detailed package information
# 13. apt list --installed // List all installed packages
# 14. apt list --upgradable // List packages with available upgrades
# 15. apt policy PACKAGE // Show package version and repository priority
# 16. apt reinstall PACKAGE // Reinstall an already installed package
# 17. apt download PACKAGE // Download package without installing it
# 18. apt-mark hold PACKAGE // Prevent package from being upgraded
# 19. apt-mark unhold PACKAGE // Allow package upgrades again
# 20. apt edit-sources // Edit repository source configuration
# 21. apt-cache search KEYWORD // Search local package cache
# 22. apt-cache depends PACKAGE // Show package dependencies
# 23. apt-cache rdepends PACKAGE // Show packages depending on target package
# 24. apt-cache policy PACKAGE // Display package source and priority details
# 25. apt-cache madison PACKAGE // List all available package versions
# 26. apt-get update // Download latest package indexes from repositories
# 27. apt-get upgrade // Upgrade installed packages
# 28. apt-get dist-upgrade // Upgrade system handling dependency changes
# 29. apt-get install PACKAGE // Install package from repositories
# 30. apt-get remove PACKAGE // Remove installed package
# 31. apt-get purge PACKAGE // Remove package and configuration files
# 32. apt-get autoremove // Remove unnecessary dependency packages
# 33. apt-get source PACKAGE // Download package source code
# 34. apt-get build-dep PACKAGE // Install dependencies required for building package
# 35. apt-get check // Check package database for broken dependencies
# 36. apt-get -f install // Attempt to repair broken dependencies
# 37. dpkg -i FILE.deb // Install local .deb package file
# 38. dpkg -r PACKAGE // Remove installed package
# 39. dpkg -P PACKAGE // Purge package and configuration files
# 40. dpkg -l // List installed packages
# 41. dpkg -l PACKAGE // Show installation status of package
# 42. dpkg -L PACKAGE // List files installed by package
# 43. dpkg -S FILE // Find package owning specific file
# 44. dpkg --configure -a // Configure unfinished package installations
# 45. dpkg --get-selections // List package installation selections
# 46. dpkg-reconfigure PACKAGE // Reconfigure installed package settings
# 47. dpkg-query -W PACKAGE // Query package installation information
# 48. dpkg-deb -c FILE.deb // List contents of .deb package file
# 49. dpkg-deb -I FILE.deb // Display metadata from .deb package
# 50. dpkg --add-architecture ARCH // Enable support for foreign architecture
# 51. dpkg --print-architecture // Show primary system architecture
# 52. dpkg --print-foreign-architectures // List enabled foreign architectures
# 53. apt install ./FILE.deb // Install local .deb with dependency resolution
# 54. apt remove --purge PACKAGE // Remove package and delete configurations
# 55. apt-cache pkgnames // List all available package names
# 56. apt-file search FILE // Find package containing specified file
# 57. apt-file update // Update apt-file search database
# 58. apt-key list // List trusted repository signing keys (deprecated)
# 59. apt-key add KEY.gpg // Add trusted repository signing key (deprecated)
# 60. apt-config dump // Display current apt configuration
# 61. apt-cache show PACKAGE // Show complete package description
# 62. apt-get clean // Delete all downloaded package archives
# 63. apt-get autoclean // Delete outdated package archives
# 64. apt-cache stats // Display package cache statistics
# 65. dpkg-statoverride --list // List custom file permission overrides
# 66. dpkg-divert --list // List diverted system files
# 67. apt update && apt upgrade // Update package indexes and upgrade system
# 68. apt install --reinstall PACKAGE // Force reinstallation of package
# 69. apt purge '~c' // Remove leftover configuration files
# 70. apt-cache unmet // Show unresolved package dependencies

# Inventário [ Combinação de Comandos de Terminal ] { Linux, Debian }
# 1. COMANDO & ; Execução independente do terminal.
# 2. COMANDO1 && COMANDO2 ; Execução de dois comandos sequenciais.
# 3. COMANDO1 | COMANDO2 ; Pipe, a saída de texto do comando 1 é usado como argumento para o comando 2.

# Inventory [ Checksums ] { Linux, Debian }

# Inventário [ Serviços ] { Linux, systemd }
# 1. systemctl list-units --type=service ; lista os serviços ativos carregados pelo systemd.
# 2. systemctl list-units --type=service --all ; lista todos os serviços, incluindo inativos.
# 3. systemctl list-unit-files --type=service ; lista os arquivos de serviços instalados.
# 4. systemctl status SERVICO ; exibe status detalhado do serviço.
# 5. systemctl start SERVICO ; inicia um serviço.
# 6. systemctl stop SERVICO ; interrompe um serviço.
# 7. systemctl restart SERVICO ; reinicia um serviço.
# 8. systemctl reload SERVICO ; recarrega configuração sem reiniciar o processo.
# 9. systemctl reload-or-restart SERVICO ; recarrega configuração ou reinicia o serviço.
# 10. systemctl try-restart SERVICO ; reinicia apenas se o serviço estiver em execução.
# 11. systemctl enable SERVICO ; habilita inicialização automática no boot.
# 12. systemctl disable SERVICO ; desabilita inicialização automática no boot.
# 13. systemctl enable --now SERVICO ; habilita e inicia imediatamente o serviço.
# 14. systemctl disable --now SERVICO ; desabilita e interrompe imediatamente o serviço.
# 15. systemctl is-enabled SERVICO ; verifica se o serviço inicia automaticamente.
# 16. systemctl is-active SERVICO ; verifica se o serviço está em execução.
# 17. systemctl mask SERVICO ; impede qualquer inicialização do serviço.
# 18. systemctl unmask SERVICO ; remove bloqueio de inicialização do serviço.
# 19. systemctl daemon-reload ; recarrega definições de unidades do systemd.
# 20. systemctl daemon-reexec ; reinicializa o processo do systemd.
# 21. systemctl cat SERVICO ; exibe conteúdo do arquivo de unidade do serviço.
# 22. systemctl edit SERVICO ; cria override/customização para o serviço.
# 23. systemctl revert SERVICO ; remove overrides/customizações locais do serviço.
# 24. systemctl show SERVICO ; mostra propriedades detalhadas do serviço.
# 25. systemctl show -p PROPERTY SERVICO ; exibe propriedade específica do serviço.
# 26. systemctl list-dependencies SERVICO ; lista dependências do serviço.
# 27. systemctl kill SERVICO ; envia sinal para processos do serviço.
# 28. systemctl reset-failed ; limpa estado de falha de serviços.
# 29. systemctl reset-failed SERVICO ; limpa estado de falha de um serviço específico.
# 30. journalctl -u SERVICO ; exibe logs do serviço.
# 31. journalctl -u SERVICO -f ; acompanha logs em tempo real.
# 32. journalctl -u SERVICO --since today ; exibe logs do serviço desde hoje.
# 33. journalctl -xe ; exibe logs recentes e erros detalhados do sistema.
# 34. systemd-analyze blame ; mostra tempo de inicialização de serviços.
# 35. systemd-analyze critical-chain ; exibe cadeia crítica de inicialização.
# 36. service SERVICO start ; inicia serviço usando interface compatível SysV.
# 37. service SERVICO stop ; interrompe serviço usando interface compatível SysV.
# 38. service SERVICO restart ; reinicia serviço usando interface compatível SysV.
# 39. service SERVICO status ; exibe status usando interface compatível SysV.
# 40. chkconfig --list ; lista serviços em sistemas SysV antigos.
# 41. update-rc.d SERVICO enable ; habilita serviço em sistemas compatíveis SysV.
# 42. update-rc.d SERVICO disable ; desabilita serviço em sistemas compatíveis SysV.
# 43. loginctl list-sessions ; lista sessões gerenciadas pelo systemd-logind.
# 44. loginctl terminate-session ID ; encerra sessão específica.
# 45. loginctl kill-user USUARIO ; encerra processos do usuário.
# 46. systemctl --user list-units ; lista serviços do usuário atual.
# 47. systemctl --user start SERVICO ; inicia serviço no escopo do usuário.
# 48. systemctl --user enable SERVICO ; habilita serviço do usuário no login.
# 49. timedatectl ; exibe status de data, hora e timezone.
# 50. hostnamectl ; exibe ou altera hostname do sistema.
# 51. localectl ; exibe ou altera configurações de locale e teclado.
# 52. busctl ; interage com barramento D-Bus do systemd.
# 53. systemd-cgls ; exibe árvore de control groups (cgroups).
# 54. systemd-cgtop ; monitora uso de recursos por cgroups.
# 55. systemctl rescue ; entra em modo de recuperação (single-user).
# 56. systemctl isolate multi-user.target ; alterna para modo texto multiusuário.
# 57. systemctl isolate graphical.target ; alterna para modo gráfico.
# 58. systemctl get-default ; mostra target padrão de inicialização.
# 59. systemctl set-default multi-user.target ; define boot em modo texto.
# 60. systemctl set-default graphical.target ; define boot em modo gráfico.

# Inventário [ picom ] { Linux, Debian }
# ============================================================
# -- terminal --
# ============================================================
# 1. apt install picom ; instala o pacote do compositor picom.
# 2. picom ; executa o picom com a configuração padrão.
# 3. picom --config ~/.config/picom/picom.conf & ; executa em segundo plano usando um arquivo de configuração específico.
# 4. picom --experimental-backends ; ativa backends experimentais.
# 5. picom --backend glx ; executa utilizando backend GLX.
# 6. picom --backend xrender ; executa utilizando backend XRender.
# 7. picom --vsync ; ativa sincronização vertical.
# 8. picom --no-vsync ; desativa sincronização vertical.
# 9. picom --log-level INFO ; define nível de log.
# 10. picom --log-file ~/.config/picom/picom.log ; salva logs em arquivo.
# 11. picom --diagnostics ; exibe informações de diagnóstico.
# 12. pkill picom ; encerra todas as instâncias do picom.
# 13. killall picom ; encerra processos do picom.
# 14. pgrep picom ; verifica se o picom está em execução.
# 15. picom --config /dev/null ; executa sem arquivo de configuração.
# 16. picom --dbus ; ativa suporte DBus.
# 17. picom --daemon ; executa como daemon em segundo plano.
# 18. picom --benchmark 200 ; executa benchmark de renderização.
# 19. picom --help ; exibe ajuda.
# 20. man picom ; abre manual do picom.
# ============================================================
# -- arquivos --
# ============================================================
# 1. ~/.config/picom/picom.conf ; arquivo principal de configuração do usuário.
# 2. /etc/xdg/picom.conf ; configuração global do sistema.
# 3. ~/.config/picom/ ; diretório de configuração do usuário.
# 4. ~/.config/picom/picom.log ; arquivo de logs personalizado.
# ============================================================
# -- integração com i3 --
# ============================================================
# 1. exec --no-startup-id picom ; inicia automaticamente no i3.
# 2. exec_always --no-startup-id picom --config ~/.config/picom/picom.conf ; reinicia após reload do i3.
# 3. bindsym $mod+Shift+p exec pkill picom ; atalho para encerrar o compositor.
# 4. bindsym $mod+p exec picom ; atalho para iniciar o compositor.
# ============================================================
# -- variáveis do arquivo de configuração --
# ============================================================
# ------------------------------------------------------------
# -- backend e renderização --
# ------------------------------------------------------------
# 1. backend = "glx" ; # glx, xrender, xr_glx_hybrid // backend de renderização.
# 2. vsync = true ; # true, false // ativa sincronização vertical.
# 3. use-damage = true ; # true, false // atualiza apenas regiões alteradas.
# 4. refresh-rate = 60 ; # inteiro // taxa de atualização do monitor.
# 5. detect-client-opacity = true ; # usa opacidade definida pela aplicação.
# 6. detect-transient = true ; # detecta janelas transitórias.
# 7. detect-rounded-corners = true ; # detecta cantos arredondados.
# 8. mark-wmwin-focused = true ; # marca janelas focadas pelo window manager.
# 9. mark-ovredir-focused = true ; # considera override-redirect como focadas.
# 10. unredir-if-possible = true ; # desativa composição em fullscreen.
# 11. use-ewmh-active-win = true ; # usa EWMH para detectar foco.
# 12. dbus = true ; # ativa integração DBus.
# ------------------------------------------------------------
# -- sombras --
# ------------------------------------------------------------
# 1. shadow = true ; # ativa sombras.
# 2. shadow-radius = 12 ; # raio da sombra.
# 3. shadow-offset-x = -12 ; # deslocamento horizontal.
# 4. shadow-offset-y = -12 ; # deslocamento vertical.
# 5. shadow-opacity = 0.75 ; # 0.0-1.0 // intensidade da sombra.
# 6. shadow-red = 0.0 ; # componente vermelha da sombra.
# 7. shadow-green = 0.0 ; # componente verde da sombra.
# 8. shadow-blue = 0.0 ; # componente azul da sombra.
# 9. shadow-ignore-shaped = false ; # ignora janelas com formato irregular.
# 10. clear-shadow = true ; # remove sombras transparentes.
# 11. shadow-exclude = [ ] ; # lista de exclusão de sombras.
# ------------------------------------------------------------
# -- opacidade --
# ------------------------------------------------------------
# 1. active-opacity = 1.0 ; # 0.0-1.0 // opacidade da janela focada.
# 2. inactive-opacity = 0.9 ; # 0.0-1.0 // opacidade das janelas em segundo plano.
# 3. frame-opacity = 1.0 ; # opacidade das bordas da janela.
# 4. inactive-opacity-override = false ; # força opacidade inativa.
# 5. inactive-dim = 0.1 ; # escurece janelas inativas.
# 6. inactive-dim-fixed = true ; # usa valor fixo para escurecimento.
# 7. opacity-rule = [ ] ; # regras específicas de opacidade.
# ------------------------------------------------------------
# -- blur --
# ------------------------------------------------------------
# 1. blur-method = "dual_kawase" ; # método de blur.
# 2. blur-strength = 5 ; # intensidade do blur.
# 3. blur-background = true ; # ativa blur no fundo.
# 4. blur-background-frame = true ; # blur nas bordas.
# 5. blur-background-fixed = false ; # blur fixo.
# 6. blur-kern = "3x3box" ; # kernel de blur.
# 7. blur-background-exclude = [ ] ; # exclusões do blur.
# ------------------------------------------------------------
# -- fading --
# ------------------------------------------------------------
# 1. fading = true ; # ativa animações de fade.
# 2. fade-in-step = 0.03 ; # velocidade do fade-in.
# 3. fade-out-step = 0.03 ; # velocidade do fade-out.
# 4. fade-delta = 5 ; # intervalo entre frames do fade.
# 5. no-fading-openclose = false ; # desativa fade em abrir/fechar.
# 6. no-fading-destroyed-argb = false ; # fade em janelas ARGB destruídas.
# ------------------------------------------------------------
# -- cantos arredondados --
# ------------------------------------------------------------
# 1. corner-radius = 8 ; # raio dos cantos arredondados.
# 2. rounded-corners-exclude = [ ] ; # exclusões de arredondamento.
# 3. round-borders = 1 ; # arredonda bordas.
# ------------------------------------------------------------
# -- exclusões --
# ------------------------------------------------------------
# 1. shadow-exclude = [ "class_g = 'Conky'" ] ; # exclui sombras do Conky.
# 2. fade-exclude = [ ] ; # exclui janelas do fade.
# 3. focus-exclude = [ ] ; # exclui janelas da detecção de foco.
# 4. blur-background-exclude = [ ] ; # exclui janelas do blur.
# 5. unredir-if-possible-exclude = [ ] ; # exclusões do unredirect.
# 6. opacity-rule = [ "90:class_g = 'Alacritty'" ] ; # regra de opacidade.
# ============================================================
# -- classes e propriedades X11 --
# ============================================================
# 1. class_g ; nome da classe da janela.
# 2. class_i ; instância da janela.
# 3. name ; título da janela.
# 4. role ; role da janela.
# 5. window_type ; tipo da janela.
# 6. override_redirect ; janelas fora do controle do WM.
# 7. focused ; verifica foco da janela.
# ============================================================
# -- utilitários relacionados --
# ============================================================
# 1. xprop ; inspeciona propriedades X11 de janelas.
# 2. xwininfo ; exibe informações da janela.
# 3. xdpyinfo ; exibe informações do servidor X.
# 4. glxinfo ; exibe informações OpenGL/GLX.
# 5. xrandr ; gerencia monitores e resolução.
# 6. i3-msg reload ; recarrega configuração do i3.
# 7. lxappearance ; configura temas GTK.
# 8. nitrogen ; gerencia wallpaper.
# 9. feh ; define wallpapers.
# 10. xsetroot ; altera aparência do cursor/root window.
# ============================================================
# -- exemplos de regras --
# ============================================================
# 1. opacity-rule = [ "80:class_g = 'Alacritty'" ] ; define opacidade do Alacritty.
# 2. shadow-exclude = [ "window_type = 'dock'" ] ; remove sombras de docks.
# 3. blur-background-exclude = [ "window_type = 'desktop'" ] ; desativa blur da área de trabalho.
# 4. focus-exclude = [ "class_g = 'Polybar'" ] ; ignora Polybar no foco.
# 5. rounded-corners-exclude = [ "window_type = 'dock'" ] ; remove arredondamento de docks.
# ============================================================
# -- observações --
# ============================================================
# 1. picom funciona apenas em servidores X11.
# 2. Wayland utiliza compositores próprios, não picom.
# 3. backend GLX normalmente possui melhor desempenho gráfico.
# 4. alguns drivers NVIDIA podem apresentar tearing sem vsync.
# 5. blur pode aumentar uso de GPU.
# 6. unredir-if-possible melhora desempenho em fullscreen.
# 7. conflitos podem ocorrer com outros compositores ativos.

# Inventory [ Control Structures ] { Linux, Bash }
# -- conditional structures --
# 1. if CONDITION ; then COMMANDS ; fi ; executes commands when condition is true.
# 2. if CONDITION ; then COMMANDS ; else COMMANDS ; fi ; executes one block for true and another for false.
# 3. if CONDITION ; then COMMANDS ; elif CONDITION ; then COMMANDS ; else COMMANDS ; fi ; evaluates multiple conditional branches sequentially.
# 4. [ CONDITION ] ; evaluates a test expression using the test command syntax.
# 5. [[ CONDITION ]] ; evaluates advanced conditional expressions with pattern matching and logical operators.
# 6. test CONDITION ; evaluates a conditional expression using the test utility.
# 7. COMMAND && COMMAND ; executes the second command only if the first succeeds.
# 8. COMMAND || COMMAND ; executes the second command only if the first fails.
# 9. ! COMMAND ; negates the exit status of a command or condition.
#
# -- comparison operators --
# 10. [ STRING1 = STRING2 ] ; checks whether two strings are equal.
# 11. [ STRING1 != STRING2 ] ; checks whether two strings are different.
# 12. [ -z STRING ] ; checks whether a string is empty.
# 13. [ -n STRING ] ; checks whether a string is not empty.
# 14. [ INTEGER1 -eq INTEGER2 ] ; checks whether two integers are equal.
# 15. [ INTEGER1 -ne INTEGER2 ] ; checks whether two integers are different.
# 16. [ INTEGER1 -gt INTEGER2 ] ; checks whether the first integer is greater than the second.
# 17. [ INTEGER1 -lt INTEGER2 ] ; checks whether the first integer is less than the second.
# 18. [ INTEGER1 -ge INTEGER2 ] ; checks whether the first integer is greater than or equal to the second.
# 19. [ INTEGER1 -le INTEGER2 ] ; checks whether the first integer is less than or equal to the second.
#
# -- file test operators --
# 20. [ -e FILE ] ; checks whether a file or path exists.
# 21. [ -f FILE ] ; checks whether a path is a regular file.
# 22. [ -d DIRECTORY ] ; checks whether a path is a directory.
# 23. [ -r FILE ] ; checks whether a file is readable.
# 24. [ -w FILE ] ; checks whether a file is writable.
# 25. [ -x FILE ] ; checks whether a file is executable.
# 26. [ -s FILE ] ; checks whether a file exists and is not empty.
#
# -- loop structures --
# 27. for VARIABLE in LIST ; do COMMANDS ; done ; iterates over a list of values.
# 28. for (( INITIALIZATION ; CONDITION ; INCREMENT )) ; do COMMANDS ; done ; executes a C-style arithmetic loop.
# 29. while CONDITION ; do COMMANDS ; done ; repeats commands while a condition remains true.
# 30. until CONDITION ; do COMMANDS ; done ; repeats commands until a condition becomes true.
# 31. select VARIABLE in LIST ; do COMMANDS ; done ; creates a simple interactive selection menu.
#
# -- loop control --
# 32. break ; terminates the current loop immediately.
# 33. continue ; skips the current iteration and proceeds to the next loop iteration.
# 34. break N ; exits N nested loop levels.
# 35. continue N ; resumes execution at the next iteration of the Nth enclosing loop.
#
# -- pattern matching and branching --
# 36. case VALUE in PATTERN) COMMANDS ;; esac ; executes commands based on pattern matching rules.
# 37. case VALUE in PATTERN1|PATTERN2) COMMANDS ;; esac ; matches multiple patterns in a single branch.
# 38. *) COMMANDS ;; ; defines the default branch in a case structure.
#
# -- command grouping --
# 39. { COMMANDS ; } ; groups commands in the current shell context.
# 40. ( COMMANDS ) ; groups commands inside a subshell environment.
#
# -- functions --
# 41. FUNCTION_NAME() { COMMANDS ; } ; defines a reusable shell function.
# 42. function FUNCTION_NAME { COMMANDS ; } ; defines a function using the function keyword.
# 43. return VALUE ; returns an exit status from a shell function.
#
# -- arithmetic structures --
# 44. (( EXPRESSION )) ; evaluates arithmetic expressions directly in bash.
# 45. $(( EXPRESSION )) ; expands the result of an arithmetic expression.
#
# -- input and execution control --
# 46. read VARIABLE ; reads user input into a variable.
# 47. exit STATUS ; terminates the current shell or script with a status code.
# 48. trap COMMAND SIGNAL ; executes a command when a signal or event occurs.
#
# -- script flow helpers --
# 49. source FILE ; executes commands from another file in the current shell.
# 50. . FILE ; shorthand syntax for sourcing another shell script.

# Inventory [ Avahi-Daemon ] { Linux, Debian }
# 1. sudo apt install avahi-daemon
# 2. sudo systemctl enable --now avahi-daemon

# Inventory [ Samba ] { Linux, Debian }
#
# -- installation / packages --
# 1. sudo apt install samba // installs the Samba server and SMB/CIFS sharing tools.
# 2. sudo apt install smbclient // installs the SMB/CIFS command line client.
# 3. sudo apt install cifs-utils // installs tools for mounting SMB/CIFS shares.
# 4. samba --version // displays the installed Samba version.
# 5. apt show samba // displays package information about Samba.
#
# -- services --
# 6. systemctl status smbd // displays the Samba file sharing service status.
# 7. systemctl status nmbd // displays the NetBIOS name service status.
# 8. sudo systemctl start smbd // starts the Samba file sharing service.
# 9. sudo systemctl stop smbd // stops the Samba file sharing service.
# 10. sudo systemctl restart smbd // restarts the Samba file sharing service.
# 11. sudo systemctl enable smbd // enables Samba service startup during boot.
# 12. sudo systemctl disable smbd // disables Samba service startup during boot.
# 13. sudo systemctl restart nmbd // restarts the NetBIOS name service.
#
# -- configuration files --
# 14. /etc/samba/smb.conf // Samba default configuration file.
# 15. testparm // validates the Samba configuration syntax.
# 16. testparm /etc/samba/smb.conf // validates a specific Samba configuration file.
# 17. sudo nano /etc/samba/smb.conf // edits the Samba configuration file.
#
# -- samba users / authentication --
# 18. sudo smbpasswd -a USER // creates or enables a Samba password for a user.
# 19. sudo smbpasswd USER // changes the Samba password for a user.
# 20. sudo smbpasswd -x USER // removes a Samba user.
# 21. pdbedit -L // lists Samba users.
# 22. sudo pdbedit -a USER // adds a Samba user account.
#
# -- share examples --
# 23. [SHARE_NAME] // defines a Samba shared resource section.
# 24. path = /DIRECTORY/PATH // defines the shared directory path.
# 25. browseable = yes // allows the share to appear in network browsers.
# 26. read only = no // allows write access to the shared directory.
# 27. guest ok = yes // allows guest access without authentication.
# 28. valid users = USER // restricts access to specific users.
# 29. create mask = 0755 // defines default permissions for created files.
# 30. directory mask = 0755 // defines default permissions for created directories.
#
# -- example share configuration --
# 31.
# [Public]
# path = /srv/samba/public
# browseable = yes
# read only = no
# guest ok = yes
# // example public share configuration.
#
# -- permissions / directories --
# 32. sudo mkdir -p /srv/samba/public // creates a shared directory.
# 33. sudo chmod 777 /srv/samba/public // grants full permissions to the shared directory.
# 34. sudo chown -R USER:USER /srv/samba/public // changes ownership of the shared directory.
#
# -- firewall --
# 35. sudo ufw allow samba // allows Samba traffic through the firewall.
# 36. sudo ufw status // displays current firewall rules.
#
# -- network discovery / diagnostics --
# 37. smbclient -L localhost -U USER // lists available Samba shares on the local machine.
# 38. smbclient //SERVER/SHARE -U USER // connects to a remote Samba share.
# 39. smbstatus // displays active Samba connections and locked files.
# 40. net usershare list // lists user-defined Samba shares.
# 41. hostname // displays the current system hostname used on the network.
#
# -- mounting samba shares --
# 42. sudo mount -t cifs //SERVER/SHARE /mnt/share -o username=USER // mounts a Samba share manually.
# 43. sudo umount /mnt/share // unmounts a mounted Samba share.
#
# -- fstab persistent mount example --
# 44.
# //SERVER/SHARE /mnt/share cifs username=USER,password=PASSWORD,uid=1000,gid=1000 0 0
# // example persistent Samba mount entry for /etc/fstab.
#
# -- logs --
# 45. /var/log/samba/ // Samba log directory.
# 46. journalctl -u smbd // displays logs from the Samba service.
# 47. journalctl -u nmbd // displays logs from the NetBIOS service.
#
# -- common samba ports --
# 48. TCP 445 // SMB over TCP networking port.
# 49. TCP 139 // NetBIOS session service port.
# 50. UDP 137 // NetBIOS name service port.
# 51. UDP 138 // NetBIOS datagram service port.
#
# -- useful concepts --
# 52. SMB // Server Message Block network file sharing protocol.
# 53. CIFS // Common Internet File System, older SMB implementation terminology.
# 54. Samba // Linux implementation of SMB/CIFS services compatible with Windows networks.
# 55. Workgroup // logical group of devices visible on the local network.

# Inventory [ Shared Connection by Ethernet ] { NetworkManager, Linux, Debian }
# 1. nmcli connection add type ethernet con-name shared-lan ifname eth1 ipv4.method shared 
# 2. nmcli connection up shared-lan
# 3. Set Shared-Lan Profile | Bring Connection Up | Connect 

# [ Grub Update ]
# 1. sudo update-grub // procura por novos os 
# 2. grub-install /dev/sda ; reinstall grub for MBR partitions 
# {arch}
# 1. grub-install /dev/sda
# 2. grub-mkconfig -o /boot/grub/grub.cfg   
# 1. Install GRUB explicitly for BIOS/MBR
#grub-install --target=i386-pc --recheck /dev/sda
# 2. Enable OS detection (Edit /etc/default/grub)
# Add: GRUB_DISABLE_OS_PROBER=false
# 3. Generate config with multi-boot entries
#grub-mkconfig -o /boot/grub/grub.cfg   

# Inventory : Broadcom Issue { Linux }
# 1. to /etc/modprobe.d/blacklist-broadcom.conf ... // blacklist b43, blacklist ssb, blacklist mac80211
# 2. sudo update-initramfs -u // update initramfs 

# Network Connection { Networking }
# 1. ip a
# 2. iw dev
# 3. ip link set wlp2s0 up
# 4. su -l
# 5. iwlist scan
# my wifi device
# allow-hotplug wlp2s0
# iface wlp2s0 inet dhcp
#        wpa-ssid ESSID
#        wpa-psk PASSWORD
#
# ifup wlp2s0
# iw wlp2s0 link
# ip a
#
# sudo nmcli radio wifi on
# nmcli device wifi list 
# nmcli -d wlan1 device wifi list
# sudo nmcli device wifi connect "<SSID>" password "<YourPassword>"
# sudo nmcli -d wlan1 device wifi connect "<SSID>" password "<YourPassword>"
# nmcli connection show
# nmcli connection delete "<ConnectionName>"
#

# [ Mouting a Iso ]
# sudo mkdir -p /mnt/debian-iso
# sudo mount -o loop /path/to/your/image.iso /mnt/debian-iso
# deb file:/mnt/debian-iso bookworm main contrib non-free

# sudo apt install libx11-dev   

# Inventory : fonts 
# sudo apt update
# sudo apt install fonts-dejavu fonts-liberation fonts-noto fonts-noto-cjk fonts-wqy-zenhei fonts-wqy-microhei
# sudo apt install fonts-msttcore
# sudo apt install ttf-mscorefonts-installer
# sudo fc-cache -fv
# 

# XKB library issue cmake 
#sudo apt update
# sudo apt install libxkbcommon-dev libxkbcommon-x11-dev   

# Inventory : Autocompletion Customization { Linux, Bash }
# 1. ~/.inputrc // GNU Readline configuration file for key bindings and variables
# 2. Inventory // is a cheatsheet formated as comment-block 
# 3. Inventory : NAME { CONTEXT } // NAME { CONTEXT } helps organize and identify inventories
# --- CORE BEHAVIOR TWEAKS ---
# 4. TAB: menu-complete // Cycles through completion matches one-by-one instead of listing all
# 5. "\e[Z": menu-complete-backward // Binds Shift+Tab to cycle backwards through matches
# 6. set show-all-if-ambiguous on // Lists all matches immediately on first Tab if >1 match exists
# 7. set menu-complete-display-prefix on // Shows common prefix of all matches before cycling starts
# 8. set completion-ignore-case on // Makes completion case-insensitive (e.g., "Doc" matches "documents")
# 9. set colored-stats on // Colors completion matches by file type (like ls)
# 10. set visible-stats on // Shows file size/permissions next to completion matches
# 11. set completion-prefix-display-length 3 // Replaces long common prefixes with "..." after N chars
# --- HISTORY SEARCH BINDINGS ---
# 12. "\e[A": history-search-backward // Up Arrow searches history for lines starting with current text
# 13. "\e[B": history-search-forward // Down Arrow searches history forward for current text prefix
# 14. "\C-p": history-search-backward // Ctrl+P alternative binding for backward history search
# 15. "\C-n": history-search-forward // Ctrl+N alternative binding for forward history search
# --- ADVANCED / UTILITY BINDINGS ---
# 16. "\C-u": universal-argument // Enables numeric arguments for subsequent commands (e.g., Ctrl-U 4 Ctrl-D deletes 4 chars)
# 17. "\C-x*": insert-completions // Inserts all possible completions at once (wildcard expansion)
# 18. set mark-symlinked-directories on // Appends '@' to symlinked directories during completion
# 19. set mark-modified-lines on // Visual indicator in history for modified lines
# 20. set expand-tilde on // Expands '~' to home directory during completion
# --- ACTIVATION IN ~/.bashrc (Debian Specific) ---
# 21. if [ -f /etc/bash_completion ]; then . /etc/bash_completion; fi // Enables programmable completion scripts
# 22. source ~/.inputrc // Reloads Readline settings without restarting terminal (or use Ctrl-x Ctrl-r)
# 23. apt install bash-completion // Installs the package providing advanced completion rules for Debian   

# Inventário : comandos do instalador { Arch Linux }
# 1. ls /sys/firmware/efi/efivars ; verifica se o boot está em modo UEFI
# 2. ping archlinux.org ; testa a conexão com a internet
# 3. loadkeys br-abnt ; configura layout do teclado para português brasileiro
# 4. blkid ; lista o nome dos dispositivos de armazenamento
# 5. fdisk -l ; lista discos e partições disponíveis no sistema
# 12. swapon /dev/sdXY ; ativa a partição de swap
# 13. mount /dev/sdXY /mnt ; monta partição raiz (/) em /mnt
# 14. mount --mkdir /dev/sdXY /mnt/boot ; monta partição de boot
# 15. pacstrap -K /mnt base linux linux-firmware ; instala sistema base no disco
# 16. genfstab -U /mnt >> /mnt/etc/fstab ; gera arquivo de tabela de sistemas de arquivos
# 17. arch-chroot /mnt ; alterna raiz para o novo sistema instalado
# 18. ln -sf /usr/share/zoneinfo/Região/Cidade /etc/localtime ; define fuso horário
# 19. hwclock --systohc ; sincroniza relógio de hardware com o sistema
# 20. nano /etc/locale.gen ; edita arquivo para descomentar idioma desejado
# 21. locale-gen ; gera as localizações configuradas
# 22. echo "LANG=pt_BR.UTF-8" > /etc/locale.conf ; define idioma padrão do sistema
# 23. echo "NOME_DO_HOST" > /etc/hostname ; define nome da máquina
# 24. pacman -S networkmanager ; instala gerenciador de rede
# 25. systemctl enable NetworkManager ; habilita serviço de rede na inicialização
# 26. mkinitcpio -P ; regenera imagem de inicialização
# 27. passwd ; define senha para o usuário root
# 28. pacman -S grub efibootmgr ; instala bootloader GRUB e ferramentas UEFI
# 29. grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB ; instala GRUB
# 30. grub-mkconfig -o /boot/grub/grub.cfg ; gera arquivo de configuração do GRUB
# 31. useradd -m -G wheel NOME_USUARIO ; cria novo usuário e adiciona ao grupo wheel
# 32. passwd NOME_USUARIO ; define senha para o novo usuário
# 33. EDITOR=nano visudo ; edita arquivo sudoers para conceder privilégios
# 34. reboot ; reinicia o sistema para o novo ambiente
# 35. archinstall ; inicia assistente de instalação semi-gráfico alternativo   


# -- END
