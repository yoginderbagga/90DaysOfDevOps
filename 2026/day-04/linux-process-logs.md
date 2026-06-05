# Linux Processes, Service and Logs Management 
Note: Since process was covered in day-03 session, Hence I will keep this session mostly with Service and Logs. <br>

1. What is systemd vs init?
2. List most frequent Systemd commands
3. DevOps Troubleshooting scenario

## Systemd

Systemd is a Linux System and Service manager which runs as a first process ( PID 1 ) by the Kernel and starts rest of the system services. (It replaces the traditional SysV init system in the modern Linux Distros) Some commons tasks done by Systemd are:
- initilize the Linux system during the boot time. 
- manage the system services 
- it significantly improve the boot speed
- A central service management tools


## Systemd commands and utilities

-> systemctl status sshd.service<br>
-> systemctl stop sshd.service<br>
-> systemctl start sshd.service<br>
-> systemctl enable sshd.service<br>
-> systemctl disable sshd.service<br>
<br>
## Journalct command<br> 

Journalctl with -u is used to display logs specific to a particular service like sshd.service, httpd.service, or NetworkManager.service<br>
-> journalctl -u httpd.service<br> 
-> journalctl -u sshd.service<br>
-> journalctl -u NetworkManager.service<br>
-> journalctl -u NetworkManager.service -b 0

``yoginderbagga@fedora:~$ journalctl -u NetworkManager.service -b 0   ( last reboot sequence 0 ) ``

yoginderbagga@fedora:~$ systemctl status sshd.service 



