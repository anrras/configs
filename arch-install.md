##Instalar paquetes
`sudo pacman -S git ranger rtorrent htop sxiv neofetch openssh mpv p7zip unrar tar rsync gvfs fuse-exfat exfat-utils ufw tlp tmux ntfs-3g powerline powerline-fonts noto-fonts mesa vulkan-intel vulkan-icd-loader ocl-icd intel-compute-runtime`

#####UFW

`sudo systemctl enable --now ufw.service`
`sudo ufw default allow outgoing`
`sudo ufw default deny incoming`
`sudo ufw enable`
`sudo ufw status verbose`

####TLP

`sudo systemctl enable --now tlp.service`

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
####Fuentes 
`sudo pacman -S terminus-font ttf-bitstream-vera ttf-dejavu ttf-droid ttf-freefont` 

nodejs npm opera code pgadmin4 filezilla 

####KVM Qemu virt-manager
LC_ALL=C lscpu | grep Virtualization
`sudo pacman -S qemu virt-manager ebtables dnsmasq bridge-utils openbsd-netcat`
`sudo systemctl enable --now libvirtd`
`sudo systemctl status libvirtd`
`sudo usermod -G libvirtd -a dt`

#####convertir disco .vdi a qcow2
sudo qemu-img convert -f vdi -O qcow2 Ubuntu\ 20.04.vdi /var/lib/libvirt/images/ubuntu-20-04.qcow2

#####crear bridge 
sudo ip link add name bridge0 type bridge
sudo ip link set bridge0 up

####AUR
yay
screenkey
wps-office ttf-wps-fonts

---
preload
zathura-pdf-poppler
rtorrent


sudo qemu-system-x86_64 -enable-kvm -m 2G -bootorder=d -drive file=Windows7,format=raw -soundhw all
