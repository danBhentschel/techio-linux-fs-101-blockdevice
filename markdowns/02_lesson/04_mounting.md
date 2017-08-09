# Mounting a partition
We've already seen a way to mount a partition temporarily ont `/mnt`. How would we make a permanent mount? First, we need a place in the directory structure for our new filesystem to live. For this exercise, let's mount it under `/wolf`. Start off by executing these commands:

```
sudo mkdir /wolf
sudo chmod ugo+w /wolf
```

@[Start the VM]({"command":"/bin/bash /project/target/lesson4.sh"})

Now, mount `sda2` onto this new directory:

```
sudo mount /dev/sda2 /wolf
```

To make sure all went as planned, check with `lsblk`. That was easy, right? Well, there's a catch. That mount will only last until the next reboot of the system. To check this, try rebooting now:

```
sudo reboot
```

Wait for the VM to reboot, then login again and repeat the `lsblk` command. Oops... `sda2` isn't mounted! The list of filesystems to mount on boot can be found in the `/etc/fstab` (filesystem table) file. Let's take a look at it. Execute the command:

```
cat /etc/fstab
```

You can see in this file a line that mounts `/dev/sda1` on `/` and another line that mounts `/dev/sdb` on `/scripts`. They're not spelled out exactly that way, though. Instead of using the device file name to identify the partitions to mount, the `fstab` file uses the partition UUIDs (Universally Unique Identifiers). 

A UUID is a means of deterministically identifying a disk or partition based on the data on it, and not by the hardware or software configuration. The device label `sda2` is an artifact of the current system configuration. If that configuration were to change (either a software update or a change in the physical connections) then `sda2` could refer to a different device instead.

If we want to mount `sda2` via UUID (and we do!) then we need to find out what that UUID is. Use this command:

```
sudo blkid /dev/sda2
```

This will show us that the UUID we need is `14ec56b9-9d53-49e4-992a-45a7e5a64dca`. Now we can add this to our fstab file with this command:

```
echo UUID=14ec56b9-9d53-49e4-992a-45a7e5a64dca /wolf ext4 defaults 0 0 | sudo tee -a /etc/fstab
```
