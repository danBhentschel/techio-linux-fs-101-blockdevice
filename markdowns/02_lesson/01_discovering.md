# Discovering block devices
The block devices on a system can be discovered with the `lsblk` command. Try it in the VM to the right. Type `lsblk` at the command prompt and then press Enter.

> **NOTE:** Start the VM by clicking **RUN**. Wait for it to boot up. It might take a while. Once it boots, you can login with the username _techio_. There is no password needed. The VM will only run for 10 minutes. You can restart it by clicking **RUN* again if you go over the 10 minute limit.

The `lsblk` command should give you the following output:

```
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
fd0      2:0    1    4K  0 disk
sda      8:0    0  1.3G  0 disk
└─sda1   8:1    0  1.3G  0 part /home
sdb      8:16   0    3M  0 disk
└─sdb1   8:17   0    3M  0 part /scripts
sr0     11:0    1 1024M  0 rom

There are three different kinds of devices represented here, indicated by the first 2 characters in the device name:

 - **fd** - A floppy drive
 - **sd** - A hard disk (originally SCSI, but now includes SATA, SAS, and others)
 - **sr** - An optical drive

We will be focusing on the hard disk devices, `sda` and `sdb`, for this course.

@[Managing device partitions]({"command":"/bin/bash /project/target/launch.sh","layout":"aside"})
