# BEGIN: Arch Linux i3+picom Setup

# -- 1. Atualização do Sistema
# No Arch, é crucial atualizar a lista e os pacotes antes de instalar novos itens.
sudo pacman -Syu

# -- 2. Internet e Rede
# NetworkManager já deve estar instalado, mas garantimos o applet para a bandeja do i3.
# sudo pacman -S --needed network-manager-applet
sudo pacman -S --needed net-tools
sudo pacman -S --needed dnsmasq
sudo pacman -S --needed wireless-regdb
# Nota: 'nethogs' está nos repositórios oficiais também.
# sudo pacman -S --needed nethogs

# -- 3. Firmware e Drivers
# O Arch separa firmwares. 'linux-firmware' já deve estar instalado, mas estes cobrem casos extras.
sudo pacman -S --needed linux-firmware
# Para NVIDIA (descomente se necessário):
# sudo pacman -S --needed nvidia nvidia-utils nvidia-settings

# -- 4. Servidor Gráfico e Window Manager
# Xorg e i3 estão nos repositórios principais.
sudo pacman -S --needed xorg xorg-xinit xorg-apps
sudo pacman -S --needed ttf-dejavu ttf-liberation xorg-xrandr xorg-xrdb   
sudo pacman -S --needed i3-wm i3status i3lock dmenu
sudo pacman -S --needed picom

# Login gráfico (Display Manager). LightDM é leve e recomendado para i3.
#sudo pacman -S --needed lightdm lightdm-gtk-greeter
#sudo systemctl enable lightdm

# -- 5. Ferramentas de Compilação (Base-devel é o equivalente ao build-essential)
# Inclui GCC, make, patch, etc. Essencial se for usar AUR no futuro.
sudo pacman -S --needed base-devel
# Bibliotecas de desenvolvimento específicas (GTK, X11)
sudo pacman -S --needed gtk3 gtk4 libx11 libxkbcommon libxkbcommon-x11

# -- 6. Áudio (PipeWire)
# No Arch, é necessário instalar o PipeWire E seus substitutos do Pulse/JACK explicitamente.
sudo pacman -S --needed pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber
# Habilitar o serviço (geralmente ativado por socket, mas garantimos)
systemctl --user enable --now pipewire-pulse

# -- 7. Aplicativos Essenciais
sudo pacman -S --needed thunar
# 'lxpolkit' não é comum no Arch, usamos 'lxqt-policykit' ou o padrão 'polkit-kde-agent'/'gnome-polkit'
# Para i3 puro, 'polkit-gnome' é frequentemente usado ou apenas o agente do WM.
sudo pacman -S --needed polkit-gnome
sudo pacman -S --needed lxappearance
sudo pacman -S --needed arandr # 'lxrandr' é antigo, 'arandr' é o padrão recomendado no Arch
sudo pacman -S --needed 7zip
sudo pacman -S --needed firefox
# Navegadores leves
sudo pacman -S --needed falkon
# sudo pacman -S --needed qutebrowser

# Ferramentas de Internet e Sistema
sudo pacman -S --needed curl wget git
sudo pacman -S --needed htop btop
sudo pacman -S --needed pavucontrol alsa-utils
sudo pacman -S --needed feh scrot imagemagick
# 'nitrogen' é muito popular no Arch para wallpapers no i3
# sudo pacman -S --needed nitrogen

# Editores e Utilitários
sudo pacman -S --needed geany
# sudo pacman -S --needed obs-studio
# Wine (requer habilitar repositório multilib em /etc/pacman.conf se quiser 32-bit)
# sudo pacman -S --needed wine wine-mono wine-gecko winetricks
sudo pacman -S --needed evince
# sudo pacman -S --needed transmission-qt # Versão Qt é mais leve que a GTK as vezes, ou use 'transmission-gtk'

# -- 8. Temas e Ícones
sudo pacman -S --needed adwaita-icon-theme
sudo pacman -S --needed papirus-icon-theme
sudo pacman -S --needed gnome-themes-extra

# -- 9. Utilitários de Sistema
sudo pacman -S --needed gparted
sudo pacman -S --needed brightnessctl # 'xbacklight' é legado, brightnessctl é o padrão atual
sudo pacman -S --needed dunst # Notificações leves para i3
# sudo pacman -S --needed ufw # Firewall
# sudo pacman -S --needed unzip unrar # Suporte a arquivos

# -- 10. Fontes
# O Arch divide as fontes em pacotes menores. Esta lista cobre o equivalente ao seu script Debian.
sudo pacman -S --needed ttf-dejavu ttf-liberation ttf-droid \
                 noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra \
                 ttf-roboto ttf-roboto-mono ttf-opensans ttf-lato \
                 ttf-courier-prime ttf-fira-code ttf-fira-mono \
                 ttf-font-awesome ttf-symbola ttf-unifont \
                 ttf-hack ttf-inconsolata

# Atualizar cache de fontes
fc-cache -fv

sudo mkinitcpio -P # regenerate initramfs 

# -- 11. Configuração Final do i3 (Opcional mas recomendado)
# Adicionar programas ao inicio no ~/.config/i3/config
# exec --no-startup-id nm-applet
# exec --no-startup-id dunst
# exec --no-startup-id picom
# exec --no-startup-id polkit-gnome-authentication-agent-1

echo "Instalação concluída. Reinicie ou inicie o X com 'startx'."
# END   