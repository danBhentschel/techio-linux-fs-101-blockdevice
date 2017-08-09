# Mounting a partition
We've already seen a way to mount a partition temporarily ont `/mnt`. How would we make a permanent mount? First, we need a place in the directory structure for our new filesystem to live. For this exercise, let's mount it under `/wolf`. The directory has already been created for us. Go ahead and mount `sda2` on `/wolf` with the command:

```
sudo mount /dev/sda2 /wolf
```

@[Start the VM]({"command":"/bin/bash /project/target/lesson4.sh"})

To make sure it worked properly, check with `lsblk`. That was easy, right? Well, there's a catch. That mount will only last until the next reboot of the system. To check this, try rebooting now:

```
sudo reboot
```

Wait for the VM to reboot, then login again and repeat the `lsblk` command. Oops... `sda2` isn't mounted! The list of filesystems to mount on boot can be found in the `/etc/fstab` (filesystem table) file. Let's take a look at it. Execute the command:

```
cat /etc/fstab
```

You can see in this file a line that mounts `/dev/sda1` on `/`...

```
UUID=0397a46b-a76d-4bda-b85e-3cbdec344d7c /               ext4   defaults 0       1
```

...and another line that mounts `/dev/sdb` on `/scripts`...

```
UUID=847bc509-b856-4a1e-9a01-c902bec56801       /scripts        ext4    defaults,ro     0       0
```

Don't see `/dev/sda1` or `/dev/sdb1` in those lines? That's because instead of using the device file name to identify the partitions, the `fstab` file uses the partition UUIDs (Universally Unique Identifiers). 

A UUID is a means of deterministically identifying a disk or partition based on the data on it, and not by the hardware or software configuration. The device label `sda2` is an artifact of the current system configuration. If that configuration were to change (either a software update or a change in the physical connections) then `sda2` could refer to a different device instead.

If we want to mount `sda2` via UUID (and we do!) then we need to find out what that UUID is. Use this command:

```
sudo blkid /dev/sda2
```

This will show us that the UUID we need is `14ec56b9-9d53-49e4-992a-45a7e5a64dca`. Here is the line we want to add to `/etc/fstab`:

```
UUID=14ec56b9-9d53-49e4-992a-45a7e5a64dca /wolf ext4 defaults 0 0
```

This line has already been prepared on the VM in a file called `/etc/fstab.wolf`. We just need to replace `/etc/fstab` with this new file using the `mv` (move) command:

```
sudo mv /etc/fstab.wolf /etc/fstab
```

Check your handiwork with `cat /etc/fstab`. Try rebooting again and then use `lsblk` to check your partition. Is it mounted on `/wolf` this time?
