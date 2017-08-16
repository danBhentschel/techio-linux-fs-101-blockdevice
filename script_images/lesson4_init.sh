#!/bin/bash


sudo mkfs.ext4 /dev/sda2 &>/dev/null
sudo tune2fs /dev/sda2 -U 14ec56b9-9d53-49e4-992a-45a7e5a64dca &>/dev/null
sudo mkdir /wolf
sudo chmod ugo+x /wolf
sudo cp /etc/fstab /etc/fstab.wolf
echo "
# vvv This line mounts /dev/sda2 on /wolf
UUID=14ec56b9-9d53-49e4-992a-45a7e5a64dca /wolf ext4 defaults 0 0
"| sudo tee -a /etc/fstab.wolf >/dev/null
