# BEGIN 

# -- variables
NP_DIR='/home/user/Documents/pdr/LinuxQt_13042026/Notepad__LinuxQt'
D1='HDMI-1-0'
D2='DisplayPort-0'
# -- alias 
alias shortcuts='cat ~/.bash_aliases'
alias update_alias='. ~/.bash_aliases'
# -- alias | system 
alias errors='sudo dmesg | grep -iE "error|critical|failed|failure" | tee output_system_message_errors.txt'
alias processes='ps auxf > output.txt'
alias services='systemctl list-units --type=service --state=running | tee output.txt'
alias manually_installed='apt-mark showmanual | tee output.txt'
# -- alias | boot 
alias restart='sudo reboot'
alias hibernate='systemctl hibernate'
alias suspend='systemctl suspend'
alias shutdown='sudo poweroff'
alias lock='i3lock'
# -- alias | screen
alias dualmonitor1='xrandr --output $D1 --primary --auto --output $D2 --auto --right-of $D1'
alias dualmonitor2='xrandr --output $D1 --primary --auto --output $D2 --auto --left-of $D1'
# -- alias | internet 
alias online='nmcli networking on && nmcli device status'
alias offline='nmcli networking off'
alias internet_connect='nmcli device connect enp6s0'
alias internet_status='nmcli device status && protonvpn status'
alias vpn_reconnect='protonvpn disconnect && protonvpn connect'
# -- alias | tools 
alias notepad__='$NP_DIR/build/Notepad--LinuxQt'
alias sudonotepad__='sudo $NP_DIR/build/Notepad--LinuxQt'
alias ils='/home/user/Documents/pdr/LinuxInteractiveTerminal_29042026/ils --terminal=uxterm'
alias kmc='/home/user/Documents/pdr/LinuxX11KeyboardMouseControl_02052026/keyboardMouseControlX11 --wasd=KP_5,KP_1,KP_2,KP_3 --LRUD=KP_4,KP_6,KP_Enter,KP_0 --toggles=KP_8,KP_9,KP_7 --ZX=KP_Divide,KP_Multiply --middle=KP_Decimal --speed=3'
alias compress='7z a'
alias activate='chmod +x'
alias deactivate='chmod -x'
# -- alias | apps
alias love='/home/user/Programs/love-11.5-x86_64.AppImage'
alias shotcut='/home/user/Programs/shotcut-linux-x86_64-26.2.26.AppImage'
alias brave='brave-browser-stable'

# END 
