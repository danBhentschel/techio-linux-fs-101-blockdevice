# Creating a partition
Recall that the `sda` device has an extra 600 MiB of unused space on it after the `sda1` partition. Let's make use of this extra space by creating a new partition on the device. First, we should take a quick look at the partition table. To do so, type the command:

```
sudo fdisk -l /dev/sda
```

> **NOTE:** The `sudo` at the beginning of the command causes the command to be executed with the super user (root) account. Try running the `fdisk` command without `sudo`. What happens? The `/dev/sda` file is crucial for system operation. It holds the enitre operating system. It would be a severe security risk if a non-privleged account could access this file.

@[Start the VM]({"command":"/bin/bash /project/target/launch.sh"})

The output of `fdisk` gives us some new information about our `sda` disk. It confirms that it is, indeed, a 2 GiB device, and it tells us that it is comprised of 4,194,304 sectors, each of which is 512 bytes (0.5 KiB) in size. It also tells us that the first partition, `/dev/sda1` is 2,933,965 sectors in size, from sector 2,048 to sector 2,936,012.

Let's try creating a new partition after this one. Type `sudo fdisk /dev/sda`. This will start up the `fdisk` utility, and provides you with a prompt for a command.

Type `p` and press Enter. The `p` command prints out the partition table. This is the information we already saw.

Type `n` and press Enter. This will create a **new** partition. You will be prompted for several pieces of information (partition type, number, etc.) For now, just press Enter for each prompt to accept the default values. Eventually you will see the following message:

```
Created a new partition 2 of type 'Linux' and of size 614 MiB.
```

To see your new partition, use the `p` command again to print the partition table. When you are done admiring your handiwork, type `w` (for write) and press Enter. This will exit the `fdisk` utility.

Before exiting, `fdisk` informs you that the new partition isn't visible to the OS yet. You can verify this with `lsblk`. Let's make it visible. Execute the following command:

```
sudo partprobe /dev/sda
```

Now execute `lsblk`. Do you see the new partition?
