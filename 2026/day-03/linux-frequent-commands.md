## Linux Commands Mostly Used

#### PROCESS MANAGEMENT

We already gone through what is a process, types of process states, and background/foreground process. Lets review some more commands that are used in daily life of a DevOps Engineer to troubleshoot issues.

``ps -aux``

// for finding the resource usage for a particular process with single page snapshot.
a=process for all the users
u=user oriend format that shows user layout.
x=display background process, system daemons

``ps -ef``

// for finding process owner and child relationship info with single page snapshot.
e= every process 
f= full details
In ps -ef, the options -e and -f come from the UNIX/System V style of the ps command traditional process management.

top
// realtime view of the interactive process 

#### FILE SYSTEM

ls -l


#### NETWORK TROUBLESHOOTING


