#!/bin/bash

### every exit != 0 fails the script
set -e
export NO_VNC_HOME=/usr/share/novnc
whoami

mkdir -p /root/EXTRAT/
echo "Install Package - on  based ubuntu 20.04 LTS"
echo "Installing  dbus-x11 xauth xinit x11-xserver-utils xdg-utils"
#apt-get install -y dbus-x11 xauth xinit x11-xserver-utils xdg-utils--no-cache=true
wget http://launchpadlibrarian.net/494460182/xfwm4_4.14.5-1_amd64.deb
dpkg -i xfwm4_4.14.5-1_amd64.deb
apt update
DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing  supervisor pwgen openvpn autocutsel xfwm4=4.14.5-1 python3-pip python3.9-tk python3.9-dev tor

mkdir /root/EXTRAT/firefox-53.0.2/
mkdir /root/EXTRAT/firefox-53.0b9/
mkdir /root/EXTRAT/firefox-57.0.1/
mkdir /root/EXTRAT/firefox-58.0.1/
mkdir /root/EXTRAT/firefox-59.0.1/
mkdir /root/EXTRAT/firefox-60.0.1esr/
mkdir /root/EXTRAT/firefox-61.0.1/
mkdir /root/EXTRAT/firefox-63.0.1/
#https://ftp.mozilla.org/pub/firefox/releases/53.0.2/linux-x86_64-EME-free/en-GB/firefox-53.0.2.tar.bz2
echo "Install Package -firefox-53.0b9.tar.bz2"
wget https://ftp.mozilla.org/pub/firefox/releases/53.0.2/linux-x86_64-EME-free/en-GB/firefox-53.0.2.tar.bz2 && tar -xf firefox-53.0.2.tar.bz2 -C /root/EXTRAT/firefox-53.0.2/
wget https://ftp.mozilla.org/pub/firefox/releases/53.0b9/linux-x86_64/en-US/firefox-53.0b9.tar.bz2 && tar -xf firefox-53.0b9.tar.bz2 -C /root/EXTRAT/firefox-53.0b9/
wget https://ftp.mozilla.org/pub/firefox/releases/57.0.1/linux-x86_64/en-GB/firefox-57.0.1.tar.bz2 && tar -xf firefox-57.0.1.tar.bz2 -C /root/EXTRAT/firefox-57.0.1/
wget https://ftp.mozilla.org/pub/firefox/releases/58.0.1/linux-x86_64/en-GB/firefox-58.0.1.tar.bz2 && tar -xf firefox-58.0.1.tar.bz2 -C /root/EXTRAT/firefox-58.0.1/
wget https://ftp.mozilla.org/pub/firefox/releases/59.0.1/linux-x86_64/en-GB/firefox-59.0.1.tar.bz2 && tar -xf firefox-59.0.1.tar.bz2 -C /root/EXTRAT/firefox-59.0.1/
wget https://ftp.mozilla.org/pub/firefox/releases/60.0.1esr/linux-x86_64/en-US/firefox-60.0.1esr.tar.bz2 && tar -xf firefox-60.0.1esr.tar.bz2 -C /root/EXTRAT/firefox-60.0.1esr/
wget https://ftp.mozilla.org/pub/firefox/releases/61.0.1/linux-x86_64/en-US/firefox-61.0.1.tar.bz2 && tar -xf firefox-61.0.1.tar.bz2 -C /root/EXTRAT/firefox-61.0.1/
wget https://ftp.mozilla.org/pub/firefox/releases/63.0.1/linux-x86_64/en-US/firefox-63.0.1.tar.bz2 && tar -xf firefox-63.0.1.tar.bz2 -C /root/EXTRAT/firefox-63.0.1/
rm *.tar.bz2


echo "Install Package -firefox-53.0b9.tar.bz2"
wget https://ftp.mozilla.org/pub/firefox/releases/53.0b9/linux-x86_64/en-US/firefox-53.0b9.tar.bz2 && tar -xf firefox-53.0b9.tar.bz2 -C /root/EXTRAT
echo "Install bash color"
echo "export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> /root/.bashrc
chmod +x /root/install_add/geckodriver && cp /root/install_add/geckodriver /usr/bin/geckodriver13
echo "Install Package PIP-3 ***** pymysql pyvirtualdisplay faker-e164 Faker PySocks stem  bs4 selenium  ConfigParser lxml  speechrecognition requests pyvirtualdisplay pydub"
pip3 install selenium==4.0.0.a1
pip3 install pymysql pyvirtualdisplay faker-e164 Faker PySocks stem  bs4   ConfigParser lxml  speechrecognition requests \
 pyvirtualdisplay pydub pyautogui emojis emoji mysql-connector

DEBIAN_FRONTEND=noninteractive apt-get install -y  \
        python-numpy \
&& mkdir -p "${NO_VNC_HOME}"/utils/websockify \
&& wget -qO- https://github.com/novnc/noVNC/archive/v1.3.0.tar.gz | tar xz --strip 1 -C "${NO_VNC_HOME}" \
&& wget -qO- https://github.com/novnc/websockify/archive/v0.10.0.tar.gz | tar xz --strip 1 -C "${NO_VNC_HOME}"/utils/websockify \
&& chmod +x -v "${NO_VNC_HOME}"/utils/*.sh \
&& chmod +x -v "${NO_VNC_HOME}"/utils/novnc_proxy \
&& ln -s /usr/bin/python2.7 /usr/bin/python

echo "Install Package OPENVPN TUN/TAP"


cat <<EOF > /headless/install/tun_setup.sh

#!/bin/bash

mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun

/etc/init.d/openvpn restart
#openvpn --mktun --dev tun0 
EOF
git clone https://github.com/y0shimitsugh0st84/moya.git
mv moya /root/
#wget https://ftp.mozilla.org/pub/firefox/releases/53.0b9/linux-x86_64/en-US/firefox-53.0b9.tar.bz2 #&& tar -xf firefox-53.0b9.tar.bz2 -C /root/EXTRAT/firefox-53.0b9/
#wget https://ftp.mozilla.org/pub/firefox/releases/57.0.1/linux-x86_64/en-GB/firefox-57.0.1.tar.bz2 ###&& tar -xf firefox-57.0.1.tar.bz2 -C /root/EXTRAT/firefox-57.0.1/
#wget https://ftp.mozilla.org/pub/firefox/releases/58.0.1/linux-x86_64/en-GB/firefox-58.0.1.tar.bz2 ## && tar -xf firefox-58.0.1.tar.bz2 -C /root/EXTRAT/firefox-58.0.1/
#wget https://ftp.mozilla.org/pub/firefox/releases/59.0.1/linux-x86_64/en-GB/firefox-59.0.1.tar.bz2 # && tar -xf firefox-59.0.1.tar.bz2 -C /root/EXTRAT/firefox-59.0.1/

