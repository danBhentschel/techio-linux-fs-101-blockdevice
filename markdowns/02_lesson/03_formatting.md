# Formatting a partition
In the last lesson we created a new 614 MiB partition on `sda`. Let's double-check that it's still there. Type the `lsblk` command.

@[Start the VM]({"command":"/bin/bash /project/target/lesson3.sh"})


See that `sda2` partition? Notice that it's not mounted anywhere. The **MOUNTPOINT** column is empty. Let's try mounting it. By default, Linux has a `/mnt` directory specifically for use in mounting filesystems temporarily. Type the following command:

```
sudo mount /dev/sda2 /mnt
```

Hmm... Didn't work, did it?

```
mount: wrong fs type, bad option, bad superblock on /dev/sda2,
       missing codepage or helper program, or other error
```

That's because the `sda2` partition hasn't been formatted yet. There's no filesystem on it. It's just a bunch of random data. Let's format it with the EXT4 filesystem. Type this command:

```
sudo mkfs.ext4 /dev/sda2
```

> **NOTE:** The EXT4 filesystem is currently the most commonly used filesystem across all Linux distributions. We will talk more about EXT4 in another course. (Link TBD)

Assuming that all went well, your `sda2` partition should now be formatted with EXT4. Let's try that mount command again. If you get no error then it was probably successful. Check the result with the `lsblk` command. Do you see a mountpoint for `sda2` now?

Switch directories into our new filesystem by executing `cd /mnt` and then check the disk space:

```
df -h .
```

There should be 545 MiB of free space. Wow. We lost a lot of that 614 MiB to the formatting, didn't we? The filesystem elements (superblock, inode and block bitmaps and tables, journal, etc.) take up a nontrivial amount of space. Keep this in mind when planning out your filesystem needs.

Can you write to the filesystem? Try it. First, you will need to give the `techio` user write permissions on the directory. Execute this:

```
sudo chmod ugo+w /mnt
```

(Change file mode for user, group, and others... add write permissions to /mnt)

Now, do the following:

```
echo "Hello, World!" > /mnt/hello.txt
ls -lh /mnt
cat /mnt/hello.txt
```

Did you see the `hello.txt` file on your new filesystem? Let's try creating a large file, like we did before.

```
dd if=/dev/zero of=/mnt/bigfile bs=1M count=100
ls -lh /mnt
df -h /mnt
```

After writing the 100 MiB file, `df` should now report only 445 MiB of free space. Remember I mentioned that `/mnt` is only intended for temporary mounts? Let's clean up after ourselves and unmount that directory:

```
sudo umount /mnt
ls -lh /mnt
df -h /mnt
lsblk
```

After executing the `umount` command, the other three commands should give you varying bits of evidence indicating that `sda2` is no longer mounted on `/mnt`.
