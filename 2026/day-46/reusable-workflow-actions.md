# Reusable Workflow in GitHub Actions

What exactly is Re-usable Workflow in GitHub actions pipeline?

As the name suggests its pre-build YAML workflow file which can be called and executed by the other workflows. So you don't have to copy the complex CI/CD pipeline code across several files and repositories. 

## Task 1:

1. what is``workflow_call`` trigger
2. Difference between regular action like ``uses`` and a reusable workflow ``workflow_call``?
3. Where to keep ``reusable workflow`` file?


**workflow_call** is a trigger which is used to make any existing workflow into a reusable one and to configure it as you use : ``on:workflow_call`` trigger.



### Difference between regular action ``uses`` and reusable workflow

A reusable workflow is used for reusing an entire workflow/job for the purpose of doing many operations like :building, testing, pushing the docker image and deploying. Reusable workflow can be triggered using the ``workflow_call`` trigger. 
**uses** is used inside an action to reuse a single task for performing an operation. For example, checkout code, login to Docker Hub, Setup Python. Like yesterday you used the ``checkout code`` inside the action to get the code to the runner machine where you need to build the project. 

### Where to keep reusable workflow file?  

A reusable workflow file lives at ``.github/workflows``

## Task 2:


## Task 3:


## Task 4:
