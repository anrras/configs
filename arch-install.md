##Instalar paquetes
`sudo pacman -S man nvim git htop mlocate openssh p7zip unrar tar rsync ufw grub-customizer intel-ucode tmux`

`sudo pacman -S powerline powerline-fonts neofetch mpv youtube-dl sxiv ranger highlight rtorrent gvfs ntfs-3g tlp`

`sudo pacman -S noto-fonts noto-fonts-emoji otf-ipafont ttf-fira-code ttf-linux-libertine ttf-liberation ttf-roboto`

`sudo pacman -S mesa vulkan-intel vulkan-icd-loader ocl-icd intel-compute-runtime`

`sudo pacman -S docker docker-compose`

#####UFW

`sudo systemctl enable --now ufw.service`
`sudo ufw default allow outgoing`
`sudo ufw default deny incoming`
`sudo ufw enable`
`sudo ufw status verbose`

####TLP

`sudo systemctl enable --now tlp.service`
`sudo systemctl enable --now bluetooth.service`

####ntfs-3g

`sudo  fdisk -l`
`sudo blkid /dev/sda7`
`sudo mkdir /mnt/DATOS`
`sudo nano /etc/fstab`
UUID=XXXXXXXXXXXXX /mnt/DATOS ntfs-3g default_permissions,uid=1000 0 0

####Powerline

#####bash
Añadir al **~/.bashrc**

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

#####tmux
Añadir al **~/.tmux.conf**

source /usr/lib/python3.8/site-packages/powerline/bindings/tmux/powerline.conf

####Driver intel(modesetting)

sudo vim /etc/X11/xorg.conf.d/20-modesetting.conf

Section "Device"
Identifier "Intel Graphics"
Driver    "modesetting"
Option    "AccelMethod" "glamor"
Option    "DRI" "3"
EndSection

sudo vim /etc/X11/xorg.conf.d/modesetting.conf

Section "Device"
Identifier "modesetting"
Driver    "modesetting"
EndSection

####Driver touchpad
sudo nvim /etc/X11/xorg.conf.d/30-touchpad.conf

Section "InputClass"
Identifier "touchpad"
Driver "libinput"
MatchIsTouchpad "on"
Option "Tapping" "on"
Option "NaturalScrolling" "true"
EndSection

####SSD trim
`sudo systemctl enable --now fstrim.timer`

---
`sudo pacman -S nodejs npm opera code pgadmin4 filezilla`

####KVM Qemu virt-manager
LC_ALL=C lscpu | grep Virtualization
`sudo pacman -S qemu virt-manager ebtables dnsmasq bridge-utils openbsd-netcat`
`sudo systemctl enable --now libvirtd`
`sudo systemctl status libvirtd`
`sudo usermod -G libvirtd -a dt`


#####crear bridge
sudo ip link add name bridge0 type bridge
sudo ip link set bridge0 up

####AUR
yay
screenkey
wps-office ttf-wps-fonts
ueberzug
xcursor-breeze
ocenaudio
ttf-symbola

###Spaceship ZSH
git clone https://aur.archlinux.org/spaceship-prompt-git.git
cd spaceship-prompt-git
makepkg -si

---
preload
zathura-pdf-poppler

#####convertir disco .vdi a qcow2
sudo qemu-img convert -f vdi -O qcow2 Ubuntu\ 20.04.vdi /var/lib/libvirt/images/ubuntu-20-04.qcow2

sudo qemu-system-x86_64 -enable-kvm -m 2G -bootorder=d -drive file=Windows7,format=raw -soundhw all
