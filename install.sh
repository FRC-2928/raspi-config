#!/usr/bin/bash
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root" 
	exit 1
fi

# People never remember to clone --recursive
git pull --recurse-submodules
git submodule update --recursive --remote
# Install opencv dependancies
apt-get update
apt-get upgrade

apt-get install build-essential cmake pkg-config\
	libjpeg-dev libtiff5-dev libjaspar-dev libpng12-dev\
	libavcodec-dev libavformat libswscale-dev libvhl-dev\
	libxvidcore-dev libx264-dev libgtk2.0-dev libatlas-base-dev\
	gfortran python2.7-dev python3-dev python2 python3 python-pip
pip install numpy
dpkg -i packages/*.deb
cp -rv ./etc /etc
cp -rv ./usr /usr
systemctl enable vision.service
systemctl enable shutdown-script.service
echo "Finished. Reboot to apply changes."