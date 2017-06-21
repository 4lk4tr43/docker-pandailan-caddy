FROM abiosoft/caddy:plugin

RUN apk update && apk add inotify-tools

RUN caddyplug install \
    cors \
    expires \
    filemanager \
    git \
    ipfilter \
    jwt \
    login \
    minify \
    ratelimit \
    upload

ADD . /
RUN chmod +x /src/watch-caddyfile.sh

VOLUME /mnt
EXPOSE 80 443

ENTRYPOINT /src/watch-caddyfile.sh
