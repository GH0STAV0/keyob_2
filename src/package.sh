#!/bin/bash

### every exit != 0 fails the script
set -e
echo "Install Package - on  based ubuntu 20.04 LTS"
DEBIAN_FRONTEND=noninteractive apt-get remove python3.8
apt autoremove -y
apt update --fix-missing
DEBIAN_FRONTEND=noninteractive apt-get -f install  -y \
        jq \
        nano \
        psmisc \
        sudo \
        tini \
        wget python3.9 python3.9-dev openssh-server locate nano 
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 2
update-alternatives --config python3
echo "Installing ttf-wqy-zenhei"
apt-get install -y ttf-wqy-zenhei software-properties-common \


echo "Installing  xfce "
apt-get install -y dbus-x11 xauth xinit x11-xserver-utils xdg-utils \
        xfce4 tightvncserver novnc websockify \
        python3-numpy build-essential net-tools curl git \
        software-properties-common xfce4-terminal xvfb gedit screen
        #uuid-runtime


echo "Installing  dbus-x11 xauth xinit x11-xserver-utils xdg-utils"
#apt-get install -y dbus-x11 xauth xinit x11-xserver-utils xdg-utils--no-cache=true
DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing  supervisor
