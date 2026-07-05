# Building Production like Multi-Container Applications with Docker Compose

In previous session, you build basic multi-container using docker compose for MySQL and WordPress application. So today lets build a production like apps with -- application + database + cache, and add features like healthchecks, restart policies, and service dependencies. 


## Task 1: Build a 3-Service stack: 

- A web application (use Python Flask, Node.js, Java or anything)
- Use Database (Postgres or MySQL)
- An in-memory database cache (Redis)

Goal: Create a simple Dockerfile for the app, that prints "Hello World" and connect to the database 


## Task 2: Use the depends_on and Healthchecks 

- Use the ``depends_on`` to the docker compose file which ensure the application starts after the database
- Use the ``healthchecks`` to frequently test if the container is fully operational
- Use both ``depends on`` with ``condition: service_healthy`` so the application can wait for the database to be fully ready, not just only started.

## Task 3: Restart Policies

## Task 4: Build a Custom Dockerfile in Docker Compose

- Use ``build`` in docker compose file to actually build an image with Dockerfile rather than using a existing image from the dockerhub
- Do the change on application and rebuild, restart the container.

## Task 5: Volumes and Networks

- Create explicit networks in compose file instead of using the default
- Create named volume for the database data
- Add labels to the service for better organization

## Task 6: Add Scaling concept

- Scale the web application to 3 replicas using ``docker compose up --scale``
- Observe the status of dockers and see what exactly happens? If anything breaks? Write your observation. Why the scaling didn't work with port mapping. 


## Task 1:

Started building a python based container with flask dependencies added to it via the requirements.txt file. Verified the output on the browser the "hello, world" works fine. The next steps is to connect the python container with the MySQL container. 

In below example, we created three containers using the docker-compse.yml file that consist of a one custom build image for the web_app ( a python Flask app) and two image for MySQL db and redis imported from the docker hub.

Added the output of the code, which display the "Hello..." message and a counter that counts of visit and count values are stored in the redis cache for fast response.

```
ubuntu@ip-172-31-19-178:~/project-3Service$ docker compose up
[+] up 4/4
 ✔ Network project-3service_default Created                                                                                         0.1s
 ✔ Container redis-cache            Created                                                                                         0.2s
 ✔ Container mysql-db               Created                                                                                         0.2s
 ✔ Container web_container          Created                                                                                         0.1s
Attaching to mysql-db, redis-cache, web_container
```

```
services:
  web:
    build: ./web_app
    container_name: web_container
    ports:
      - "5000:5000"
    environment:
      MYSQL_HOST: database
      MYSQL_USER: appuser
      MYSQL_PASSWORD: apppassword
      MYSQL_DATABASE: appdb
      REDIS_HOST: redis
    depends_on:
      - database
      - redis

  database:
    image: mysql:8.0
    container_name: mysql-db
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: appdb
      MYSQL_USER: appuser
      MYSQL_PASSWORD: apppassword
#volume to declare storage if MYSQL container delete, database still surives
    volumes:
      - mysql_data:/var/lib/mysql

  redis:
    image: redis:7-alpine
    container_name: redis-cache


volumes:
  mysql_data:
```


<img width="1522" height="499" alt="image" src="https://github.com/user-attachments/assets/5af4ba79-11b8-4347-b18c-324ab6b817e9" />

## Task 2: Add healchecks


