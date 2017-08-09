#!/bin/bash

ln -s /vmlinuz-4.4.0-89-generic
ln -s /initrd.img-4.4.0-89-generic
ln -s /ubuntu.img
ln -s lesson4.img scripts.img
gzip part2.img.gz -cd >> /ubuntu.img
echo "n
p
2


w
"|fdisk /ubuntu.img &>/dev/null

/start_vm.sh
