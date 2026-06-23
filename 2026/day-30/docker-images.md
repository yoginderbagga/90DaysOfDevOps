# Docker Images and the Lifecycle of a Container

## Task 1: What is docker image. 

1. Pull the ``nginx``, ``ubuntu`` and other container images from Docker hub and list them with their sizes.  
2. Compare the size of ``ubuntu`` and ``alpine`` image and see which one is smaller and why?  
3. Look inside an image and understand the image.  
4. Remove an image you no longer need  


## Task 2: Understand the image layers

1. Run the command ``docker image history <imageid_name>`` and review it.
2. Understand each layers given in the output above and identify their size.
3. Explain in short summary - what is image layers and why does docker use it?


## Task 3: Lifecycle of a container

What is the lifecycle of a container, understand it and write in your own notes.

- create a container without starting it
- Start the container
- Pause it and verify the status
- Unpause a container
- Stop a container
- Restart
- Kill
- Remove

## Task 4: Container Cleanup




## Task 1:

### Docker Image:

1. To pull / download a docker image from Docker Hub registry, use below command. 

``ubuntu@ip-172-31-19-178:~$ docker image pull debian``

```
ubuntu@ip-172-31-19-178:~$ docker image pull debian
Using default tag: latest
latest: Pulling from library/debian
ef1b08ddd59d: Pull complete 
739dd2bc851d: Download complete 
Digest: sha256:fe7312b5f05bf5f43fad76bcd8945642e4e47a68aefd1b73f447615899d0fac1
Status: Downloaded newer image for debian:latest
docker.io/library/debian:latest
```
2. To list the docker images that you have on system:

``ubuntu@ip-172-31-19-178:~$ docker images``

<img width="992" height="187" alt="image" src="https://github.com/user-attachments/assets/48cf8e4c-3db4-482d-88e8-8657cab624d5" />

3. Observe the difference in size of alpine vs ubuntu docker image. Alpine is relatively less in disk usage size 13MB whereas the ubuntu docker size is 160MB which is 15 times high. The reason Ubuntu image size is high as Ubuntu is a features rich OS which provides you thousands of packages, capabilities. Now the Alpine docker image gives you very small size and it has almost nothing pre-installed.

4. <img width="983" height="176" alt="image" src="https://github.com/user-attachments/assets/a6ceb719-12b1-4116-bd90-4fbcc66a19a4" />
