In this session you will learn about controlling the flow of the pipeline, how to build jobs in a workflow, how to pass data between multiple jobs, environment variable and also using the conditional statements to execute the pipeline. 

# Task 1: Build a Multi-Jobs Pipeline

Create a workflow file ``.github/workflows/multi-job.yml`` with three jobs that does the below:

- ``build`` -- and prints a message "Building the apps"
- ``test`` -- and prints a message ``Running the tests"
- ``deploy`` -- and prints a message ``Deploying the apps``

Also, make sure to run ``test`` job only after ``builds`` succeeds. And ``deploy`` runs only after ``test`` succeeds. 

**Verify** : Observe the results at Action tab to see if the dependency chain works?

A multi-job workflow is created below with three different jobs as mentioned above, and as you can see from the image ``build`` runs first, ``test`` runs second and ``deploy`` run finally. All the three jobs are define inside the ``jobs`` section a keyword **needs** is used in test job and deploy job for creating the dependencies respectively. 

<img width="1245" height="867" alt="Screenshot 2026-07-24 223548" src="https://github.com/user-attachments/assets/a25c3d02-5e53-4b61-ada5-99f089c95846" />


```
yoginderbagga@fedora:~/multi-job-github-actions$ cat .github/workflows/multi-job.yml 
#Goal: Building a multi-job workflow from scratch with three jobs : build, test, and deploy
name: Multi-Jobs Workflow

on:
  push: 
    branches: [ "main" ]

jobs:

# 1. Build the job
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout the code
        uses: actions/checkout@v4


      - name: Compile and Build Application
        run: echo "Running build scripts ..."

# 2. Test the job (Runs only if the previous Build succeeds)

  test:
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Checkout the code
        uses: actions/checkout@v4

      - name: Run the tests
        run: echo "Executing the tests..."

# 3. Deploying the job (Runs only if the Test succeeds)        
      
  deploy:
    runs-on: ubuntu-latest
    needs: test
    steps:
      - name: Checkout the code
        uses: actions/checkout@v4

      - name: Deploy to Production
        run: echo "Deploy applications..."
yoginderbagga@fedora:~/multi-job-github-actions$
```

# Task 2: Environment Variables

In this task, we use environment variables at all 2 level ``Workflow Level``, ``Job Level`` and ``Step Level`` to print the details of variable respective at their scope. 

Also used GitHub context variable which is a structurally organized collection of information about the workflow, variables, runner env, secrets and events that triggered them. 

To look at the complete repository code click here [1]
[1] https://github.com/yoginderbagga/multi-job-github-actions

# Task 3: Job Output

Job output passing between the jobs is used to share dynamically generated data or the config values across the isolated runner environment. As you know, both jobs runns on a seprate isolated virtual machine, and they can not by default share the the memory or files. Hence using ``Outputs`` you can bridge this gap.
