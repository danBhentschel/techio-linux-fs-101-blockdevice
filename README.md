# techio-linux-fs-101-blockdevice
A lesson on Linux block devices, for the tech.io learning platform. It is hosted at
[Linux Filesystems 101 - Block Devices](https://tech.io/playgrounds/2135).

# Details on the VMs
The VMs utilize the [techio-qemu](https://hub.docker.com/r/danbhentschel/techio-qemu/) Docker image. This image is engineered to
mount a partition with UUID of `847bc509-b856-4a1e-9a01-c902bec56801` under the `/scripts` directory on boot. It will then execute
the `/scripts/lesson.sh` script when the user logs in.

This lesson shell script can monitor the student's progress in the lesson and offer helpful advice.

There is a separate scripts partition created for each lesson. These partitions contain scripts that are located in the 
[script_images](https://github.com/danBhentschel/techio-linux-fs-01-blockdevice/tree/master/script_images) directory. The
[build.sh](https://github.com/danBhentschel/techio-linux-fs-01-blockdevice/blob/master/script_images/build.sh) script 
builds all the images and places them in the proper location. It can be executed as follows:

```
sudo ./build.sh
```

It must be run as root in a fully functional Linux environment.
