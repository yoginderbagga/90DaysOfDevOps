# Multi-Stage Builds in Docker 

## Definition

Multi-Stage build is used to optimize the size of Dockerfile by using several ``FROM`` statements with each having a different base image and start a new stage of the docker build. You can use ``AS`` keyword to assign a name to a particular build stage to make it easy to remember and also seprate the two builds environment completely. The benefit of using multi-stage is compile the code in earlier stage, download the dependencies and then in next stage copy the final image file. It not only helps in creating small size image before the final production but also enhance the security as you keep the build tools, credentials and raw code sperate from the production environment. 


## Task 1: Issues with Single Stage Docker image

Created a Go ``Dockerfile`` which prints the ``hello world`` message as below. 

```
ubuntu@ip-172-31-19-178:~/multi-stagedocker$ cat Dockerfile

# import golang alpine image from docker
FROM golang:1.22-alpine

#Where you will work i.e the location of the directory or folder in container?
WORKDIR /app

COPY . .

# Compile the Go application
RUN go build -o firstapp .

EXPOSE 8080 

# Command to run the executable  
CMD ["./firstapp"]
```


<img width="1251" height="227" alt="image" src="https://github.com/user-attachments/assets/6822afda-1393-4a40-b7d9-ef8004d55ce2" />


## Task 2: Multi-Stage Docker Build



## Task 3: Push Image to Docker Hub


## Task 4: Docker Hub Repository



## Task 5: What are the best practices to reduce image size



