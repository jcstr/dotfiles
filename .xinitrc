# GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,secrets,ssh)

export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

# pulseaudio
start-pulseaudio-x11  &

# set keyboard layout
setxkbmap -layout us  -option compose:ralt -option caps:hyper &

# screen powersave
xset +dpms
xset dpms 0 0 300

exec i3
