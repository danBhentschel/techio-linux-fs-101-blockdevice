# Block Devices - Review

Congratulations on completing the **Block Devices** course!

Here is a quick review of what you have learned:

## What is a block device?

A block device is a piece of hardware that provides data access in blocks. It is typically used to describe a device that provides persistent data storage such as a hard drive or an SSD.

## Discovering block devices

You can get a listing of block devices on a system with the `lsblk` command. This will provide you with some basic information about disks and partitions, their size, and where they are mounted.

You can get information about free and used disk space with the `df -h <directory>` command.

## Creating a partition

You can examine partition information and create new partitions with the `fdisk` command. You can refresh the partition information of a device with the `partprobe` command. Commands that modify block devices must be run under the `sudo` command.

Future courses will contain more detailed information about partitioning block devices. (Link TBD)

## Formatting a partition

You can format a partition with the EXT4 filesystem using the `mkfs.ext4` command. You can then mount this filesystem using the `mount` command. The directory `/mnt` is often provided as a convenient location to temporarily mount a filesystem.

Future courses will contain more detailed information about EXT4 and other Linux filesystem options. (Link TBD)

## Permanently mounting a filesystem

A filesystem mounted from the command line with the `mount` command will not stay mounted across system reboots. In order for a filesystem to be mounted at boot time, it must be listed in the `/etc/fstab` file.

A partition can be listed in `fstab` with it's device path (i.e. `/dev/sda2`) but that could change if the hardware configuration changes. A better option is to use the UUID of the partition. This information can be obtained with the `blkid` command.
