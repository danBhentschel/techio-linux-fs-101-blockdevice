#!/bin/bash

truncate --size=2147483648 /ubuntu.img

if [ $1 -gt 2 ]; then
echo "n
p
2


w
"|fdisk /ubuntu.img &>/dev/null
fi

/start_vm.sh
