# GitHub Actions: Secrets, Artifacts and Tests in CI

In today's session you will how to store the sensitive information securely, storing the build outputs, and running the tests of the pipeline. Secrets variable are created from the GitHub Actions settings and they can store sensitive info about organization, the repository, environment and can be read by the workflow if you declare it in the variable. 

## Task 1: Managing GitHub Secrets 

Managing the GitHub secrets is an important task of your Continuous Integration as you safely store the sensitive information like : ``api keys``, ``tokens``, ``password`` in GitHub configuration. 

1. in the repo, go to -> Settings -> Secrets and Variables -> Actions and create a secret ``BIG_SECRET_INFO``
2. create a workflow which will read it and print a message ``Your secret is set:true``
3. Now print the secret message ``${{ secrets.BIG_SECRET_INFO }}`` directly -- and observe what output you get.

Write in your notes, what do you understand and why you should never print secrets in CI logs?

As I created the above workflow, i noticed that the secret ``BIG_SECRET_INFO`` value which I had stored inside the settings was not printed or added inside the logs. It only prints ``*****`` in place of the secret value inside the log. Also the secret is limited to the particular virtual machine for that specific ``build`` job and the VM is removed as the workflow completes its work.

**Note**: Go to repo multi-job-actions [1] to see the full workflow code. 
[1] multi-job-actions [https://github.com/yoginderbagga/multi-job-github-actions] 
