# Build Custome Images & Learn how to create Dockerfile

#### What is a Dockerfile?

A Dockerfile is simple text file which consists of sequential instructions(commands) for building a Docker image. Just like a receipt is needed to make the dish. 

<img width="800" height="261" alt="image" src="https://github.com/user-attachments/assets/faee57c4-8f83-4bc6-8729-d54e484748d3" />



## Task 1:

1. Create a simple ``Dockerfile`` which has
   1. ``Ubuntu`` as the base image
   2. Install ``curl`` app
   3. Set a default command to print ``Hello from the Yogi image!``
2. Once the Dockerfile created, next build a docker image and tag this with ``simple-ubuntu:v1``
3. Next is to run a container ``my-container`` from the image that you craeted

#### Verification: 

Identify the message printed after running this container; and write 2 lines about what you learned about this flow from Dockerfile -> Docker image ``simple-ubuntu:v1`` -> Eventually the container ``my-container``

## Task 2:

Create a Dockerfile which uses all the Dockerfile instructions givne below.


## Task 3:




## Task 4:





## Task 5:





## Task 6:


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

1. ``FROM ubuntu:24.04`` 
