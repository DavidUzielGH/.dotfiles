exec redshift &
set-config &
chwallpaper &
xscreensaver -no-splash &
exec --no-startup-id i3-msg 'workspace 1:Web; exec /usr/bin/firefox' &
exec compton --config .config/compton.conf &
unclutter --timeout 2 --ignore-scrolling --jitter 10 &
exec i3
