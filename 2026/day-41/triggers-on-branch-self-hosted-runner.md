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

