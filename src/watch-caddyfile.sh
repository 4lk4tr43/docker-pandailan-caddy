#!/bin/sh

while true; do
    /usr/bin/caddy --conf /mnt/Caddyfile --agree --log /mnt/caddy.log &
    inotifywait -e modify,attrib,move_self /mnt/Caddyfile
    pkill caddy
    pkill inotify
done
