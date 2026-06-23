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

## Task 4: Working with the Running Container

- Run a container in detached mode.


## Task 5: Container Cleanup

- stop all containers and remove them
- remove all the images associated with containers


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


5. Look inside a docker image, use below command to inspect it:

``ubuntu@ip-172-31-19-178:~$ docker image inspect 28bd5fe8b56d``


### How to remove a docker image?

Use docker rm <image_id> command to remove a docker container image, however ensure that the demage being removed should not be depended on any other container already running. If that's the case then stop that container first before deleting the image. (Also, if you don't care about that dependednt container, then you can delete it ``-f`` force option which doesn't prompt you to to delete any container first )

``ubuntu@ip-172-31-19-178:~$ docker rmi fe7312b5f05b``

## Task 2: Image Layer

``docker image history`` command is used to display all the build steps and the layerss that were used to make up a particular Docker image. With this command, you can inspect the size, creation dates and the exact Dockerfile instructions used to create each of the layer. 

```
ubuntu@ip-172-31-19-178:~$ docker image history nginx:latest 
IMAGE          CREATED       CREATED BY                                      SIZE      COMMENT
42f2d24ae18d   5 days ago    CMD ["nginx" "-g" "daemon off;"]                0B        buildkit.dockerfile.v0
<missing>      5 days ago    STOPSIGNAL SIGQUIT                              0B        buildkit.dockerfile.v0
<missing>      5 days ago    EXPOSE map[80/tcp:{}]                           0B        buildkit.dockerfile.v0
<missing>      5 days ago    ENTRYPOINT ["/docker-entrypoint.sh"]            0B        buildkit.dockerfile.v0
<missing>      5 days ago    COPY 30-tune-worker-processes.sh /docker-ent…   16.4kB    buildkit.dockerfile.v0
<missing>      5 days ago    COPY 20-envsubst-on-templates.sh /docker-ent…   12.3kB    buildkit.dockerfile.v0
<missing>      5 days ago    COPY 15-local-resolvers.envsh /docker-entryp…   12.3kB    buildkit.dockerfile.v0
<missing>      5 days ago    COPY 10-listen-on-ipv6-by-default.sh /docker…   12.3kB    buildkit.dockerfile.v0
<missing>      5 days ago    COPY docker-entrypoint.sh / # buildkit          8.19kB    buildkit.dockerfile.v0
<missing>      5 days ago    RUN /bin/sh -c set -x     && groupadd --syst…   87.1MB    buildkit.dockerfile.v0
<missing>      5 days ago    ENV DYNPKG_RELEASE=1~trixie                     0B        buildkit.dockerfile.v0
<missing>      5 days ago    ENV PKG_RELEASE=1~trixie                        0B        buildkit.dockerfile.v0
<missing>      5 days ago    ENV ACME_VERSION=0.4.1                          0B        buildkit.dockerfile.v0
<missing>      5 days ago    ENV NJS_RELEASE=1~trixie                        0B        buildkit.dockerfile.v0
<missing>      5 days ago    ENV NJS_VERSION=0.9.9                           0B        buildkit.dockerfile.v0
<missing>      5 days ago    ENV NGINX_VERSION=1.31.2                        0B        buildkit.dockerfile.v0
<missing>      5 days ago    LABEL maintainer=NGINX Docker Maintainers <d…   0B        buildkit.dockerfile.v0
<missing>      13 days ago   # debian.sh --arch 'amd64' out/ 'trixie' '@1…   87.4MB    debuerreotype 0.17
```
### Docker image Layer

A layer in a Docker image is a immutable filesystem change (addition, modification) that acts as a foundational block of docker image. Whenever you create a Docker image, the commands used in the Dockerfile actually create these sequential layers and stack them using a file system. 

Does all commands in Dockerfile create layer? 
Short anser - no.

Commands like : ``RUN``, ``COPY``, and ``ADD`` are the only commands that aler the file sytstem and add the layers. However, the commands like ``ENV``, ``EXPOSE``, ``CMD`` and ``LABEL`` only add the configuration details (metadata)

### Why Docker uses Layered Architecture?

Docker use layered approach to optize for the storage, and minimize the image building time; and instead of packing the entire operating system into a single monolothic file, Docker structure images as a stack distinct read-only file system callsed as "layers"


## Task 3:

### Lifecycle of a Container:

Below image shows how to create a container with ``docker create`` command without actually starting it. In this case, it pulls the docker image but not run the container. 

<img width="843" height="246" alt="Screenshot 2026-06-24 023202" src="https://github.com/user-attachments/assets/d48c48c5-77d4-4169-9601-23aed0d971ab" />


- create a container without starting it:
  This create a container without actually running it, use the command ``docker create --name <container name>    <image name>``

- Start the container:
  To start the container we can use the command ``docker start hello-world``
  
- Pause it and verify the status:
  To pause a process running inside the container use the command ``docker pause``
  
- Unpause a container:
  To unpause a container ``docker unpause``
  
- Stop a container:
  docker stop will stop the running container, use the command ``docker stop nginx``

- Restart:
  To stop the container immediately and start it again, use this command ``docker restart nginx``

- Kill:
  To kill a running container.
  
- Remove
  To remove a container, use the command ``docker remove nginx``

## Task 4:

### Work with the Running Container

To run a container in dettached mode. 
```
ubuntu@ip-172-31-19-178:~$ docker  run -d --name web-server -p 8080:80 nginx
7cc0037d08097e34c7636ae1eb827ff6997739886fc830e16fbec70c77ce969f
```

To view the logs inside a running container.

``ubuntu@ip-172-31-19-178:~$ docker logs web-server`` 

To execute a command inside a running container and then look around the file system create a files. 

<img width="988" height="188" alt="Screenshot 2026-06-24 025330" src="https://github.com/user-attachments/assets/986b2176-3503-4767-b132-803c02305742" />

To execute a command in a container without actually entering it but just from the outside itself. 

``ubuntu@ip-172-31-19-178:~$ docker exec web-server ls -l``

To view the real time logs of the container:

``ubuntu@ip-172-31-19-178:~$ docker logs -f web-server``


## Task 5:

### Containers Cleanup activity

  In this task, we are going to clean the mess as all the containers were created for the test purpose on EC2     Instance and since they're no longer in use. We are going to first stop the container, then delete the          containers and finally remove the images associated with those containers.

  To stop all the container at once, use the below command, as ``docker ps -q`` will list the numeric ID only     of all the running containers and combine it with ``docker stop`` to actually stop them. 

  ``ubuntu@ip-172-31-19-178:~$ docker stop $(docker ps -q)`` 
  
  Below image shows how to stop and then remove all the containers in a single command. 

  <img width="1007" height="187" alt="Screenshot 2026-06-24 021333" src="https://github.com/user-attachments/assets/07134357-5bc2-4ec8-8a0f-ed5c558cfb21" />

 
  Next is to remove the images that were associated with the containers.

  <img width="1037" height="442" alt="Screenshot 2026-06-24 021600" src="https://github.com/user-attachments/assets/eb181631-a231-4253-a89a-3ffc5290b835" />


  ```
  ubuntu@ip-172-31-19-178:~$ docker ps --size
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS         PORTS                                     NAMES        SIZE
db569e5e7be3   nginx     "/docker-entrypoint.…"   10 seconds ago   Up 9 seconds   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   my-hosting   81.9kB (virtual 175MB)
```

I just created few empty files as I go inside the docker shell with ``docker exec -it`` command and after that the size increased from 81.9KB to 98.1KB see below output.


```
ubuntu@ip-172-31-19-178:~$ docker exec -it my-hosting bash
root@db569e5e7be3:/# touch a b c c
root@db569e5e7be3:/# ls
a  b  bin  boot  c  dev  docker-entrypoint.d  docker-entrypoint.sh  etc  home  lib  lib64  media  mnt  opt  proc  root	run  sbin  srv	sys  tmp  usr  var
root@db569e5e7be3:/# exit
exit
ubuntu@ip-172-31-19-178:~$ docker ps --size
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                                     NAMES        SIZE
db569e5e7be3   nginx     "/docker-entrypoint.…"   4 minutes ago   Up 4 minutes   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   my-hosting   90.1kB (virtual 175MB)
```
