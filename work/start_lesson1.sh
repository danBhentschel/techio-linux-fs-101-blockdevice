#!/bin/bash

echo
echo Preparing to start VM...
echo
echo

ln -s /vmlinuz-4.4.0-89-generic
ln -s /initrd.img-4.4.0-89-generic
ln -s /ubuntu.img
ln -s lesson1.img scripts.img
truncate --size=2147483648 /ubuntu.img

/start_vm.sh
