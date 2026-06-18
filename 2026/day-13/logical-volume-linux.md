# Logical Volumen Management 

Topics:

1. Verify the current storage space
   1. lsblk
   2. pvs
   3. vgs
   4. lvs
   5. df -h
2. Create the physical volume
   1. pvcreate
3. Create the Volume Group
   1. vgcreate
4. Create the logical volume
   1. lvcreate
5. Format the disk and mount the file system
   1. mkfs
   2. mkdir
   3. mount
   4. df -h
6. Extend the volume size
   1. lvextend
   2. resize2fs
   3. df -h
   

## Task 1:

1. LSBLK Output: lsblk command is used to display all the storage device and their respective partitions created in those devices. 
   
```
yoginderbagga@fedora:~$ lsblk
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda      8:0    0 30.4G  0 disk 
├─sda1   8:1    0    1M  0 part 
├─sda2   8:2    0    2G  0 part /boot
└─sda3   8:3    0 28.4G  0 part /home
                                /
sdb      8:16   0  7.7G  0 disk 
└─sdb1   8:17   0  1.9G  0 part /mnt/new_drive
sdc      8:32   0  2.1G  0 disk 
├─sdc1   8:33   0  500M  0 part /home/yoginderbagga/new_drive2
└─sdc2   8:34   0  200M  0 part 
sr0     11:0    1  2.6G  1 rom  /run/media/yoginderbagga/Fedora-WS-Live-43
zram0  251:0    0  5.7G  0 disk [SWAP]
```
2. PVS output : pvs command is used to display one line summary of the physical volume in your Linux system.

```
root@fedora:~# pvs
  PV         VG    Fmt  Attr PSize   PFree  
  /dev/sdc2  my_vg lvm2 a--  196.00m 196.00m
```


## Task 2:


## Task 3:



## Task 4:



## Task 5:


## Task 6:
