#! /bin/sh
#
# TonaliOS Installation Script
#
# License: MIT

sysconfig_repo_url='git@github.com:LuisLaraP/linux-config.git'

# Install pacman packages

pacman -Sy --needed - < pacman_packages.txt

# Create main user

read -p "Enter main user name: " main_user
if useradd -m -G wheel $main_user 2>/dev/null; then
	echo "Enter the main user password"
	passwd $main_user
else
	echo "User $main_user already exists. Adjusting its configuration."
	usermod -a -G wheel $main_user
fi

# Install system configuration files

sysconfig_repo_dir=$(mktemp --tmpdir --directory tmp.XXXXXXXXXX)
git clone $sysconfig_repo_url $sysconfig_repo_dir
$sysconfig_repo_dir/install.sh
