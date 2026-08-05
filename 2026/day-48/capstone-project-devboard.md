# Capstone Project DevBoard 

To build a complete end-to-end CI/CD Pipeline using GitHub Action, we used existing **DevBoard** project with its existing workflow that was created during the batch live class. 

Used the docker compose to build all the containers with a single command and setup them on EC2 instance. Verified all container worked fine and each workflow files ran successfully except a dependency-scan.yml file. Tested all the steps to fix but due a vulnerability in one of the react router package version it didn't get fixed so far. 

Below are the workflow files: 

- code-quality.yml
- code-tests.yml
-  dast.yml
-  dependency-scan.yml
-  deploy.yml
-  devsecops.yml
-  docker-push.yml
-   docker-scans.yml
-   matrix.yml
-   secret-scanning.yml
-   sonar-scan.yml

Each file serve a purpose like ``dependency-scan.yml`` file is created to scan the packages for the vulnerability found in a package.


## Observation & Learning

