# Discovering block devices
The block devices on a system can be discovered with the `lsblk` (list block devices) command. Try it in the VM below. Type `lsblk` at the command prompt and then press Enter.

@[Start the VM]({"command":"/bin/bash -c '/project/target/lesson.sh 1'"})

The `lsblk` command should give you the following output:

```
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
fd0      2:0    1    4K  0 disk
sda      8:0    0    2G  0 disk
└─sda1   8:1    0  1.4G  0 part /
sdb      8:16   0    3M  0 disk
└─sdb1   8:17   0    3M  0 part /scripts
sr0     11:0    1 1024M  0 rom
```

There are three different kinds of devices represented here, indicated by the first 2 characters in the device name:

 - **fd** - A floppy drive (Yeah, yeah... Comes with the VM. Just ignore it.)
 - **sd** - A hard disk (Originally SCSI, but now includes SATA, SAS, and others.)
 - **sr** - An optical drive

We will be focusing on hard disk devices, in this case the`sda` and `sdb` devices, for this course.

Do you see the `sda1` and `sdb1` devices in the list? They are **partitions** of the `sda` and `sdb` disks. A disk partition is a portion of the drive that is set aside for a specific use. In the case of `sda`, the `sda1` partition uses 1.4 GiB of the 2.0 GiB drive. So there is approximately 600 MiB of unused space on `sda`. There is no free space on `sdb`. The `sdb1` partition uses all 3 MiB of that drive.

Notice that `sda1` is mounted on `/` (the filesystem root). Unless you have changed directories, the command prompt should be in the `/home/techio` directory. You can verify this with the `pwd` (print working directory) command. Try typing the following `df` (file system disk space usage) command:

```
df -h .
```

> **NOTE:** The `-h` flag tells the `df` command to print byte counts in "human readable" format, i.e. `1.2G` vs. `1220172`. The `.` (period) at the end of the command indicates that we're only interested in disk usage for the device that contains the current directory.

You should see the following:

```
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1       1.4G  1.2G  103M  93% /
```

This confirms some information that we already knew. The partition `sda1` is mounted on `/`, and is of size 1.4 GiB. There's some extra info in here as well. First, we see that the partition is labeled as `/dev/sda1`. The `/dev` directory is a special place in Linux. It is the location of files that can be used to represent the devices in your system. Try executing the command `ls /dev`. Do you see all the block devices in this list?

We can also see that the filesystem in `sda1` is about **93%** full; 1.2 GiB are used and 103 MiB are still available. Try the following command:

```
dd if=/dev/zero of=junk bs=1M count=50
```

This will create a 50 MiB file called `junk` in the current directory. What do you think this will do to the available space in the filesystem? Try running the `df` command again to check your hypothesis. Try removing the file with `rm junk`, then run the `df` command again.
