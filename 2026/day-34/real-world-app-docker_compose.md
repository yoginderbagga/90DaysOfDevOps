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
