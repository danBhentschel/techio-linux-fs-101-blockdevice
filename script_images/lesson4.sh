#!/bin/bash


if [ ! -e /wolf ]; then
    /scripts/lesson4_init.sh

    message="Lesson 4: Mounting a Partition"
    command="sudo mount /dev/sda2 /wolf"
    cmd_list=cmd_list_4_1
else
    message="back"
    command="lsblk"

    if [ -z "$(mount | grep wolf)" ]; then
        cmd_list=cmd_list_4_2
    else
        cmd_list=cmd_list_4_3
    fi
fi

/scripts/welcome.sh "$message" "$command" 2>/dev/null
source /scripts/assistant_commands.sh
