# LINUX ARCHITECTURE,  PROCESS AND SYSTEMD

### What is Linux?

Linux is an open source, multi-user operating system based on UNIX Operating system with Linux Kernel inside the OS. It was created by Linus Torvalds. Some of the most popular Linux distros include Debian, Fedora Linux, Linux Mint, Arch Linux, and Ubuntu, while commercial distributions include Red Hat Enterprise Linux, SUSE Linux Enterprise. 


### Core Components of Linux 

#### What Kernel does? Why it is the core component of Linux? 

Kernel acts as the main bridge between your computer hardware and software applications running on it. Below are the jobs that Kernel does : 

>Memory Management: Keeps track of memory to decide how much to be assigned for each program running.

>Process Management: Deciding CPU allocation for each of the process running , and how much CPU to be assigned for the program. And also teminate the process as required.

>Device Management : Kernel facilitate the communication between with devices ( like mice, memory, network cards) using the device drivers.

>System Calls and Security : System calls ( syscall ) is a fundamental programmatic interface which lets a user application to request for the permission service from the Linux Kernel. There are many tasks that runs in a restricted mode in order to prevent them from crashing, these tasks can not access hardware, memory or the network device directly, a system calls act as a secure and way that request Kernel to execute these tasks on behalf of the application. 

#### What Shell does? Why it is the core component of Linux?

Shell is an command line interpreter program which acts as an interface or bridge between the user and the operating system kernel.
When you run commands like cd, ls, top or any commands on the terminal those gets interpreted by shell and translate them into a format
which kernel can safely execute. 
You can also say that shell translates human readable commands into a binary programs which the system can execute. 
Some commons linux shells are : Bash, Zsh or sh. 

( Note : Even your GUI Graphical User Interface is also a kind of shell which user use to communicate with the computer and run different things programs. The same way CLI also works which takes input from you via the terminal and then runs them )


#### What is the difference between Userspace and Kernel Space?

There are two virtual memory that provides separate address regions called user space and kernel space. With the help of this space, your system gets protected from the malicious or any errant software behaviour. 

How ? 

Kernel Space: This is the place which is only reserved for running a privilege operating system kernel, kernel extension, device drivers. Whereas, a user space is reserved for running your normal applications software, chrome, text editors and command line utilities, thunderbird app, etc. Applications residing in userspace can not directly access the system's hardware resources, and they must make a system calls to the kernel to request access to the these resources. 

To put simply, user space is an area is responsible for all the applications, code that runs outside the operating system's kernel. 


























####  


<img width="432" height="408" alt="image" src="https://github.com/user-attachments/assets/85774d22-8772-4934-b6ad-57f5ad0a7600" />
