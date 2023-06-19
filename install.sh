#! /bin/sh
#
# TonaliOS Installation Script
#
# License: MIT

# URL of the snapshot of the AUR helper
aur_helper_url='https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz'
dotfiles_installer_url='https://raw.githubusercontent.com/LuisLaraP/dotfiles/main/install.sh'
sysconfig_repo_url='git@github.com:LuisLaraP/linux-config.git'


base_dir=$(dirname $0)


# Install pacman packages

pacman -Syq --noconfirm --needed - < $base_dir/pacman_packages.txt


# Create main user

read -p "Enter main user name: " main_user
if useradd -m -G wheel -s /bin/zsh $main_user 2>/dev/null; then
	echo "Enter the main user password"
	passwd $main_user
else
	echo "User $main_user already exists. Adjusting its configuration."
	usermod -a -G wheel -s /bin/zsh $main_user
fi


# Install AUR helper

aur_helper_snapshot=$(mktemp --directory)
curl $aur_helper_url | tar xzf - -C $aur_helper_snapshot --strip-components=1
chmod 700 $aur_helper_snapshot
chown $main_user $aur_helper_snapshot
sudo -u $main_user sh -c "cd $aur_helper_snapshot; makepkg --noconfirm -si"


# Install AUR packages

yay -Sq --noconfirm --needed - < $base_dir/aur_packages.txt


# Deploy main user dotfiles

dotfiles_installer=$(mktemp)
curl $dotfiles_installer_url > $dotfiles_installer
chmod 700 $dotfiles_installer
chown $main_user $dotfiles_installer
sudo -u $main_user $dotfiles_installer


# Install system configuration files

sysconfig_repo_dir=$(mktemp --directory)
git clone $sysconfig_repo_url $sysconfig_repo_dir
$sysconfig_repo_dir/install.sh


# Final actions

systemctl enable greetd.service

ln -sfT dash /usr/bin/sh
