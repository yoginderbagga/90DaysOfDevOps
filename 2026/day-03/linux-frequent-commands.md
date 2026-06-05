# Linux Commands Mostly Used

1. Process Management
   - pgrep
   - ps -aux
   - ps -ef
   - uptime
   - nice -n
   - renice
2. Jobs Control
   - bg
   - &
   - fg
3. File System
4. Network Troubleshooting
   - nslookup
   - dig
   - ping
   - traceroute
   - curl
   - ss -tulpn
   - lsof
6. 

### PROCESS MANAGEMENT

We already gone through what is a process, types of process states, and background/foreground process. Lets review some more commands that are used in daily life of a DevOps Engineer to troubleshoot issues.<br>

``pgrep [process_name]``

To find the process ID for the given process name.

<img width="1093" height="55" alt="image" src="https://github.com/user-attachments/assets/e4a9358a-6fc0-45c0-8c6c-0ab7558de691" /> <br> <br>


``ps -aux``

To display process results along with the resource usages ( memory / CPU consumption ) 

a=process for all the users \
u=user oriend format that shows user layout. \
x=display background process, system daemons 

<img width="1562" height="326" alt="image" src="https://github.com/user-attachments/assets/ebc9ed3b-4f94-4149-b047-da48f8269150" /> <br><br>

``ps -ef``

To find process owner ( parent PID) and the child process details

e= every process \
f= full details \
In ps -ef, the options -e and -f come from the UNIX/System V style of the ps command traditional process management.

<img width="1646" height="499" alt="Screenshot 2026-06-04 111102" src="https://github.com/user-attachments/assets/59540896-f666-4de8-a307-2becebfbb5ee" /><br><br>

top
To display realtime view of the interactive process 

``ps aux --sort=-%cpu | head -n 5``

To display list of processes with high CPU consumption. 

<img width="1562" height="326" alt="image" src="https://github.com/user-attachments/assets/17ead8e3-5539-4e89-855c-115765dff3bd" /><br><br>

``uptime``

To display for how long the system has been up and running, number of users currently logged in, and total load on the system. 

### Adjust Process Priority

``nice -n 10 tar -czvf backup.tart.gz /mydata``

To set the initial priority of a launching program as per the desire value. The lowest the value (-20) -- highest priority will be given to it. <br>
The highest the value (19) -- lowest priority will be given to it. 

``renice -n 10 -p PID`` 

To set the priority of a already running process, assign a new value with (-n) argument and select the PID id for which you would like to make a change. 

### Concept of Jobs Control

``bg [job_spec]``<br>
In Linux, you can run a process in the background with the help of bg command. This is used with an already running process to send a signal to run it in the background, this frees up the terminal so the user can continue the work. <br>In below example, user ping ping 8.8.8.8 IP address and then suddently stopped the process by hitting CTRL +Z, now to resume this process user can type bg or bg %1 ( the job id ) to start it back but in the background. 
( Note: You might notice even when you resumed it in the background, the ping output still shows on the terminal because the output is attached to the terminal whereas this is running in the background. ) <br>

<img width="927" height="342" alt="image" src="https://github.com/user-attachments/assets/75ace95a-51c0-4eaf-81a9-c2b91ee90eb5" /><br><br>


``fg jobid`` <br>
To pull a background or paused job into the active foreground terminal. 

<img width="967" height="167" alt="image" src="https://github.com/user-attachments/assets/127f02d2-b45d-4719-abc6-48b69e2a6921" />

<br>

``&``<br>
In Linux, you can start a new command entirely in the background to keep terminal free so you can focus on your other task. To achieve this add the ampersand & at the end of the command. 

``yoginderbagga@fedora:~$ tar -cvzf /home/yoginderbagga/Documents/random.targz .minikube/cache/linux/ &``

<br>
<img width="1227" height="47" alt="image" src="https://github.com/user-attachments/assets/99e667ee-8dda-4674-9d50-8a484a34818b" />



#### FILE Management Commands

ls -l<br>
To display the files, directory in long listing format with columns of permissions, links, owner, groups, modification time, and file name at the end.<br>
<br>
cp <br>
To copy files or directory to a location. <br>
``cp -r source_location destination_location ( Recursively copy all files in it )``<br>
<br>
 mv  <br>
To move a file to a location or to rename it. <br><br>
``mv old_name new_name``
<br>
<br>
touch<br>
To create an empty file on your system.<br>
``touch myfile``<br>
rm <br>
To remove files or directory permanently from your system. <br>
``rm -rf directory name``   // carefull while run it
<br>
cat <br>
To print the content of a text file to your terminal and also can be used to create a new file which allows you to type text directly into the terminal. <br>
<img width="851" height="221" alt="image" src="https://github.com/user-attachments/assets/7aa00c12-e94a-43bd-adad-08eca907333c" /> <br>

<img width="810" height="226" alt="image" src="https://github.com/user-attachments/assets/ab7d6220-fac1-4002-bbab-00fb443309f8" />




#### NETWORK TROUBLESHOOTING

nslookup:<br>
Name server lookup command is used to find the IP address assocaited with a given domain name and also query the Domain Name System records such as MX or TXT records. <br>

``nslookup w3school.com<br>``
<br>
dig:<br>
dig command is used frequently to investigate network issues, domain name system troubleshooting purpose for a given hostname or IP address. <br>
<img width="912" height="417" alt="image" src="https://github.com/user-attachments/assets/0c60b765-4a9e-479e-a1f4-7a05c220d2d9" />


curl:
Curl command is used to transfer data from your host to server, and server to the host and it works without the user interaction. Curl allows you to download or upload data using the protocols like HTTP, HTTPS, SCP, SFTP, and FTP. User can enter the hostname of the
website and download the home page, or any other page from that site, or even download a .sh file which is hosted on that server. 

To download the web-page and save it in output.html<br>
``yoginderbagga@fedora:~$ curl -o output.html w3school.com``<br>

To download a file from below host, 
``curl ftp://ftp-your-domain-name/file.tar.gz``

<img width="851" height="136" alt="Screenshot 2026-06-05 122700" src="https://github.com/user-attachments/assets/ecf9a89a-b3bf-4a48-9e78-34cd58a82f19" />

Display quick weather report using CURL on your terminal : <br>

``yoginderbagga@fedora:~$ curl wttr.in/Delhi``

<img width="1360" height="632" alt="image" src="https://github.com/user-attachments/assets/4dc4bf09-77e4-4af8-80d1-805dbaddaeed" />
<br>
<br>
ss -tulpn ( Socket Statistics )

It is a linux utility to display status information of network sockets. User can view the TCP, UDP port connection status with their states and associated process. <br>

t: display TCP sockets<br>
u: display UDP sockets<br>
l: display listening sockets<br>
p: display associated process<br>
n: display numeric address<br>
<br>
To filter a port: <br>

<img width="1656" height="121" alt="image" src="https://github.com/user-attachments/assets/7a453d28-2de7-4305-a91d-c5ce4e979e59" />

_DevOps Scenario
_
A container is not working due to the port 80 is already being used by another application and you would like to troubleshoot the issue to find out which application/service is using that port 80, you can use below command in that case : 

``yoginderbagga@fedora:~$ ss -tulpn | grep :80``


