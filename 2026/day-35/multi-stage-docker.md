# Multi-Stage Builds in Docker 

## Definition

Multi-Stage build is used to optimize the size of Dockerfile by using several ``FROM`` statements with each having a different base image and start a new stage of the docker build. You can use ``AS`` keyword to assign a name to a particular build stage to make it easy to remember and also seprate the two builds environment completely. The benefit of using multi-stage is compile the code in earlier stage, download the dependencies and then in next stage copy the final image file. It not only helps in creating small size image before the final production but also enhance the security as you keep the build tools, credentials and raw code sperate from the production environment. 






