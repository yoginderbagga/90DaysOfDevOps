# Knowledge Reinforcement Log (From day 1-11)

### 5 Commands That Saved Most of Time 

- Identify high consumption proces : ps aux, top 
- Identify which ports are listening : ss - tulpn
- Identify the service status : systemct status
- Display available disk space in human readable format : df -h
- Change the permission : chmod
- Output redirection command ( ">") : df -h > output-disk-space.txt


### Check If Service Is Healthy - List 3 Commands to Test

- Use the systemct status
- Use the journalctl -u <service-name>
- Use the netstat command

### Safely Change Ownership and Permission - List a Command

- Use the chmod command and chown
- Use the chgrp command
- Use the selinux ( semanage command ) 

### Focus and Improvement Area For Upcoming Days

- Using Curl command
