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

3. VGS Output: vgs command is used to display all volume groups on your linux system in one line per group format. 

```
root@fedora:~# vgs
  VG    #PV #LV #SN Attr   VSize   VFree  
  my_vg   1   0   0 wz--n- 196.00m 196.00m
```

4. LVS Output: lvs command display the information about the logical volume in your linux system. ( Currently I"m not able to get the output as there are no logical volume on my Fedora VM)

5. df -h: Display info about the overall space on the disk and available space on the file system right now.

```
root@fedora:~# df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda3        29G   12G   17G  41% /
devtmpfs        2.9G     0  2.9G   0% /dev
tmpfs           2.9G  5.8M  2.9G   1% /dev/shm
tmpfs           1.2G  1.6M  1.2G   1% /run
tmpfs           1.0M     0  1.0M   0% /run/credentials/systemd-journald.service
tmpfs           2.9G   24K  2.9G   1% /tmp
/dev/sda3        29G   12G   17G  41% /home
/dev/sda2       2.0G  512M  1.3G  29% /boot
/dev/sdb1       1.8G   68M  1.8G   4% /mnt/new_drive
/dev/sdc1       436M   34M  403M   8% /home/yoginderbagga/new_drive2
tmpfs           1.0M     0  1.0M   0% /run/credentials/systemd-resolved.service
tmpfs           584M  172K  584M   1% /run/user/1000
/dev/sr0        2.6G  2.6G     0 100% /run/media/yoginderbagga/Fedora-WS-Live-43
tmpfs           584M   44K  584M   1% /run/user/0
```

## Task 2:

Since the existing physical volume space was ran out of the memory, so i first created a new parition with the name /dev/sdc3 and with that created a new physical volume to get the memory. 

<img width="1027" height="560" alt="Screenshot 2026-06-19 184507" src="https://github.com/user-attachments/assets/2e51d23d-ae5c-4aef-a09d-4bbced1f4add" />

```
root@fedora:~# pvcreate /dev/sdc3
  Physical volume "/dev/sdc3" successfully created.
```

## Task 3:

Extended the volume group size using the physical volume memory. 

```
root@fedora:~# vgextend my_vg /dev/sdc3
  Volume group "my_vg" successfully extended
root@fedora:~# vgs
  VG    #PV #LV #SN Attr   VSize  VFree   
  my_vg   2   1   0 wz--n- <1.19g 1020.00m
```


## Task 4:

Logical volume was already created yesterday so used this logical volume and extended its space. 

```
root@fedora:~# lvextend -L +100M /dev/my_vg/new_LV 
  Size of logical volume my_vg/new_LV changed from 196.00 MiB (49 extents) to 296.00 MiB (74 extents).
  Logical volume my_vg/new_LV successfully resized.
```

<img width="1018" height="485" alt="Screenshot 2026-06-19 184930" src="https://github.com/user-attachments/assets/864d1bbc-2752-4bcc-8c5c-0004e05ec292" />

## Task 5:

Why mkfs.xfs?

mkfs stands for make file system, as the partition gets created in order to copy the files to the disk it needs to be formatted as a particular type of file system, it kinds of initialzie the data structure ( inode, metadata data blocks) that are required by the ext4 or xfs file system. 

<img width="1022" height="458" alt="Screenshot 2026-06-19 185331" src="https://github.com/user-attachments/assets/958ff8f1-fc6b-4b1e-b2b0-17621e74f72e" />



## Task 6:

Use lvextend to increase the size of logical volume.


<img width="1072" height="120" alt="Screenshot 2026-06-19 190015" src="https://github.com/user-attachments/assets/7afee908-b0c1-4150-b648-5c77f071180e" />

