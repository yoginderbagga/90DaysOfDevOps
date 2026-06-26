# Persistent Data and Container Communication [ Docker Volumes & Networking ]

### What is Dokcer volume?

Docker volume is a persistent data storage mechanism used to store the data permanently unlike in the case of default filesystem in which the data gets deleted as soon as the docker is removed or destroyed. 

Two most common docker storage mechanisms are 

1. Docker Volume: Stored at the host operating system ( In linux at : /var/lib/docker/volumes/)
2. Bind Mounts: Another way to store Docker container data to the localhost is to use Bind mounts which link a specific file or folder from the host machine to the container. Bind Mounts are not directly managed by the Docker CLI and they are not used as frequently as Docker volume.



## Task 1: Adding data to Postgre Container

1. Run a Postgres or MySQL Container and add some data inside it ( a table or rows )
2. Stop and remove the container
3. Run a new one and verify if the data is still there or not

Write your observation in few lines

## Task 2: Creating Volumes

1. 


## Task 3: Setting up Bind Mounts



## Task 4: What is Docker Networking?



## Task 5: Setting up Customer Networks



## Task 6: Bring All Concepts Together

