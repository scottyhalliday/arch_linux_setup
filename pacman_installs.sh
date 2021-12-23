#
# Basic packages to install via Pacman for Arch Linux initial setup (Must be root)
#

pacman -Syy

pacman -S linux linux-lts linux-firmware linux-headers linux-lts-headers nano vim base-devel openssh networkmanager wpa_supplicant wireless_tools netctl dialog lvm2 grub dosfstools mtools efibootmgr os-prober intel-ucode xorg-server virtualbox-guest-utils xf86-video-vmware plasma-meta kde-applications man-db

# systemctl enable sshd
# systemctl enable NetworkManager

# # Create package installation directory
# mkdir archpackages
# cd archpackages

# # Install Yay
# git clone https://aur.archlinux.org/yay.git
# cd yay
# makepkg -si

# # Install pamac
# yay -S pamac