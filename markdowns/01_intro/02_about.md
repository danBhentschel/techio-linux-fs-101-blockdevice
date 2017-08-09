# What is a block device?

A block device is (in very general terms) a piece of hardware that provides data access in blocks (contiguous groups of bytes) as opposed to character devices which provides access to individual data bytes. In actual practice, the term "block device" typically is used to describe a device that provides persistent data storage such as a traditional hard drive, or an SSD, or more recently eNVM. Optical drives also fall under this designation, as do USB drives and tape drives.

## Characteristics of a block device
Block devices of varying types tend to have a lot in common, which allows them to be treated categorically the same at a certain level of abstraction:

 - Data is typically buffered / cached on reads and (if applicable) writes
 - Data is typically organized into files, which are organized into a hierarchical directory structure
 - There are frequently some redundancy and / or failsafe measures implemented to recover from partial or damaged data
 - Access to data on a block device is almost always orders of magnitude slower than access to data in RAM
