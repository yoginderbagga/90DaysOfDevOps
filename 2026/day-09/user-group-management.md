# User and Group Management 
<br>

#### 1. Create user account in Linux and verify their record exists
<br>

- Raju
- John
- Tina

Verify at: /etc/passwd and /home directory 

#### 2. Create Groups 

- programmers
- devops

verify at: /etc/group 

#### 3. Assign users their secondary group

- Raju -> programmers
- John -> programmers + devops
- Tina -> devops

verify at: /etc/group or id "user" command to check if their group is properly assigned.

#### 4. Create a share directory for the users and set appropriate permission

1. Create a directory named: /opt/client_project
2. Set group owner to the programmers
3. Set the permission to 775 (rwxrwxr-x)
4. Create the test files as the user Raju, John and Tina

verify at: file permission to see which permission they got.

#### 5. Now setup a Team collaboartion group 

1. Create a user Hermione along with the home directory
2. Setup a group team-collab
3. Add the user Hermione and Raju to team-collab
4. Create /opt/team-project directory
5. Assign the appropriate permission to team-collab group as 775
6. Create a file by the user Hermione and verify the permission.

# Solution


1. User create

<br>

```
yoginderbagga@fedora:~$ sudo useradd Raju
[sudo] password for yoginderbagga: 
yoginderbagga@fedora:~$ sudo useradd John 
yoginderbagga@fedora:~$ sudo useradd Tina
```

Verification user creation at location /etc/passwd:
<br>

``yoginderbagga@fedora:~$ cat /etc/passwd``


2. Setup groups


```
yoginderbagga@fedora:~$ sudo groupadd programmers
yoginderbagga@fedora:~$ sudo groupadd devops
```

verify group creation at location /etc/group
``yoginderbagga@fedora:~$ cat /etc/group``


3. Assign users to their secondary group. 


```
yoginderbagga@fedora:~$ sudo usermod Raju -aG programmers 
yoginderbagga@fedora:~$ sudo usermod John -aG programmers 
yoginderbagga@fedora:~$ sudo usermod John -aG devops
```


4. Shared Directory

A directory with the name "/opt/client_project" and assigned its group ownership to the programmers group. Also, made the permission as 775.
<br>
<img width="1032" height="107" alt="Screenshot 2026-06-10 134247" src="https://github.com/user-attachments/assets/c40e26e1-2bc1-443f-8205-2ab1dc10126a" /> <br>

<br>

# Observation / Challenges 

During task 4, while setting up the password for any of the user, it keep throwing ``passwd: Authentication token manipulation error`` message. Then started debugging the error with below runbook and fixed it with the restorecon SeLinux command. 
<br>
<img width="1030" height="173" alt="Screenshot 2026-06-10 124837" src="https://github.com/user-attachments/assets/12c2f720-71ea-42d0-a76b-7e10f3d8ee90" />

A) verified permission for both the files /etc/passwd and /etc/shadow ; which found to be good as both belongs to "root" user only with root group.

```
root@fedora:~# ls -l /etc/passwd /etc/shadow
-rw-r--r--. 1 root root 3520 Jun 10 08:31 /etc/passwd
-rw-r-----. 1 root root 1689 Jun 10 08:31 /etc/shadow
```
<br>

B) verified disk space to confirm if the filesystem has been full or not. 

```
root@fedora:~# df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda3        29G  9.8G   19G  35% /
devtmpfs        2.9G     0  2.9G   0% /dev
tmpfs           2.9G   92K  2.9G   1% /dev/shm
tmpfs           1.2G  1.6M  1.2G   1% /run
tmpfs           1.0M     0  1.0M   0% /run/credentials/systemd-journald.service
tmpfs           2.9G   12K  2.9G   1% /tmp
/dev/sda3        29G  9.8G   19G  35% /home
/dev/sda2       2.0G  510M  1.3G  28% /boot
/dev/sdb1       1.8G   68M  1.8G   4% /mnt/new_drive
/dev/sdc1       436M   34M  403M   8% /home/yoginderbagga/new_drive2
tmpfs           1.0M     0  1.0M   0% /run/credentials/systemd-resolved.service
tmpfs           584M  136K  584M   1% /run/user/1000
/dev/sr0        2.6G  2.6G     0 100% /run/media/yoginderbagga/Fedora-WS-Live-43
tmpfs           584M   44K  584M   1% /run/user/0

```

<br>

C) Verified if the file inode exhausted or not. If the file node has 100% exhausted that means file can not be updated. 

```
root@fedora:~# df -i
Filesystem      Inodes IUsed   IFree IUse% Mounted on
/dev/sda3            0     0       0     - /
devtmpfs        741169   630  740539    1% /dev
tmpfs           747459     5  747454    1% /dev/shm
tmpfs           819200  1289  817911    1% /run
tmpfs             1024     2    1022    1% /run/credentials/systemd-journald.service
tmpfs          1048576    49 1048527    1% /tmp
/dev/sda3            0     0       0     - /home
/dev/sda2       131072   406  130666    1% /boot
/dev/sdb1       976384     3  976381    1% /mnt/new_drive
/dev/sdc1       256000     8  255992    1% /home/yoginderbagga/new_drive2
tmpfs             1024     2    1022    1% /run/credentials/systemd-resolved.service
tmpfs           149491   181  149310    1% /run/user/1000
/dev/sr0             0     0       0     - /run/media/yoginderbagga/Fedora-WS-Live-43
tmpfs           149491    46  149445    1% /run/user/0
```
<br>

D) Verified PAM file configuration 

```
root@fedora:~# cat /etc/pam.d/passwd
root@fedora:~# cat /etc/pam.d/system-auth 
```
<br>

E)Verified the journalct -xe logs which showed the root cause of the issue. 

<br>
``root@fedora:~# journalctl -xe``

<img width="1920" height="1080" alt="Screenshot (13)" src="https://github.com/user-attachments/assets/0d96cf7c-a001-4a08-85f4-56e0b6e58774" />

Resolution: 

restorecon -Rv /etc

Applied the SeLinux default context to the complete directory ( /etc ) and its fils/folders to fix any permission issue with the password file /


```
root@fedora:~# sudo restorecon -Rv /etc/
Relabeled /etc/foomatic/hashes.d/hashes.new from system_u:object_r:etc_runtime_t:s0 to system_u:object_r:etc_t:s0
Relabeled /etc/nshadow from system_u:object_r:unlabeled_t:s0 to system_u:object_r:shadow_t:s0
```


