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
