# Project: Dockerize a Full Application 

#### For this task, I have used the DevBoard web-application from the TWS Repository and build its Docker image, container with manual way rather than docker-compose.yml for now. 
#### The purpose of this activity is to understand how to build a full fledge container for an existing application which code is provided by the Development team. In this case, code is provided by the TWS along with docker images. 


## Task 1: Pick an existing Web-App : Dockerboard 

1. Use a Python Flask / Go app with a database
2. Use Postgres database


## Task 2: Write the Dockerfile for the application

1. Write a Dockerfilw for the web-application
2. Use non-root user to run
3. 

## Task 3: Build the containers for the application and deploy it on EC2 Instance. 

1. Buld the container in sequence starting from ``postgres``, ``backend``, ``frontend`` container.
2. Postgre container image creation is not needed as you will be using the official postgre image and run container from it.

## Document the Experinece: 

- what you understand throughtout the complete Dockerization workflow.
- What changes you had faced and how you solved.



# Task 1: Pick a Web-App "Dockerboard" 

1. The first step before building any docker application is to ensure Docker is install on your machine. So first connect with EC2 Instance(Ubuntu) and install the docker app which also include configuring its repository. The steps can be easily be found on google. Once the Docker is fully installed you can run ``docker ps`` command to verify its status.
2. As the Devboard is kept on GitHub repository, you need to fork the repo to your GitHub account and clone its complete code at a directory on Ubuntu OS. (You may have to copy the SSH public key which you created on your EC2 to "GitHub Settings" to allow the SSH access to be happen. Though you use ``git clone git@github.com:yoginderbagga/devboard.git`` command but this uses SSH as a connectivity protocol under the hood. Once the respository is fully cloned, you can move to next step.

# Task 2: Write Dockerfile for application

See the screenshot below for the main directories in the Devboard project. There are many more files consist in each of those directory and I intentionally didn't mentioned them so to keep the focus only on Dockerfile, and other main directories. 

<img width="1866" height="86" alt="Screenshot 2026-07-14 234538" src="https://github.com/user-attachments/assets/3835a81c-ee34-4250-bfc8-78e6d42fc483" />

Now as mentioned earlier, the Dockerfile are already created for this project, you just have to build the images for frontend, backend containers and for the postgres you will not be building the image since you just have to pull the database image of postgres. 

First create a common network in order to allow the communication between the containers to take place. And this can only be possible if they all use a common network. 

Step 1) 

``docker network create devboard-network``

Step 2)

Build images:

``docker build -t devboard-frontend ./frontend``
``docker build -t devboard-backend ./backend``

Step 3) 

Build the postgres database container first as this will be running first. 


```
docker run -d --name postgres --network devboard-net \
  -e POSTGRES_USER=devboard \
  -e POSTGRES_PASSWORD=devboard \
  -e POSTGRES_DB=devboard \
  -v "$PWD/init/postgres":/docker-entrypoint-initdb.d:ro \
  -p 5432:5432 \
  postgres:16-alpine
```

Run the backend container:

```
docker run -d --name backend --network devboard-net \
  -e PORT=8080 \
  -e POSTGRES_URL="postgres://devboard:devboard@postgres:5432/devboard?sslmode=disable" \
  -p 8081:8080 \
  devboard-backend
```

Run the frontend container:

```
docker run -d --name frontend --network devboard-net \
  -p 8080:4173 \
  devboard-frontend
```

Ensure that you have opened the ports for postgre database and nginx ``5432`` ``8080`` to allow the application to be accessible. Now you can see the Devboard project is accessible on the port 8080 at my EC2 Instance. 

<img width="1920" height="1080" alt="Screenshot (19)" src="https://github.com/user-attachments/assets/4be63c3b-6db5-412b-a91d-901056244d80" />

## Learnings & Challenges : 

There were many error messages and challenges faced during the deployment of DevBoard application to EC2 instance with container. Some are as:

1. the first issue was git clone didn't work initially as SSH public key created from the EC2 instance was not copied to the GitHub. Note each time you work on a new machine, server to setup the GitHub first time, the SSH key ( public key) has to be stored on the GitHub first.
2. "internal error" message that keeps coming while adding a new task when the UI was up. After digging further it was observed that the SQL schema file was not added and they need to be added manually. As I checked the database got created, but there was no table existed. So i ran the ``docker logs postgres`` command which showed the below error message:

<img width="1903" height="702" alt="postgres_logs" src="https://github.com/user-attachments/assets/4d482028-2035-46e1-8421-9efc5305fba0" />

3. To fix it, there already exist two SQL schema file which has commands to create the table and insert data into the table. These files are : ``init/postgres/01_schema.sql`` and ``init/postgres/02_seed.sql`` which has script to be run against the container in order to make the table creation successfull. 

```ubuntu@ip-172-31-22-214:~/devboard/devboard/init/postgres$ ls
01_schema.sql  02_seed.sql
```

Ran below commands to create the table and insert the data : 

`` docker exec -i postgres psql -U devboard -d devboard < init/postgres/01_schema.sql``

``docker exec -i postgres psql -U devboard -d devboard < init/postgres/02_seed.sql``
