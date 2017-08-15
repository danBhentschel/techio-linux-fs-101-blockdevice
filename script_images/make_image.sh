#!/bin/bash

set -x

img_name=$1
shift

dd if=/dev/zero of=$img_name bs=1M count=3

losetup loop7 ${img_name}

echo "n
p
1


w
"|fdisk /dev/loop7

partprobe /dev/loop7

mkfs.ext4 /dev/loop7p1
tune2fs /dev/loop7p1 -U 847bc509-b856-4a1e-9a01-c902bec56801
tune2fs /dev/loop7p1 -c 0

mnt_loc=$(mktemp -d)
mount /dev/loop7p1 $mnt_loc
cp $@ $mnt_loc
umount $mnt_loc
rm -rf $mnt_loc
losetup -d /dev/loop7
