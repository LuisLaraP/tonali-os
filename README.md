# TonaliOS

My personal Linux distribution, in the form of a post-installation script on top of Arch Linux.

## Installation

TonaliOS is meant to be installed on top of a clean Arch Linux install. Installing Arch is outside of the scope of this project, but you can follow the [official guide](https://wiki.archlinux.org/title/Installation_guide).

Then, inside your fresh Arch install, run the following commands as root:

	git clone git@github.com:LuisLaraP/tonali-os.git
	cd tonali-os
	./install.sh

The installation script will first install the packages contained in `pacman_packages.txt` using pacman, skipping those already installed. You can modify this file to add packages you want. Removing packages is not recommended.

The next step is to create the main user. The script will ask for the main user name and create it or adjust its configuration if it already exists. If the user is created, you will be asked to set a password for it.

Then, system configuration files are installed from a remote git repo. If you use this method of syncing files in `/etc`, just put your repo URL in the `sysconfig_repo_url` variable. Otherwise, you can delete this section.

After installation completes, reboot to see the changes:

	reboot
