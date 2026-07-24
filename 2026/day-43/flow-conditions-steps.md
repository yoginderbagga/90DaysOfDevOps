In this session you will learn about controlling the flow of the pipeline, how to build jobs in a workflow, how to pass data between multiple jobs, environment variable and also using the conditional statements to execute the pipeline. 

# Task 1: Build a Multi-Jobs Pipeline

Create a workflow file ``.github/workflows/multi-job.yml`` with three jobs that does the below:

- ``build`` -- and prints a message "Building the apps"
- ``test`` -- and prints a message ``Running the tests"
- ``deploy`` -- and prints a message ``Deploying the apps``

Also, make sure to run ``test`` job only after ``builds`` succeeds. And ``deploy`` runs only after ``test`` succeeds. 

**Verify** : Observe the results at Action tab to see if the dependency chain works?
