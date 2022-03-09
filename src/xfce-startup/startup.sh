
#!/bin/bash
echo $(hostname -I | cut -d\  -f1) $(hostname) | sudo tee -a /etc/hosts

export USER="root"
export PASSWORD="123123123"
echo "000000000000000000000000000000000000001111111111111111111111111111111111111"
#touch /root/.Xauthority
mkdir -p /root/.vnc/
echo $PASSWORD | vncpasswd -f > /root/.vnc/passwd
chmod 600 /root/.vnc/passwd
### create VNC configuration file
echo "

" > /root/.vnc/config


cat <<EOF > /root/.vnc/config
rfbport=5901
depth=24
geometry=1360x768
EOF


sudo vncserver
sleep 8
sudo vncserver -kill :1
mv /root/.vnc/xstartup /root/.vnc/xstartup.bak
cat <<EOF > /root/.vnc/xstartup
#!/bin/bash
xrdb /root/.Xresources
autocutsel -fork
startxfce4 &
EOF
chmod +x /root/.vnc/xstartup

touch /root/.Xresources

sudo vncserver -depth 24 -geometry 1360x768 :1
sleep 2
#websockify -D --web=/usr/share/novnc/  6901 localhost:5901
cp /root/.Xauthority /headless/.Xauthority
/headless/install/tun_setup.sh
git -C root/moya/ pull
cd /headless/SDA_ALL/
git reset --hard
git pull


###########################################
/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
