# BEGIN
# verbose commands for linux
# 1. verbose commands are easier to remember, less error prone
# 2. use tab for autocompletion

# -- variables PLEASE MODIFY ME
D1='HDMI-1-0'
D2='DisplayPort-0'

# -- alias | system 
alias errors='sudo dmesg | grep -iE "error|critical|failed|failure" | tee ~/errors.txt'
alias processes='ps auxf | tee ~/processes.txt'
alias devices='lspci -k | tee ~/devices.txt'
alias storage_devices='(sudo blkid && sudo fdisk -l) | tee ~/storage_devices.txt'
alias mount_points='(sudo blkid && sudo lsblk -l) | tee ~/mount_points.txt'
alias regenerate_initramfs='sudo mkinitcpio -P'

# -- alias | audio 
alias audio_devices='wpctl status'
alias set_audio_sink='wpctl set-default'

# -- alias | services
alias services='systemctl list-units --type=service | tee ~/services.txt'
alias check_service='systemctl --user status'
alias restart_service='systemctl --user restart'

# -- alias | log errors 
alias startx_debug='startx &> ~/x11-errors.txt'
alias thunar_debug='thunar &> ~/gtk-errors.txt'

# -- alias | package manager 
# -- alias | package manager | apt
# alias manually_installed='apt-mark showmanual | tee ~/manually_installed.txt'
# -- alias | package manager | pacman
alias pacman_manually_installed='pacman -Qet | tee ~/manually_installed.txt'
alias pacman_aur_installed='pacman -Qm | tee ~/aur_installed.txt'
alias pacman_search='pacman -Ss'
alias pacman_install='sudo pacman -Syu --needed'
alias pacman_update='sudo pacman -Syu'
alias pacman_info='pacman -Si'
alias pacman_orphan='pacman -Qdt'

# -- alias | boot 
alias restart='sudo reboot'
alias suspend='systemctl suspend'
alias terminate_session='killall random_background.sh ; i3-msg exit'
alias shutdown='sudo poweroff'
alias lock='~/.config/i3/lock_screen.sh'

# -- alias | screen
alias monitors='xrandr --query | tee ~/monitors.txt'
alias dualmonitor1='xrandr --output $D1 --primary --auto --output $D2 --auto --right-of $D1'
alias dualmonitor2='xrandr --output $D1 --primary --auto --output $D2 --auto --left-of $D1'

# -- alias | internet 
alias online='nmcli networking on'
alias offline='nmcli networking off'
alias internet_status='nmcli device status'
alias internet_health='gping -n 10 -s 8.8.8.8'
alias internet_connect='nmcli device connect'
alias kill_connection='nmcli connection down'
alias delete_connection='nmcli connection delete'
alias vpn_reconnect='protonvpn disconnect && protonvpn connect'
alias update_time='timedatectl status && timedatectl set-ntp true'

# -- alias | tools 
alias activate='chmod +x'
alias deactivate='chmod -x'
alias tar_extract='tar -xf'

# -- alias | apps
alias kmc='~/Projects/LinuxX11SmoothKeyboardMouseControl/keyboardMouseControlX11 --wasd=KP_5,KP_1,KP_2,KP_3 --LRUD=KP_4,KP_6,KP_Enter,KP_0 --toggles=KP_8,KP_9,KP_7 --ZX=KP_Divide,KP_Multiply --middle=KP_Decimal --speed=3'
alias ils='~/Projects/LinuxInteractiveTerminal/ils --terminal=uxterm'
alias notepad__='~/Projects/Notepad__LinuxQt/build/Notepad--LinuxQt'
alias snotepad__='sudo ~/Projects/Notepad__LinuxQt/build/Notepad--LinuxQt'
alias jnotepad__='notepad__ ~/Documents/_journal.h --right ~/Documents/_aiJournal.h &'
alias edit_configs='notepad__ ~/.config/i3/config --right ~/.config/picom/picom.conf &'

# -- alias | self
alias shortcuts='cat ~/.bash_aliases | grep -iE "alias "'
alias shortcuts_search='shortcuts | grep '
alias update_aliases='. ~/.bash_aliases'
alias edit_aliases='notepad__ ~/.bash_aliases &'

# END 




