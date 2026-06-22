# Docker Baiscs 

### Task 1: What exactly is docker?

- What is container all about and why do you need it in your project?
- Difference between Containers and Virtual Machines
- Architecture of Docker


### Task 2: Setting up docker 

- Installing docker on Laptop or cloud (AWS or any other Linux server)
- Run your first ``hello-world`` container
- Spend few minutes to understand the output --  write in 1-2 lines what you just learned

### Task 3: Run containers

- Run an Nginx based container and access it
- Run an Ubuntu container in interactive mode and explore it
- List all the running containers
- List all the containers include which are stopped
- Stop a container and remove it.

### Task 4: Play with it

- How to run a container in detached mode and attached mode?
- Give the container a name
- Map a port from your host machine to the container
- Identify the logs of the existing running container.
- How to run a command inside a running container.

### Task 1:

## Docker  

Docker is an open source platform which helps you to build, deploy and run the containers and manage in different environment. 

Containers: 

A docker container is a lightweight, standalone "executable package" of an application which includes everything needed to run an applications. It includes source code, with runtimes, system tools, librariries and configuration to smoothly run it acrosss different computing environments. 

- It solves the problem of portability by reducing the friction of "it works on my machine"; as a container can not only run on a laptop but can easily be moved to cloud environment or hybrid cloud environment or on-premise server. 

- It provides "isolation" means multiple applications can run simultaneously on the same server without any conflicting of the software version or without any interference to each other.

- It provides "efficiency" by removing the use of heavy resources to run the applications on a single physical host servers.

## Difference in Containers and Virtual Machine 

<img width="1260" height="515" alt="Screenshot 2026-06-22 201312" src="https://github.com/user-attachments/assets/d66a188a-9381-465a-be92-22eb57c204ea" />

Virtuali Machine:

Virtualization is the process in which a system resources like RAM, CPU, Disk and Networking can be "virtualized" and used as multiple resources with multiple virtual machines ( VMs Instances ) The difference between a container and virtual machine is that a virtual machine virtualize an entire machine down at the hardware layers. 


Containers :

Container virtualize the operating system layer rather than the exact physical layer (Like in case of VM) . Container share a single host OS Kernel and create lightweight isolated user spaces for the individual application and their dependencies. 

### Architecture of Docker

Below is official image of Docker architecture from Docker website. 
<img width="1233" height="651" alt="image" src="https://github.com/user-attachments/assets/f6f3f69d-e4e1-4099-a9a6-d8f6cac07185" />


### Task 2:

In this task, we will install docker from scractch assuming that this is plain linux with no docker app at all. 



