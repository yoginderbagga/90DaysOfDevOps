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

## Task 3:

Setting up Two containers in a ``docker-compose.yml`` file

- WordPress container
- MySQL container

Conditions:

- Both container should be on same network (Do it with compose not manually)
- MySQL Database should have a named volume for the data persistence
- WordPress should connect to MySQL using the service name

Start the container and access WordPress in your browser. 

**Verification**: Stop and restart the container with ``docker compose down`` and ``docker compose up`` and see if the WordPress is still there. 

Before doing this task with ``docker compose`` I first did with manual approach to understand the concepts and there were couple of mistakes that I made during that which I would list down below. First lets understand the command i used that worked for me : 

### Manual Approach 

a) Create the network first for both the container : ``common-net``

```
ubuntu@ip-172-31-19-178:~$ docker network create common-net
349bbd27dc4d2cdfe5364e21b1ce3b5f87d6d4d5ef0e779388044323e534f7c1
```

b) Buld the container for MySQL database using the ``mysql`` image and ensure that you inject the environment variable like MySQL Root Password, MySQL Database, MySQL User, and assign a network to it.

``ubuntu@ip-172-31-19-178:~$ docker run -d -p 3306:3306 --name db_for_audience --network common-net -e MYSQL_ROOT_PASSWORD=12345 -e MYSQL_DATABASE=idb -e MYSQL_USER=iuser -e MYSQL_PASSWORD=***** -v mysql_data:/var/lib/mysql mysql``


c) Build the container for WordPress application using the ``wordpress`` image, and ensure that you inject environment variables including Database Host, Database User, Database Pass, and eventually Database name as WordPress need these variables during the configuration. And assign a network to it. 

``ubuntu@ip-172-31-19-178:~$ docker run -d -p 8080:80 --network common-net --name cms_for_audience -e WORDPRESS_DB_HOST=db_for_audience:3306 -e WORDPRESS_DB_USER=iuser -e WORDPRESS_DB_PASSWORD=12345 -e WORDPRESS_DB_NAME=idb -v wordpress_data:/var/www/html wordpress``

Ensure both the containers are running with their respective port number ?

```
ubuntu@ip-172-31-19-178:~$ docker ps
CONTAINER ID   IMAGE       COMMAND                  CREATED         STATUS         PORTS                                                    NAMES
980478e181c1   wordpress   "docker-entrypoint.s…"   8 seconds ago   Up 6 seconds   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp                  cms_for_audience
1dc4557d9195   mysql       "docker-entrypoint.s…"   5 minutes ago   Up 5 minutes   0.0.0.0:3306->3306/tcp, [::]:3306->3306/tcp, 33060/tcp   db_for_audience
```


Now there were some challenges occured during this step and onwards, which are as below:

1. Initially I created both the containers isolated and there were no common network assigned to them. So make sure to first create a common network where both containers needs to be part of. Container talk with each other using the container name when they're on the same user-defined bridge network. 
2. Second, I didn't add any environment variable except password for both WordPress and MySQL Database. Practically, WordPress doesn't know - Which Database? Which Username? Which Password? So without those credential it won't be configured successfully. Now for the MySQL part, at least the password should be created even if you leave other variables like MySQL Database, MySQL User, as they can be created manually during the Database setup.
3. Not verifying the networking properly. Initially, i thought ``common-net`` network was setup for both of the containers, but somehow it was not as one of the container was still isolated from the ``common-net`` created earlier. So I ran below command which showed that one network IP address was not there :
   ``docker network inspect common-net`` and ``docker inspect db_for_audience``
4. Check the container status with ``docker ps -a`` to see if it exited and when did it exited. And after looking at the logs of Ubuntu OS with below command found that there was out of memory error message, since the RAM was running out. So added the RAM using the SWAP memory commands. 
   ``ubuntu@ip-172-31-19-178:~$ sudo dmesg -T | grep -i -E "oom|out of memory|killed process"``



<img width="1767" height="547" alt="image" src="https://github.com/user-attachments/assets/9ac97634-7fa9-41c9-b10c-60def7f534c1" />

```
ubuntu@ip-172-31-19-178:~$ sudo fallocate -l 2G /swapfile
ubuntu@ip-172-31-19-178:~$ sudo chmod 600 /swapfile
ubuntu@ip-172-31-19-178:~$ sudo mkswap /swapfile
Setting up swapspace version 1, size = 2 GiB (2147479552 bytes)
no label, UUID=63797350-614c-491d-851c-3eb83a873b48
ubuntu@ip-172-31-19-178:~$ sudo swapon /swapfile
```

5. Now I could login to the WordPress from my browser successfully, and added a post, published it. Then I verified the status of it on the terminal by login to SQL below commands to ensure if the post was added indeed or not.

   ``ubuntu@ip-172-31-19-178:~$ docker exec -it db_for_audience mysql -uiuser -pXXXXX``

```
   mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| idb                |
| information_schema |
| performance_schema |
+--------------------+
3 rows in set (0.014 sec)

mysql> use idb;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SHOW TABLES;
+-----------------------+
| Tables_in_idb         |
+-----------------------+
| wp_commentmeta        |
| wp_comments           |
| wp_links              |
| wp_options            |
| wp_postmeta           |
| wp_posts              |
| wp_term_relationships |
| wp_term_taxonomy      |
| wp_termmeta           |
| wp_terms              |
| wp_usermeta           |
| wp_users              |
+-----------------------+
12 rows in set (0.001 sec)
```

<img width="1408" height="702" alt="image" src="https://github.com/user-attachments/assets/02d5f27c-e797-4010-b414-1a73baeb4ced" />

WordPress view of the application : 

<img width="1905" height="967" alt="image" src="https://github.com/user-attachments/assets/e396b8a6-8837-4718-93ea-ea84ec2199c9" />

<br>

I also setup the Dbeaver UI tool and connected it with MySQL and here are the results of the same database.

<img width="1821" height="955" alt="image" src="https://github.com/user-attachments/assets/4d02104f-be5d-43ed-9164-a54bd3f2611a" />


### Building Multi-Container with Docker-compose.yml file for MySQL Database and WordPress web-app 


```
ubuntu@ip-172-31-19-178:~/multi_container_compose$ cat docker-compose.yml 
# To build multi-containers for WorldPress and MySQL using docker compose

services: 
  web_server:
    image: wordpress
    container_name: wordpress_app
    networks: 
      - both_communicate
    ports:
      - "8080:80"
    depends_on:
      - database_service
    environment: 
      - WORDPRESS_DB_HOST=database_service:3306
      - WORDPRESS_DB_USER=iuser 
      - WORDPRESS_DB_PASSWORD=12345
      - WORDPRESS_DB_NAME=idb
    volumes: 
      - wordpress_data:/var/www/html


  database_service:
    image: mysql:latest
    container_name: database_app
    volumes:
        - mysql_data:/var/lib/mysql
    networks: 
      - both_communicate
    ports:
      - "3306:3306"
    environment:
      - MYSQL_ROOT_PASSWORD=12345
      - MYSQL_DATABASE=idb
      - MYSQL_USER=iuser
      - MYSQL_PASSWORD=12345

networks:
  both_communicate:
    driver: bridge

    

volumes: 
  wordpress_data:
  mysql_data:
```
