#!/bin/bash

ln -s /vmlinuz-4.4.0-89-generic
ln -s /initrd.img-4.4.0-89-generic
ln -s /ubuntu.img
ln -s lesson3.img scripts.img
truncate --size=2147483648 /ubuntu.img
echo "n
p
2


w
"|fdisk /ubuntu.img &>/dev/null

echo "TECHIO> terminal --init /start_vm.sh"

while true; do
    sleep 10
done
