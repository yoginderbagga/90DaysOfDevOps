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

## Task 2: Build a Reusable Workflow

Create a reusable workflow file ``.github/workflows/reusable-build.yml``

1. Use the trigger ``workflow_call``
2. Add an ``inputs`` section with:
   - ``application_name``
   - ``environment``
3. Create a ``secrets:`` section for the ``docker_token``
4. Create a job which:
   - Check out the repository
   - Print a message ``Building <application_name> for <environment>
   - Print ``Docker token is set: true``

Build a simple re-usable workflow here [1] as you can see there are two files ``reusable-linter.yml`` and ``main-ci.yml`` are created. The trigger is done from th``main-ci.yml`` file and ``reusable-linter.yml`` work as a reusable template and when it gets called, it setup an ubuntu virtual computer, install the requested version of Node.js and runs a fake code-checking (linting) command. 

[1] https://github.com/yoginderbagga/reusable-workflow-github

## Task 3: Create a Caller Workflow

Create another in same directory ``.github/workflows/call-build.yml``

1. Trigger on push to main
2. Add a job that uses your reusable workflow:
```
jobs:
  build:
    uses: ./.github/workflows/reusable-build.yml
    with:
      app_name: "my-web-app"
      environment: "production"
    secrets:
      docker_token: ${{ secrets.DOCKER_TOKEN }}
```
3. Push to main and watch it run


## Task 3:


## Task 4:
