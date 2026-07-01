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
