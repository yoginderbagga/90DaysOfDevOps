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

In this step, you build a multi-stage dockerfile which drastically reduce the size that you will see in a minute. First, look at the new Dockerfile that is created for the Multi-Stage for the same app as we used before. 

```
ubuntu@ip-172-31-19-178:~/build_stage$ cat Dockerfile 
# Step 1: Use the official Go image to build the app
FROM golang:1.22-alpine AS builder

# Define the location where you work inside the container
WORKDIR /app

# Copy the source code into container
COPY . .

# Complete GO app
RUN CGO_ENABLED=0 GOOS=linux go build -o gokaapp .

# Step 2: Create a small size runtime image

FROM alpine:latest

WORKDIR /root/

# Copy the compiled binary from the previous builder stage

COPY --from=builder /app/gokaapp . 

EXPOSE 8080

CMD ["./gokaapp"]

```

Here in the stage one ( ``builder stage`` which uses ``golang:1.22-alpine`` ) you are building the app, this consists of Go compiler, tools, and libraries to turn the source code into a runnable application. Even though its quite huge in size, but this will stays behind. 

Then the ``Runtime Stage`` (alpine:latest) is lightweight linux distrubition ( less than 5 MB) and in this stage we copied the compiled binary ie ``gokaapp`` from the previous step. Now once you actually build the image using this Docker file, the image will not consist of the Go compiler. 


<img width="1316" height="537" alt="Screenshot 2026-07-06 213814" src="https://github.com/user-attachments/assets/495dbb47-e3ca-44b9-8e9b-5c6285fb9855" />

See the image size below ``goimage`` is reduced to 5MB from 80MB

<img width="1570" height="246" alt="image" src="https://github.com/user-attachments/assets/722812f1-112c-48c3-8356-2b9143cd6df3" />



## Task 3: Push Image to Docker Hub


## Task 4: Docker Hub Repository



## Task 5: What are the best practices to reduce image size



