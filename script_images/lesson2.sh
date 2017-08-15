#!/bin/bash

source /scripts/assistant_commands.sh

/scripts/welcome.sh "Lesson 2: Creating a Partition" "sudo fdisk -l /dev/sda"

/scripts/assistant.sh /scripts/cmd_list_2_1 &
