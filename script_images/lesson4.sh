#!/bin/bash

alias go_away='
killall assistant.sh;
echo " ==> Bye! <=="'

if [ ! -e /wolf ]; then
    sudo mkfs.ext4 /dev/sda2 &>/dev/null
    sudo tune2fs /dev/sda2 -U 14ec56b9-9d53-49e4-992a-45a7e5a64dca &>/dev/null
    sudo mkdir /wolf
    sudo chmod ugo+x /wolf
    sudo cp /etc/fstab /etc/fstab.wolf
    echo UUID=14ec56b9-9d53-49e4-992a-45a7e5a64dca /wolf ext4 defaults 0 0 | sudo tee -a /etc/fstab.wolf >/dev/null

    /scripts/welcome.sh "Lesson 4: Mounting a Partition" "sudo mount /dev/sda2 /wolf"

    /scripts/assistant.sh /scripts/cmd_list_4_1 &
else
    /scripts/welcome.sh "back" "lsblk"

    if [ -z "$(mount | grep wolf)" ]; then
        /scripts/assistant.sh /scripts/cmd_list_4_2 &
    else
        /scripts/assistant.sh /scripts/cmd_list_4_3 &
    fi
fi
