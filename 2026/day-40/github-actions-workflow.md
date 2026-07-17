In today session you will write your first CI CD Pipeline using GitHub actions workflow and understand it how it actually run in the cloud. What happens behind the scene, and how each steps in the pipeline work. 


## Task 1: Setting up Repository 

1. Setup a new public repository called github-action-learning
2. Clone this repository locally to your Laptop or Cloud
3. Create a folder named as ``.github/workflows/``

## Task 2: Create a "Hello World" Workflow

Create a ``.github/workflows/hello.yml`` file which has below workflow: 

1. Which triggers on every ``push``
2. Which has one job called ``Welcome``
3. Runs on ``ubuntu-latest`` platform
4. Which consist of two steps:
   1. Check out the code using ``actions/checkout``
   2. Print ``Hello from the GitHub Actions World"
  
Now you can push the code and visit the **Actions** tab on Github to identify it running. 

## Task 3: Understand what happens inside the Workflow

Observe the workflow file and write on your word what each of the component does: 

- ``on:``
- ``jobs:``
- ``runs-on:``
- ``steps:``
- ``uses:``
- ``run:``
- ``name:``

## Task 4: Continue Adding More Steps 

In existing ``hello.yml`` file, continue to add more steps and modify the workflows.

1. Print the date and time
2. Print the name of the branch that has triggered the run
3. List the files in repository
4. Print the runner's operating system

Now push this again and observe the running pipeline

## Task 5: Destory the Pipeline On Purpose

1. Add a steps which execute a command to **fail** (for example: ``exit 1`` or any thing mispelled)
2. Push the change to this pipeline and observe in Actions tab
3. Fix the pipeline and push again

What did you observe with the failed pipeline? How did you find and read the error message in pipeline? Write in your own words. 


## Task 1:

A public repository with the name ``github-actions-practice`` created and was cloned it successfully. Also, setup a directory ``.github/workflows`` inside the repo.

## Task 2:

Setup a ``hello.yml`` which consist of above instructions to perform, below is the workflow file ``hellp.yml`` code


```
yoginderbagga@fedora:~/github-actions-practice/github-actions-practice/.github/workflows$ cat hello.yml 
name: Hello WorkFlow


# Mention what events trigger the WorkFlow for the Pipeline

on:
  push: 
    branches: ["main"]

jobs:
# Mention the job named as "greet"
  greet:
    runs-on: ubuntu-latest

    steps:
      - name: checkout your repository for any code
        uses: actions/checkout@v4
    
      - name: Print a greeting message
        run: echo "Hello from the GitHub actions!"
```

<img width="1896" height="666" alt="Screenshot 2026-07-18 014201" src="https://github.com/user-attachments/assets/4bba765d-099a-41fd-a894-9b8f10042894" />

The Actions Tab shows the Workflow status as green and the it got executed successfully with only a warning message that's due to "Node 20 is being depreciated as the current workflow is running with Node 24". If you look at the step functions inside the jobs, the first step function which is ``checkout your repository for any code`` has a line with ``uses`` which basically help is getting a repository in this case to run a bundled or sophisticated program or script. The step function is ``print a greeting message`` that run a command to echo "Hello from the GitHub action!`` message. 

## Task 3:

``on:`` This define the event upon which the job gets executed.   
``jobs:`` The jobs in a workflow are set of steps or functions that gets executed sequentially. Like in this case ``greet`` is the only job.  

``runs-on:`` This define the platform where the code runs like ``ubuntu-latest``  

``steps:`` Steps consist of sequential tasks which are individual executable actions, like running a command say ``echo`` to print a message or ``uses`` which pulls code from a repo or use any existing repo code.   

``uses:`` it uses and run a reusable action or any external workflow within your CICD pipeline. Instead of writing a customer shell scripts to perform complext or repetitive task, you can use pre-build blocks of code. 

``run:`` for running a specific command or script.

``name:`` name of the steps
