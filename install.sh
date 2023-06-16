#! /bin/sh
#
# TonaliOS Installation Script
#
# License: MIT

# Create main user

read -p "Enter main user name: " main_user
if useradd -m -G wheel $main_user 2>/dev/null; then
	echo "Enter the main user password"
	passwd $main_user
else
	echo "User $main_user already exists. Adjusting its configuration."
	usermod -a -G wheel $main_user
fi
