# Capstone Project DevBoard 


To build a complete end-to-end CI/CD Pipeline using GitHub Action, we used existing [DevBoard Repository](https://github.com/yoginderbagga/devboard)
 project with its existing workflow that was created during the batch live class. 

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

<img width="1831" height="961" alt="Screenshot 2026-08-04 073642" src="https://github.com/user-attachments/assets/cb613e3d-9391-494c-a1e6-8b01d44072d8" /> <br> 


<img width="1862" height="972" alt="image" src="https://github.com/user-attachments/assets/e2cbe4e2-6713-4c21-96e7-e58ec0736963" />

**Update: 8th August 2026**

In the initial phase of Capstone Project building there were multiple error received during the time CI/CD Pipeline run and one of main error was from ``dependency-scan.yml`` workflow file which caused the workflow to not get completed. Below is the error message : 

<img width="1412" height="482" alt="Screenshot 2026-08-05 220539" src="https://github.com/user-attachments/assets/c4057e50-9c12-4971-b850-5351f62ba93c" />

``react-router`` package has vulnerability in the package version ``6.0.0 - 7.17.0`` and needs to be updated to a version which is fixed and has no vulnerability. 

## Observation & Learning

1. SonarQube server setup was done on EC2 instance with a container running on 9000 port. There was an issue with SonarQube scan worfklow as well but it got fixed after adding the token and Host URL in GitHub actions.
2. Encountered issue with ``Docker-push.yml`` as well since the Docker Hub PAT and username was not added into the actions repository secret and repository variable
3. Dependency scan workflow issue still but that's due to a package issue with react -router and not the application code. 
