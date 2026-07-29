In this session, you are going to build a complete CI/CD Pipeline that starts from a code which gets pushed to GitHub automatically and then builds a Docker image and then ships that image to Docker Hub. There would not be any manual steps in this pipeline. 

Now you see a glimpse of real world Production level pipelines

## Task 1: Getting Ready 

1. Use the DevBoard app you Dockerized (or any basic Dockerfile)
2. Now add the Dockerfile to your ``complete-ci-cd`` repository.
3. Use the ``DOCKER_USERNAME`` and ``DOCKER_TOKEN`` secretes from the previous session Day 44

## Task 2: Build your Docker Image in CI

Write a ``.github/workflows/full-pipeline.yml`` which:

1. Triggers to push ``main`` branch
2. Check out the code
3. Build the Docker image and then tags it.

Verification: See the build step logs -- and confirm if the image was build correctly?

## Task 3: Push the image to Docker Hub


## Task 4: Status Badge


## Task 5: Pull the image and Run it
