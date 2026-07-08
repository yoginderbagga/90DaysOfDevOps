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



## Task 1

#### Below are the explanation in your own words for the above queries: 

1. Since all 5 Developers are pushing code to a same repository this can result in duplicate code added to the production repo. Also, as its directly being deployed to ``production`` environment can create bad experience for the customers if there's a wrong code, feature added.
2. When an application is build according to a particular environment (say Linux RHEL) with particular architecture in mind and gets tested, deployed for that environment only then it creates a portability issue for the other environment (says Linux Ubuntu, Suse, Windows 11, mac OS) or any other environment. Because it was designed, build without adding the software dependencies or libraries that were supported on other operating system and architecture environment. So if second person execute or run the same app in a different environment then it will not run and give the error message.
3. If we exclude CI/CD from the picture, then an organization can only deploy a code or change to an existing application only few times(2-3) in a month as the new features gets build by the Development team.

Gemini :

1. Deploying unreviewed code directly to production branch can cause risks such as: a critical downtime due to untested code or merge conflicts, accidental overrides of live data. No Accountability: directly pushing the code cause missing of "Who and when" changes done. Because without any PR or code review makes rollback difficult.
2. A commons situation when the software functions correctly in your local environment but fails on other person computer or production environment. It happens because of the code depends on hidden data variable outside the app itself :
   ->Missing dependencies: your computer might have specifict dependencies, packages, tools which are missing on other.
   ->Environment difference: different version of Python software 3.8 vs 3.11 which changes how the commands and file paths are handles.
   ->hidden config: local env variable ``.env`` with some secret key that are not present in other machine.
3. Manual deployment consists of hands-on human interventation ( like moving the files, running the scripts) which sometime cause risks and increase the downtime during the rollback. Hence 1 to 3 times per week are the deployment is done.

## Task 2: CI / CD

#### Continuous Integration: what happens, how often and what it catches.


When a software developer frequently merge new code changes (features) into a central repository that process is called Continuous Integration (CI) Each time Vijay merge or integrate a change that triggers a build and some automatic testing to make sure the newly added code doesn't mess up the existing application. 

Continuous Integration(CI) normally happens several times a day, as a developer makes a commit or merge a pull request into the shared respository. Each code automatically triggers a build and testing process. 

Continuous Integration catches so many things: for example it catches integration bugs, merge conflicts, syntax errors or test failures automatically. It ensures that new changes to the conde doesn't conflict with the existing funcionality. 
- Sntax issues: Linters catches basic formatting errors.
- Compile and Build errors: Automatic builds verify that code can be compiled and package properly
- Functional Testing: It does the Unit & Integration testing to verify individual components and system work as expected.
- Security Vulnerability: SAST and dependency scans catches security flows in code.

#### Continuous Delivery -- what is the difference in CD and CI? Define "Delivery" in CD?

Continous Integration is the first step done during the pipeline where developers are required to merge the code changes to a codebase repository several times a day. The goal is to catch and resolve the bug early on and prevent any issues during the code integration. 


Continous Delivery(CD) is the after step done when CI is completed, it makes sure integrated code is ready to be deployed in the production environment at the click of a button. Note: Continous Delivery requires a kind of manual approval step before the actual code goes live to the production, whereas "Conitinous Deployment" takes it a step further by automatically pushing the every change that passess the test directly to the production without any human intervention. 

## Task 3: Components of a Pipeline

Below are the commons parts of a pipeline, lets understand each of them and their use: 

- Trigger : These are automatic condition or events that works as a first point of your CI/CD pipeline. There are different types of triggers which starts the jobs:
  - Push: Means whenver a code is pushed to a specific branch immediately start the pipeline
  - Pull Request: Means whenever a PR is created or updated, immediately runs tests, linters or security scans to ensure the code is properly merged.
  - Scheduled Trigger: Means scheduling a job on clock basis like ``cronjob``, ``automatic backups``
  - Manual Trigger: Means a developer has to click "run" in the user interface to start the pipeline.  
- Stage: Though "GitHub Actions" don't officially use stages, but many CI/CD systems do use it. A stage is logical grouping of the actions ( like "Build", "Deploy", "Test" ) and they run sequentially.
- Job: A job is list of steps in a workflow that is executed on the same runner(machine). Now the steps can be either a shell script or an action that will be executed. Generally steps runs in order, but you can also run them conccurrently to get the benefit of parallel execution.
  
```
Job: Build

- Checkout code
- Install Go
- Download dependencies
- Build binary
```

Another job can be: 

```
Job: Test

- Checkout code
- Run unit tests
- Generate report
```

- Step: A single command or an action within the job.
- Runner: the machine which execute the job, it can be "A github-hosted Ubuntu VM, Windows, MacOS"
- Atifact: 

