#!/bin/bash

### every exit != 0 fails the script


wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz
tar xvf ngrok-stable-linux-amd64.tgz && chmod +x ngrok && cp ngrok /usr/bin/
git clone https://github.com/GH0STAV0/SDA_ALL.git
cp /root/install_add/geckodriver22 /usr/bin/
export NO_VNC_HOME=/usr/share/novnc
rm /headless/*.bz2*

git clone https://github.com/GH0STAV0/ALL_HCL.git
service tor restart

