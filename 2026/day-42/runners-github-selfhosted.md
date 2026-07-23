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

Below is the matrix build strategy which runs a job across three different Operating System with the node.js version installation, and run the code, also display the operating system version, image for all the operating system that is being used on the runner machine. 

```
yoginderbagga@fedora:~/github-actions-matrix-strategy.md$ cat .github/workflows/matrix.yml 
# Goal: Create a job to run on multiple OS ( Ubuntu and Windows Github runner) environment

name: Cross Operating System Matrix Demonstration

# first define the trigger section like push, pull request, schedule etc
on:
  push:
    branches: [ "main" ]
  workflow_dispatch:

    
# second define the jobs you want to run
jobs:
  test-application:
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [ubuntu-latest, windows-latest, macos-latest]

    steps:
      - name: Checkout the code
        uses: actions/checkout@v4

# NEW STEP: Prints the active OS version and image version

      - name: Display Runner OS Version Details
        shell: bash
        run: |
          echo "======================================================"
          echo "Matrix OS Label: ${{ matrix.os }}"
          echo "Operating System Image: $ImageOS"
          echo "Exact Image Build Version: $ImageVersion"
          echo "======================================================" 

      - name: Setup a Node.js 
        uses: actions/setup-node@v4
        with:
          node-version: '20'


      - name: Install and Run the app  
        run: |
          npm install
          npm test

```
```
yoginderbagga@fedora:~/github-actions-matrix-strategy.md$ ls
package.json  README.md  test
yoginderbagga@fedora:~/github-actions-matrix-strategy.md$ cat package.json 
{
  "name": "matrix-test-app",
  "version": "1.0.0",
  "description": "Simple app to test GitHub Actions matrix",
  "main": "index.js",
  "scripts": {
    "test": "echo '✅ All tests passed successfully on this OS!'"
  },
  "dependencies": {}
}
```

### Matrix Build Output : [ubuntu-os, window-os, mac-os]

<img width="1890" height="875" alt="image" src="https://github.com/user-attachments/assets/84bcc94b-b37a-455d-bdb6-940f31e7e5bb" />





# Learning & Observation 

1. For Task 1, initially the pipeline didn't run as the package.json file was not included and it was needed in order to execute any node.js based application. This file reside in project root directory, hence i created on and put it there. 
