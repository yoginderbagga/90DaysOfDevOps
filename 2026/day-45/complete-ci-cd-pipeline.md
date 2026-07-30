In this session, you are going to build a complete CI/CD Pipeline that starts from a code which gets pushed to GitHub automatically and then builds a Docker image and then ships that image to Docker Hub. There would not be any manual steps in this pipeline. 

Now you see a glimpse of real world Production level pipelines.

To start with first you are using an existing ``Dockerfile`` or ``Devboard project`` to be used for building the Docker image during the pipeline runs. A repository ``complete-ci-cd`` has already been created where a python+flask code ``main.py`` is added that is to display a message on the browser with port ``8080``. You also created a requirements file which has ``flask`` entry to install its dependencies and library for the flask.
Next is ``full-pipeline.yml`` which is a workflow file to build the GitHub actions workflow from scratch. 



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

1. Login to Docker Hub using the secrets
2. Now Tag the image as ``username/repo:latest`` and ``username/repo:sha-<short-commit-hash>``
3. Push both tags

Verification: Go to Docker Hub and verify if your image is there with the tags?

Also, you can add a condition that it push step works only on the ``main`` branch but not on any other branch like features or Pull Requests. 

## Task 4: Status Badge

1. Capture the badge URL of ``full-pipeline.yml`` workflow from the Actions tab
2. Add it inside the ``README.md``
3. Push -- the badge should show green

## Task 5: Pull the image and Run it

1. Pull the image on your machine and run it.
2. Verify if its working.

*Learning / Observation:*

Write in your words what you understand throughout building this complete pipeline and then run them as a container?
