#!/bin/sh

time rsync -uarv --delete --delete-excluded --exclude='sync.sh' --exclude='.git' --exclude='.gitignore' /usr/portage/local/my/ vps:0x11.net/htdocs/gentoo
