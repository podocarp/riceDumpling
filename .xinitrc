#!/bin/sh 
userresources=$HOME/.Xdefaults
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps 
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f $userresources ]; then
    xrdb -merge $userresources
fi
if [ -f $usermodmap ]; then
    sleep 5 && xmodmap "$usermodmap" &
fi

[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

eval "$(dbus-launch --sh-syntax --exit-with-session)"

xbindkeys
xset s off -dpms
xinput set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Natural Scrolling Enabled' 0
xinput set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Accel Speed' 0.3
xinput set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Tapping Enabled' 1
xinput set-prop 'SynPS/2 Synaptics TouchPad' 'Device Enabled' 0

export LD_LIBRARY_PATH=/usr/lib64/opengl/nvidia/lib

wal -R
~/.fehbg
dwmstatus &
dwm
# exec ck-launch-session dbus-launch --sh-syntax --exit-with-session startplasma-x11
