#!/bin/bash
echo "000000000000000000000000000000000000001111111111111111111111111111111111111"
export USER="root"
echo $USER
mkdir -p /root/.vnc/
cat <<EOF > $HOME/.vnc/xstartup
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
EOF
chmod +x $HOME/.vnc/xstartup
ls  $HOME/.vnc/

if [ ! -f $HOME/.vnc/passwd ] ; then

    if  [ -z "$PASSWORD" ] ; then
        PASSWORD="123123123"
        echo -e "PASSWORD = $PASSWORD" > $HOME/password.txt
    fi

    #echo "$USER:$PASSWORD" | chpasswd

    # Set up vncserver
    su $USER -c "mkdir -p $HOME/.vnc && echo '$PASSWORD' | vncpasswd -f > $HOME/.vnc/passwd && chmod 600 $HOME/.vnc/passwd && touch $HOME/.Xresources"
    chown -R $USER:$USER $HOME

    if [ ! -z "$SUDO" ]; then
        case "$SUDO" in
            [yY]|[yY][eE][sS])
                adduser $USER sudo
        esac
    fi

else

    VNC_PID=`find $HOME/.vnc -name '*.pid'`
    if [ ! -z "$VNC_PID" ] ; then
        vncserver -kill :1
        rm -rf /tmp/.X1*
    fi

fi
#uuidgen > /etc/machine-id
#service cron restart

# set keyboard for all sh users
echo "export QT_XKB_CONFIG_ROOT=/usr/share/X11/locale" >> /etc/profile
#echo "eeeee" > /root/101010
#git -C /root/ clone https://m0uray@bitbucket.org/m0uray/rlater-zoho.git 
#git -C /root/Desktop/ clone https://m0uray@bitbucket.org/m0uray/sack.git
#slack_in
#/usr/bin/crontab /root/cr0n
#service cron restart
#service ssh restart
#service tor restart
#pkill noip2
#/usr/bin/noip2 -u sadam0vich0 -p baba123A* -Y -U 5
#pkill noip2
#noip2 -Y

/usr/bin/supervisord -n
