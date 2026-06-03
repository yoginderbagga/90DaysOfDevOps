# LINUX ARCHITECTURE,  PROCESS AND SYSTEMD

### What is Linux?

Linux is an open source, multi-user operating system based on UNIX Operating system with Linux Kernel inside the OS. It was created by Linus Torvalds. Some of the most popular Linux distros include Debian, Fedora Linux, Linux Mint, Arch Linux, and Ubuntu, while commercial distributions include Red Hat Enterprise Linux, SUSE Linux Enterprise. 


### Core Components of Linux 

<img width="432" height="408" alt="image" src="https://github.com/user-attachments/assets/85774d22-8772-4934-b6ad-57f5ad0a7600" />


### What Kernel does? Why it is the core component of Linux? 

Kernel acts as the main bridge between your computer hardware and software applications running on it. Below are the jobs that Kernel does : 

>Memory Management: Keeps track of memory to decide how much to be assigned for each program running.

>Process Management: Deciding CPU allocation for each of the process running , and how much CPU to be assigned for the program. And also teminate the process as required.

>Device Management : Kernel facilitate the communication between with devices ( like mice, memory, network cards) using the device drivers.

>System Calls and Security : System calls ( syscall ) is a fundamental programmatic interface which lets a user application to request for the permission service from the Linux Kernel. There are many tasks that runs in a restricted mode in order to prevent them from crashing, these tasks can not access hardware, memory or the network device directly, a system calls act as a secure and way that request Kernel to execute these tasks on behalf of the application. 

### What Shell does? Why it is the core component of Linux?

Shell is an command line interpreter program which acts as an interface or bridge between the user and the operating system kernel.
When you run commands like cd, ls, top or any commands on the terminal those gets interpreted by shell and translate them into a format
which kernel can safely execute. 
You can also say that shell translates human readable commands into a binary programs which the system can execute. 
Some commons linux shells are : Bash, Zsh or sh. 

( Note : Even your GUI Graphical User Interface is also a kind of shell which user use to communicate with the computer and run different things programs. The same way CLI also works which takes input from you via the terminal and then runs them )


### What is the difference between Userspace and Kernel Space?

There are two virtual memory that provides separate address regions called user space and kernel space. With the help of this space, your system gets protected from the malicious or any errant software behaviour. 

How ? 

Kernel Space: This is the place which is only reserved for running a privilege operating system kernel, kernel extension, device drivers. Whereas, a user space is reserved for running your normal applications software, chrome, text editors and command line utilities, thunderbird app, etc. Applications residing in userspace can not directly access the system's hardware resources, and they must make a system calls to the kernel to request access to the these resources. 

To put simply, user space is an area is responsible for all the applications, code that runs outside the operating system's kernel. 


### What is init and Systemd?

Init : When you power on the laptop, "init" ( inialization ) is the first process which gets launched during the boot process. It makes sure everyhing runs in the right order. The init process is daemon process that continue running until the system is fully shut down. You can also say that, init is the direc ot indirect ancestor for all of the Linux processess. 

DO YOU KNOW ? 

Init itself is started by Linux Kernel and a kernel panic will occur if the Linux Kernel is unable to start properly or dies in between due any reason. It gets assigned the PID 1. 

SystemD

Systemdd is the default system and service manager for the modern Linux distributions such as Fedora, RHEL. It is used to manager the system settings, services on your Linux machine. Systemd organize tasks into components called units and groupf of units into targets. 

Systemd is responsible for several functions like : service management like background daemons services, resolving network configuration, mounting filesystems, logging, resource management, system control etc. It replaces the traditional init scripts by providing the parallelization and dependency management which largely improves the system boot speeds. 


How does Systemd works?

Systemd uses Units, which is the standard configuration object that Linux initialization system (systemd) uses to to monitor and manage 
the system resources. The resources could be : background applications, hardware components, network sockets and storage devices. 
Systemd replaces the legacy SysVinit shell scripts with the plain-text declarative configuration files called unit files. 

Types of Systemd Units : 

``.service`` this unit files manages daemons and applications (example : sshd.service, nginx service)

``.socket`` this manages network sockets or socket communication

``.timer`` this is an alternative to cronjob, uses to schedule the tasks as per user time requirement. 

``.target`` this is also a systemd unit file ( like graphical.target, multi-user.target ) which combines several other systemd units like ( services, sockets, mounts ) to define a particular system state. 


### Systemctl commands : 

systemctl and journalct are the two most common commands used to interact with the systemd service on Linux. 

``systemctl start <service>``

``systemctl stop <service>`` 

``systemctl reload <service>``

``systemctl status <service>``

For making the changes right after the reboot time rather than immediately : 

``systemctl enable <service>``  service should implement and activate automatically right after the reboot.

``systemctl disable <service>`` service should implement a stop from launching aumatically right after the reboot.

### Journalctl commands: 

``journalctl -u "servicename"``   &emsp;&emsp; &emsp;&emsp; &emsp;&emsp; &emsp;&emsp;              // journalct -u ssh

<img width="1255" height="412" alt="Screenshot 2026-06-03 170203" src="https://github.com/user-attachments/assets/92e73833-9727-4fce-9f56-b85d420c8802" />



``journalctl -f``           &emsp;&emsp; &emsp;&emsp; &emsp;&emsp;  		   //display live logs for authentication, service (like nginx), anything that is not working, giving issues.


### Process

When an application, program or any linux command is running on your system - is called a process. Each time a process is running it gets the memory space, its data, program code, CPU time and file descriptors. The process can be identified with a Process ID. Suppose you open the firefox browser then it starts a process in the linux OS. You check the process ID of process with below command : 

**To Quickly find Process ID**

``pgrep firefox``

``pgrep ssh``

**To Get Full Snapshot**

ps aux command provides you real time detailed view /snapshot of the running process on your Linux system, its output is not as much real time as top command which provides interactive output to the terminal. 

``ps aux | grep firefox``

a=show process for all the users in the system rather than the current terminal
u=provides output in a user oriented manner, list the owner information as well. 
x=include processess which are not attached to the terminal

Sort Process by Memory usage: 

ps aux is useful for finding the resources usages like CPU / memory

``ps aux --sort=-%mem | head -5``

ps -ef focuses more on finding the process owner and process child info along with the process info.

``ps -ef | grep ssh``


**Real Time Monitoring**

Use the top and htop commands.

### Background Process Vs Foreground Process

Background process do not block the terminal while you're running your command on the terminal or doing any activity. It works independently, allows you to run do the work on terminal while it runs in the background. 

Foreground process blocks the terminal until the execution of the program, or command gets completed like when you create a container and runs it in the foreground on your terminal. 

### Process States : Running, Sleep, Zombie and Stopped 

Run below command and look at the column stat to check the process state. 

``ps -aux``

Running: When a new process starts, it gets placed into the running or runnable state.
Sleeping: When a process request IO to read file from disk or networ connection, and suppose resources are not available, it stall and do nothing. Goes to sleep.
For example : A process reads data from a NFS or SAN storage and if the network speed is very slow, the read operation might take time, since the process is blocked at this moment. It can not be killed or interrupted as its waiting for hardware condition. Here it is in uninterruptable sleeping state as it waits for the resources to be available, before it moves into a runnable state and doesn't react to any command. 
Zombie: 
Stopped:














####  


