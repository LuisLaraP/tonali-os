# tonali-os

My personal Linux distribution, in the form of a post-installation script on top of Arch Linux.

## Installation

TonaliOS is meant to be installed on top of a clean Arch Linux install. Installing Arch is outside of the scope of this project, but you can follow the [official guide](https://wiki.archlinux.org/title/Installation_guide).

Then, inside your fresh Arch install, run the following commands as root:

	git clone git@github.com:LuisLaraP/tonali-os.git
	cd tonali-os
	./install.sh

The script will ask for some information and complete the installation. After it completes, reboot to see the changes:

	reboot
