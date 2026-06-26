# Build Custome Images & Learn how to create Dockerfile

#### What is a Dockerfile?

A Dockerfile is simple text file which consists of sequential instructions(commands) for building a Docker image. Just like a receipt is needed to make the dish. 

<img width="800" height="261" alt="image" src="https://github.com/user-attachments/assets/faee57c4-8f83-4bc6-8729-d54e484748d3" />



## Task 1: Create a simple Dockerfile

1. Create a simple ``Dockerfile`` which has
   1. ``Ubuntu`` as the base image
   2. Install ``curl`` app
   3. Set a default command to print ``Hello from the Yogi image!``
2. Once the Dockerfile created, next build a docker image and tag this with ``simple-ubuntu:v1``
3. Next is to run a container ``my-container`` from the image that you craeted

#### Verification: 

Identify the message printed after running this container; and write 2 lines about what you learned about this flow from Dockerfile -> Docker image ``simple-ubuntu:v1`` -> Eventually the container ``my-container``

## Task 2: Use all Instructions 

Create a Dockerfile which uses all the Dockerfile instructions givne below.

- FROM 
- RUN  
- COPY 
- WORKDIR 
- EXPOSE  
- CMD  

## Task 3: CMD vs ENTRYPOINT

1. Create two docker image first with ``CMD`` instruction that display ``Hello DevOps`` and second image with ``ENTRYPOINT`` and build their container seperately. Run those container and observe the results. What you understood write in your words : when to use CMD vs ENTRYPOINT



## Task 4: Build your Simple Web-Application with Docker

1. Create a simple static website HTML ( index.html )
2. Now write a Dockerfile which uses:
   1. ``nginx:alpine`` as the base image
   2. copy the index.html file to nginx web server directory
3. Build a docker image ``my-website:v1`` using above Dockerfile
4. Run a container from the ``my-website:v1`` image and access it on your browser, also do the port mapping 
      
Build an nginx web-server and deploy your website to i



## Task 5: What is .dockerignore

- Create a .dockerignore file in your existing project and in that file include the files you would like to ignore since they can have confidential information ``node_modules``, ``.git``, ``*.md``, ``env`` 

- Build the image again and verify that ignore files are not included

## Task 6: How to achieve optimization with Docker ?

1. Docker cache : What happens when you rebuild an image after doing a modifcation on one line?
2. Reorder the Dockerfile
3. Why does layer order matter for the build speed?


## Task 1:

<img width="1032" height="220" alt="Screenshot 2026-06-24 033518" src="https://github.com/user-attachments/assets/bb3aff7e-61db-4bff-85b3-df6a6fd2d279" />


<img width="1045" height="498" alt="Screenshot 2026-06-24 034333" src="https://github.com/user-attachments/assets/64fd41e1-b4ad-4996-ac19-eed2f6aa4c98" />

Run it with interactive shell ``it`` to check if ``curl`` was installed in this image or not. 

<img width="1027" height="205" alt="Screenshot 2026-06-24 034508" src="https://github.com/user-attachments/assets/d03e2b26-cd38-4d39-a00e-7f1c7a954a98" />

## Task 2:

#### Dockerfile Instructions

- ``FROM`` : It is the first instruction in Dockerfile and it sets the base image ( for example: an Ubuintu OS      or a programming runtime) needed for the application.

  
- ``RUN``: RUN is an instruction which executes any commands in new layer on top of the current image and then      commits the results. They are mainly used to to install application packages, download dependencies, create     directories, and configuration purpose. ( for example: in Task 1, used apt-get update and apt-get install       curl for installing updates and CURL app)

  
- ``COPY``: To transfer files, directories from the host machine to the Docker filesysstem of the container         you're building. 

  
- ``WORKDIR``: To set a current working directory for executing the commands like ``RUN``, ``CMD``, ``ENTRYPOINT`` and ``CMD`` . This works just like ``cd command`` in Fedora or any Linux.

  ``WORKDIR /home/yoginder`` 
  
- ``EXPOSE``: EXPOSE instruction is kind of informational way to update Docker and other user containerized application should listed to a specific network ports at runtime. Note: Expose does not actually open, or map a specific port, its more like for the documentation purpose for the image builder and person using container. 
  
- ``CMD``: CMD instrcutions in a Dockerfile specifies the default command that needs to be executed when a container starts from the beginning. 

   ``CMD ["echo", "hello from the Yogi image"]``

   ``CMD ["python", "app.py"]``



  #### Steps followed from Dockerfile creation to the container running

 a) create a ``Dockerfile`` 

```
ubuntu@ip-172-31-19-178:~/second_docker$ cat Dockerfile 
#declare the base image
FROM ubuntu:24.04

#declare the command that will will run once the base image is ready
RUN apt-get update && apt-get install -y python3 && apt-get clean

# Set working directory
WORKDIR /app

#Copy file from host to docker image
COPY myweb.html .

#Give the port for the container
EXPOSE 8000

#Default command
CMD ["python3", "-m", "http.server", "8000"]
```

b) build an image ``web_server_python-image:v1`` using the ``Dockerfile`` created in previous step

``ubuntu@ip-172-31-19-178:~/second_docker$ docker build -t web_server_python-image:v1 .``


c) run container using the Docker image created previously ``web_server_python-image:v1``

<img width="1882" height="602" alt="image" src="https://github.com/user-attachments/assets/78f27555-48fe-48b2-8bec-365fc7a426e7" />


<img width="1907" height="467" alt="image" src="https://github.com/user-attachments/assets/d816c1b5-1b9c-4e27-b4e3-2cc63c61efb2" />

#### LEARNING

In above example, created a Dockerfile with the necessary instructions and use that Dockerfile to build an image. Lets understand what each of the instructions means : 

1. ``FROM ubuntu:24.04`` : Fetch a ubuntu base image to create the image you're building for your container.
2. ``RUN apt-get update && apt-get install -y python3 && apt-get clean`` : RUN is used to install the packages or ready the environment during the image building phase.
3. ``WORKDIR /app`` : To setup the working directory. So if you run the command  ``docker exec -it simple_python_server bash`` this will take you ``root@76b2de85af17:/app#`` so /app is the current working directory.
4.  ``EXPOSE 8000`` : For the documentation purpose, to let the image builder and user know that use port 8000 for accessing this web. See below output on the browser web-server is accessible on 8000 port, this doesn't map but documenting purpose.
5.  ``CMD ["python3", "-m", "http.server", "8000"]`` : Interesting command, CMD doesn't run during the image building process, all above commands run during the image building process. Whereas CMD run once the image building completed and you run the conotainer, this will be the first to run as process and whatever command mentioned here will get executed.

```
RUN = "Execute during image creation."
CMD = "Execute when the container starts."
```


## Task 3: CMD vs ENTRYPOINT Difference

1. Create two docker image first with ``CMD`` instruction that display ``Hello DevOps`` and second image with ``ENTRYPOINT`` and build their container seperately. Run those container and observe the results. What you understood write in your words : when to use CMD vs ENTRYPOINT

#### LEARNING

What I observed with CMD instruction, when you pass a message inside the Dockerfile like ``Hello DevOps`` and later when you execute the container build from this image, and during the runtime if you add ``hostname`` or ``ls -l`` or any other command then it will replaced the ``Hello DevOps`` message with the command line argument you provided. 

Lets look at CMD Example : 

Dockerfile =>

```
ubuntu@ip-172-31-19-178:~/first_image$ cat Dockerfile 
# Use an official base image on top of which you will build your custom image
FROM ubuntu:24.04


# Install curl app
RUN apt-get update && apt-get install -y curl 

# Default command to print message
CMD ["echo", "Hello from Yogi image"]
```

Container Outpu with commandline argument => 

As you can see from below results, its not printing the message ``Hello from Yogi image`` instead it display the list of files which is passed as command line argument ``ls -l``. Means its replacing it completely. 
 <img width="1202" height="460" alt="image" src="https://github.com/user-attachments/assets/5d2140e8-3eca-4f5f-812b-0754787cc8e9" />



 Lets look at ENTRYPOINT Example: 

 Dockerfile =>
 
```
ubuntu@ip-172-31-19-178:~/dock$ cat Dockerfile 
FROM ubuntu:22.04

RUN apt-get update -y

# ENTRYPOINT so you can pass argument during CLI 
ENTRYPOINT ["echo", "Hi, from ENTRYPOINT"]
```

Container Output with commandline argument => 

As you can see from below results, its appending the new message which I added via the command line along with the message there in the Dockerfile 

<img width="1297" height="737" alt="image" src="https://github.com/user-attachments/assets/7864cc0f-0d46-4217-9d32-e2cd2f48c151" />


## Task 4: Build a static website to host the index.html page

A small correction : in below image i did mistake with ``EXPOSE 8000`` which should be ``EXPOSE 80`` as nginx web-server listen on port 80, so as per the Dockerfile instruction EXPOSE should be 80 for the container inside. 

``ubuntu@ip-172-31-19-178:~/magicworld$ docker build -t nginx_server:v1 .``

<img width="1717" height="322" alt="image" src="https://github.com/user-attachments/assets/e72b5982-f803-407e-a8da-5c15fc6d04ad" />

<img width="1897" height="437" alt="image" src="https://github.com/user-attachments/assets/fa7e3c1a-94b6-4038-90b6-ae552a58bd19" />

```
ubuntu@ip-172-31-19-178:~/magicworld$ docker ps
CONTAINER ID   IMAGE             COMMAND                  CREATED         STATUS         PORTS                                               NAMES
98b20c488467   nginx_server:v1   "/docker-entrypoint.…"   4 seconds ago   Up 4 seconds   8000/tcp, 0.0.0.0:8000->80/tcp, [::]:8000->80/tcp   goofy_herschel
```

## Task 5: .dockerignore 

Added .dockerignore file to the existing project and then add a file in the same directory ``ignore-me``, verify when you build the image does that file gets included or not. 

