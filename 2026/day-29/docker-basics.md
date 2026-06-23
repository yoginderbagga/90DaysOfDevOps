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

In this task, we will install docker from scractch assuming that this is plain linux with no docker app at all. Since i already have ``docker-ce-cli`` package on Fedora 43 so removing it to start everything from fresh. 

(docker-ce-cli is client side tool which accepts your command and give to API to talk with docker daemon ``dockerd``)

1. The first step before installing a docker engine is to configure the docker repository on your Fedora (Linux) and from then only you can install and update the docker. 
<img width="1662" height="327" alt="image" src="https://github.com/user-attachments/assets/4344fc21-e7f7-41ce-95cf-d007a2c55016" />

2. Install the docker engine with below packages. As checked in output Package "containerd.io-2.2.5-1.fc43.x86_64" is already installed when doing the yum update.

``yoginderbagga@fedora:~$ sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin``

<img width="1917" height="546" alt="image" src="https://github.com/user-attachments/assets/857608ea-82f5-40d4-a19b-d0027b048982" />

3. Start the docker engine

``yoginderbagga@fedora:~$ systemctl enable docker.service``

<img width="912" height="540" alt="image" src="https://github.com/user-attachments/assets/5dbbc7f7-f66c-4127-97a0-2ed14902ba28" />

### Started the hello-world container 

Since the image was not in the system it pulled from the docker repository and after downloading to the local machine it ran. Also, there is nothing in the hello-world so it runs for a second and immediately exits so when you run ``docker ps`` command it won't show up there. But if you run ``docker ps -a`` it will show up under the exited container. 

<img width="1212" height="647" alt="image" src="https://github.com/user-attachments/assets/af9909c4-b6b4-45fc-8e56-ea53f16f291a" />

<img width="1596" height="122" alt="image" src="https://github.com/user-attachments/assets/d47d5d7c-2712-45b6-b13a-439795d5609a" />

Learning: 

You use ``docker run``command when you need to create a container from start for the first time using an image, in this case as you can see, it pulled the image from the docker hub so its a combination of two commands. You can also specifify the image name and if the image is not found locally then only it pulls from the registry or docker hub. 

The first column shows a unique ID also known as container ID which gets created when a docker runs. If you destroy the container then a new ID will get created. The second column is the container image column which list the image used for the particular container, in this case hello-world is name of the image developed by someone and hosted on the Docker Hub platform. The third column display the primary process or command that was used to start a container and is running inside it. 

### Task 3:

Running an Nginx container and access it from your browser. 


To run an nginx web-server container, use below command and add ``-d`` to run it in the background and use ``-p host-port:docker-port`` to map the port from the host port to the docker, so this can be accessible outside the container as well. 

``yoginderbagga@fedora:~$ docker run --name my-web-server -d -p 8080:80 nginx``

**Port Mapping**

Port mapping allows the docker container to route the traffic from a specific port on the host machine to a port inside the isolated container. As by default, containers runs on closed internal networks. With the help of port mapping this isolation breaks and allows the external world application to communicate inside the web--browser and communicate with the apps running inside the container. 

```
yoginderbagga@fedora:~$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                                     NAMES
87d47417d9eb   nginx     "/docker-entrypoint.…"   12 seconds ago   Up 10 seconds   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   my-web-server
```

<img width="1275" height="432" alt="image" src="https://github.com/user-attachments/assets/668d5715-e620-48bf-a904-9a7d8a4b6f55" />


``Removing a container, but stop it first``

```
 yoginderbagga@fedora:~$ docker stop my-web-server 
my-web-server
yoginderbagga@fedora:~$ docker rm my-web-server 
my-web-server
yoginderbagga@fedora:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

**List all the container including stopped one**

<img width="996" height="207" alt="image" src="https://github.com/user-attachments/assets/84807a12-50f2-44d7-8157-e3037bebcfd2" />

## Task 4:

### Run Command in a Container

There are two ways to run a command inside a container one is to start a a container fresh and then use interactive terminal to start the bash shell where you then run the commands. Second, is to run a command inside a already running container like below :

``yoginderbagga@fedora:~$ docker exec -t my-web-hosting ls -la`` 

``docker exec`` command runs a new process inside an already running container, this becomes useful when you want to debug, troubleshootot or look inside the configuration of a running container. 

Example #1 created a nginx web-server "my-web-server" and ran a command inside this container using the ``exec``

<img width="882" height="86" alt="image" src="https://github.com/user-attachments/assets/53f60c23-e2c8-4e63-8271-19547da06eb5" />


Example #2 : As you can see in below container "17a0202e3229" was already running it so we used ``docker exe`` command with ``it`` for interactive terminal and ``bash`` with these combinations we executed a command inside the container buit also opend an interactive terminal. 

<img width="1032" height="157" alt="Screenshot 2026-06-24 004352" src="https://github.com/user-attachments/assets/0e303b63-d68e-4b68-8322-b7d32466b77b" />


Run a container in attached mode: 

<img width="1035" height="242" alt="image" src="https://github.com/user-attachments/assets/a5913bcd-c636-474f-a2c3-ba5154f6a339" />

When you run the container in normal mode its usually attached with the terminal and keep this terminal busy; in order to keep the terminal free so you can do the work add (-d) to make it dettached mode. 

<img width="927" height="360" alt="image" src="https://github.com/user-attachments/assets/7df3111c-ada7-487b-b608-b40f7b83c61d" />

To get logs of the docker to perform troubleshooting:

``ubuntu@ip-172-31-19-178:~$ docker logs web-hosting``


### docker inspect: 

Docker inspect command is used to gather information about docker objects such as container, images, volumes, networks etc in JSON array format. 

``ubuntu@ip-172-31-19-178:~$ docker inspect web-hosting``
