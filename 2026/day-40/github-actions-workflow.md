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




