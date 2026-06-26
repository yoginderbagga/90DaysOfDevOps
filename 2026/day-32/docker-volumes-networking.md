# Persistent Data and Container Communication [ Docker Volumes & Networking ]

### What is Dokcer volume?

Docker volume is a persistent data storage mechanism used to store the data permanently unlike in the case of default filesystem in which the data gets deleted as soon as the docker is removed or destroyed. 

Two most common docker storage mechanisms are 

1. Docker Volume: Stored at the host operating system ( In linux at : /var/lib/docker/volumes/)
2. Bind Mounts: Another way to store Docker container data to the localhost is to use Bind mounts which link a specific file or folder from the host machine to the container. Bind Mounts are not directly managed by the Docker CLI and they are not used as frequently as Docker volume.



