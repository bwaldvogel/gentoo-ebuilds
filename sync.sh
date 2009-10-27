#!/bin/sh

time rsync -uarv --delete --delete-excluded --exclude='sync.sh' --exclude='.git' /usr/portage/local/my/ vps:0x11.net/htdocs/gentoo
