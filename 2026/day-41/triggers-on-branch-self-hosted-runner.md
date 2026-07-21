## Trigger on Pull Request and Self-Hosted Runner

In this task, you will see how a CI CD Pipeline update the code automatically to the live application with the help of GitHub Action Workflow and the changes happened only when a PR ( Merge Request ) is updated. That means if you update, directly to the main branch and push it to the repository then GitHub Workflow will not pick the change. Since inside the workflow file ``deploy.yml`` you have added syntax as below : 

```
on:
  push:
    branches: 
      - feature
```

We are using the existing repository [1] for this project. It already has a workflow file created inside ``.github/workflows/deploy.yml``; we only need to make the above changes to make it go run while PR request gets created. There were few challenges and observation from this learning which are listed at the end. 

[1] https://github.com/yoginderbagga/My-First-CD-Project

Below is ``deploy.yml:``

```
name: Simple-Deployment-Pipeline

# Trigger this whenever we push to the 'main' branch
on:
  push:
    branches: 
      - feature

jobs:
  build-and-deploy:
    # This tells GitHub to run the commands on YOUR EC2 (the self-hosted runner)
    runs-on: self-hosted

    steps:
      # Step 1: Pull the latest code from this GitHub Repo
      - name: Checkout Code
        uses: actions/checkout@v4

      # Step 2: Build the Docker Image
      - name: Build Docker Image
        run: docker build -t simple-app-image .

      # Step 3: Clean up old versions so port 80 is free
      - name: Stop and Remove Old Container
        run: |
          docker stop simple-app-container || true
          docker rm simple-app-container || true

      # Step 4: Start the new container
      - name: Run New Container
        run: docker run -d -p 80:80 --name simple-app-container simple-app-image
```

The ``feature`` branch was not created initially so I added it for this test, and pushed the feature to the repository. Below are the steps to create the ``feature`` branch and next screenshot I made a change to the ``index.js`` file and pushed them to the ``feature`` branch``. 

** Note I had used the self-hosted runner for this example, but this can be done in Ubuntu-Latest runner too. A self-hosted runner machine is something that you manage, maintain from your GitHub Actions workflow. Unlike GitHub-hosted runner which are ephermal virtual machine provided by the GitHub. A self-hosted runner depends completely on your operating system, cloud or any on-premise server of your choice **


```
ubuntu@ip-172-31-23-96:~/My-First-CD-Project$ git checkout -b feature
Switched to a new branch 'feature'
ubuntu@ip-172-31-23-96:~/My-First-CD-Project$ git branch 
* feature
  main
ubuntu@ip-172-31-23-96:~/My-First-CD-Project$ git push -u origin feature 
Total 0 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
remote: 
remote: Create a pull request for 'feature' on GitHub by visiting:
remote:      https://github.com/yoginderbagga/My-First-CD-Project/pull/new/feature
remote: 
To github.com:yoginderbagga/My-First-CD-Project.git
 * [new branch]      feature -> feature
branch 'feature' set up to track 'origin/feature'.
```

<img width="1552" height="642" alt="image" src="https://github.com/user-attachments/assets/1b95d837-f604-484a-9715-aa8cd7220444" />


## Learning & Observations

1. Initially I had pushed the feature branch changes to the ``main`` branch mistakenly, since its a seprate branch the changes should come from the ``feature`` only and once its pushed to that. Later is your decision whether you would like to merge it to the main branch or not. Ofcourse, you do merge it when you test the feature branch changes are successfully working. 
