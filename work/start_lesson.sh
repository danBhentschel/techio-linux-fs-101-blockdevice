#!/bin/bash

echo
echo Preparing to start VM...
echo
echo

ln -s /vmlinuz-4.4.0-89-generic
ln -s /initrd.img-4.4.0-89-generic
ln -s /ubuntu.img
ln -s lesson${1}.img scripts.img
if [ -e /project/target/prepare_vm.sh ]; then
    /project/target/prepare_vm.sh ${1}
fi

/start_vm.sh
