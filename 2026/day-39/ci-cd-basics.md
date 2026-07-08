# CI/CD Pipeline

## Task 1: The Problem?

Imagine a team of 5 Developers pushing the code to a repository manually deploying to the production environment, now describe in your own words : 

1. What things can go wrong?
2. What is "it works on my machine and not on other" and how is it a serious issue in deployment?
3. How many times a team can safely deploy code manually?

## Task 2: CI vs CD

Research and write short notes 3-4 lines along with an example on below:

1. Continuous Integration --  what happens, how often and what it catches.
2. Continuous Delivery -- what is the difference in CD and CI? Define "Delivery" in CD?
3. Continuous Deployment -- what is the difference in Continous Delivery and Deployment? Who uses Deployment



## Task 3: Components of Pipeline

- Trigger: How pipeline starts?
- Stage: A logical boundary in Soft Dev (including - build, test, deploy)
- Job: Set of steps or tasks inside a stage.
- Step: a single command or action inside a job
- Runner: the machine which executes the job
- Artifact: its an output or a file/collection of files which you get during a workflow run. When job is completed.

  
## Task 4: Draw a Pipeline 

Draw a CI/CD pipeline for the below scenario and add at least three stages of the CI/CD

`` A developer pushes code to Github, the application gets tested, built a Docker image and deploy to a staging server``


## Task 5: Experiment with a GitHub project

- Look for any project repo on GitHub (Kubernetes, React, FastAPI -- as per your)
- Look for ``.github/workflows/`` folder and open a wofkflow YAML file
- Now describe in your own words:
    - What triggers the pipeline?
    - How many jobs are there in the pipeline?
    - What does it do ( best guess) 
