In this session, you will learn about runners i.e executable engine or machine where the GitHub Action workflow runs, this is where the scripts runs, installing dependencies, and code gets deployed. Two types of runners are available **GitHub-Hosted** which is managed completely by GitHub and **self-hosted** runner (hosted on your own OS or cloud infrastructure)


### GitHub-Hosted Runners

These are virtual machines (Ubuntu, Windows or macOS) which are created on demand for running the workflow and execute the jobs. They comes with pre-installed tools and available for Ubuntu,Windows or Mac OS. Each runner creates a separate GitHub-hosted runner virtual machine with the runner application and tools pre-installed.

```
jobs:
  runs-on: ubuntu-latest
```

### Self-Hosted Runner

Self-Hosted Runners provide you more control over the operating system, tools you install as they're located on your own environment of choice like AWS Cloud, your Linux OS or any on-premise infrastructure. 

```
jobs:
  runs-on: self-hosted
```

# Task 1: Setup a GitHub-Hosted Runner 

1. Create a GitHub Actions Pipeline with 3 jobs that are running on different OS:
   - ``ubuntu-latest``
   - ``windows-latest``
   - ``macos-latest``
  
2. Each of the job does below :
   - print OS
   - runner's hostname
   - current user running the job

3. Observe all thr three jobs running in parallel and write in your words about what you understood? Who is managing these jobs?
