# {Notepad--T;Cyan:Inventory;Silver:Logic,Dialetic;lightgreen:HowTo} 

# MinimalLinuxOS 
# 1. Debian without pre-installed desktop envinronment 

# HowTo [ install minimal debian ]
# 1. Download the ISO with netinst amd 
# 2. Create a bootable USB 
# 3. Install a Boot Installer 
# 4. Uncheck all but standart system utilities 
# 5. Create a root password and a user+password 

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
# 21. mount DEVICE DIR ; mount filesystem
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

# Inventory [ ... ]
# -> ps auxf ; list all processes 
# -> sudo systemctl enable SERVICE // enable service 
# -> sudo systemctl start SERVICE // start service 
# -> sudo systemctl restart SERVICE // start service 
# -> /etc/network/interfaces // location of default config for ifupdown network interface 








# -- END
