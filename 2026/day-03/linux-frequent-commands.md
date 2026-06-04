# Linux Commands Mostly Used

### PROCESS MANAGEMENT

We already gone through what is a process, types of process states, and background/foreground process. Lets review some more commands that are used in daily life of a DevOps Engineer to troubleshoot issues.

``ps -aux``

To display process results along with the resource usages. 

a=process for all the users \
u=user oriend format that shows user layout. \
x=display background process, system daemons 

<img width="1562" height="326" alt="image" src="https://github.com/user-attachments/assets/ebc9ed3b-4f94-4149-b047-da48f8269150" />  

``ps -ef``

To find process owner ( parent PID) and the child process details

e= every process \
f= full details \
In ps -ef, the options -e and -f come from the UNIX/System V style of the ps command traditional process management.

<img width="1646" height="499" alt="Screenshot 2026-06-04 111102" src="https://github.com/user-attachments/assets/59540896-f666-4de8-a307-2becebfbb5ee" />

top
To display realtime view of the interactive process 

``ps aux --sort=-%cpu | head -n 5``

To display list of processes with high CPU consumption. 

<img width="1562" height="326" alt="image" src="https://github.com/user-attachments/assets/17ead8e3-5539-4e89-855c-115765dff3bd" />

``uptime``

To display for how long the system has been up and running, number of users currently logged in, and total load on the system. 

#### FILE SYSTEM

ls -l


#### NETWORK TROUBLESHOOTING


