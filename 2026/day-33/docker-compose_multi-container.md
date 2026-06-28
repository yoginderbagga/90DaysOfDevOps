# Docker Compose

## What is Docker Compose and How its different from running Standard Docker command?

As the Docker containers grow in number it becomes difficult to bring them up, create their isolate networks, assign the storage volume etc individually. This problem gets solved by a Docker tool which sits on the top of docker known as "Docker compose". With Docker compose, you create a YAML file ``compose.yml`` to define the configuration of your container to bring them up all at once without handeling them individually. The complete applications components stack can be managed like ``UP`` or ``DOWN`` with commands like ``docker compose up`` and ``docker compose down``

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


Task 1:


