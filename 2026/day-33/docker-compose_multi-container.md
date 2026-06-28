# Docker Compose

## What is Docker Compose and How its different from running Standard Docker command?

As the Docker containers grow in number it becomes difficult to bring them up, create their isolate networks, assign the storage volume etc individually. This problem gets solved by a Docker tool which sits on the top of docker known as "Docker compose". With Docker compose, you create a YAML file ``compose.yml`` to define the configuration of your container to bring them up all at once without handeling them individually. The complete applications components stack can be managed like ``UP`` or ``DOWN`` with commands like ``docker compose up`` and ``docker compose down``

Challenges with multi-container management without ``docker compose``

-> Complex Configuration: So far you have seen, running docker containers requires you to type long commands with network ports, volumes creation, environment var info etc. This can get difficult to manage when there are large number of containers to manage. 

-> Manual Network Creation: You create the network manually to allow them to talk with each other, find the IP address, hardcode the network info to the docker network setup. 



## Task 1: Setup and verify 

1. Install Docker compose on your machine

## Task 2: Create a Docker compose file

1. Create a directory with ``docker-compose-basics``
2. Write your first ``first-compose.yml`` to run nginx container and port mapping
3. Start with ``docker compose up`` and access it from the browser and make it compose down later.


## Task 3: Two-containers Setup

Create a ``two-dockers-compose.yml`` which runs :
   - A WordPress container
   - A MySQL container.


Expected Output : 

- Both be on same netowrk ( compose does this automatically )
- MySQL should have a named volume for the data persistence
- WorldPress should connect to MySQL using service name

Start and access WordPress in your browser. 


## Task 4: Docker Compose Commands 

1. Start a service in the detached mode.
2. View the running services
3. View the logs of all services
4. Stop services without removing them.
5. Remove the containers, networks
6. Build the image if you made any change.

## Task 5: Environment variable

1. How to add a varible in ``docker-compose.yml``
2. Create a ``.env`` file and reference variable from it in your compose file
3. Identify if the variables are picked up.

<br>
<br>


## Task 1:

``ubuntu@ip-172-31-19-178:~$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin``


<img width="1913" height="460" alt="Screenshot 2026-06-28 233929" src="https://github.com/user-attachments/assets/32c12ab8-d287-4782-9489-95455b19394d" />


## Task 2:


Created a ``docker-compose.yml`` file as below and also used the mount points in it. 

```
ubuntu@ip-172-31-19-178:~/docker-compose-basics$ cat docker-compose.yml 
services:
  webserver:
    image: nginx:alpine
    container_name: my_server
    ports:
      - "8080:80"
    volumes:
      - ./html:/usr/share/nginx/html
#      - ./config:/etc/nginx/conf.d
      - ./logs:/var/log/nginx
```

Created three directory as below for the bind mount volume purpose. Suppose you edit the code on your computer at ``./html`` folder now the changes will instantly appear live in the browser without you have to do any further change to the dockerfile or the docker-compose.yml. The reason for that is ``./html`` is directly mounted with the /usr/share/nginx/html directory and when the nginx server runs it look inside the default config directory which is ``/usr/share/nginx/html`` and its mounted with ``./html``

``ubuntu@ip-172-31-19-178:~/docker-compose-basics$ mkdir html config logs``

``ubuntu@ip-172-31-19-178:~/docker-compose-basics$ docker compose up``

<img width="1457" height="282" alt="image" src="https://github.com/user-attachments/assets/ee9a4d51-5ae7-4dee-9aad-337d40b1abc6" />  

Below is the output from the browser: 

<img width="1717" height="265" alt="image" src="https://github.com/user-attachments/assets/2a9957b9-e817-4553-9a21-1387491dbf58" />

Observation:

In the starting, got the error message on the browser as it was because the config directory is empty and since its mounted with the /etc/nginx/conf.d it was getting replaced and when the container ran it didn't find any config there. Carefully, use the bind mounting point. So to fix it I commented in above docker-compose.yml file ``- ./config:/etc/nginx/conf.d``
