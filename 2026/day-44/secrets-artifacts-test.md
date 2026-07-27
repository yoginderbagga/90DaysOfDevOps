# GitHub Actions: Secrets, Artifacts and Tests in CI

In today's session you will how to store the sensitive information securely, storing the build outputs, and running the tests of the pipeline. Secrets variable are created from the GitHub Actions settings and they can store sensitive info about organization, the repository, environment and can be read by the workflow if you declare it in the variable. 

How secrets gets injected under the hood?

As you push the code, Git starts a VM to run the workflow and GitHub read your workflow file and locate the expression :$ {{ secrets.DOCKER_PASSWORD }} or whichever you had put and decrypt the password into plain text and injects it into the memory of the the running virtual machine and later on it clean up the plaintext from the memory permanently. 

## Task 1: Managing GitHub Secrets 

Managing the GitHub secrets is an important task of your Continuous Integration as you safely store the sensitive information like : ``api keys``, ``tokens``, ``password`` in GitHub configuration. 

1. in the repo, go to -> Settings -> Secrets and Variables -> Actions and create a secret ``BIG_SECRET_INFO``
2. create a workflow which will read it and print a message ``Your secret is set:true``
3. Now print the secret message ``${{ secrets.BIG_SECRET_INFO }}`` directly -- and observe what output you get.

Write in your notes, what do you understand and why you should never print secrets in CI logs?

As I created the above workflow, i noticed that the secret ``BIG_SECRET_INFO`` value which I had stored inside the settings was not printed or added inside the logs. It only prints ``*****`` in place of the secret value inside the log. Also the secret is limited to the particular virtual machine for that specific ``build`` job and the VM is removed as the workflow completes its work.

**Note**: Go to repo multi-job-actions [1] to see the full workflow code. 
[1] multi-job-actions [https://github.com/yoginderbagga/multi-job-github-actions] 

## Task 2: Using the Secrets as the Environment Variable

1. Use the Secret Variable info at the Env Variable time.
2. Do not hardcode it and instead use it at shell command.
3. Add the ``DOCKER_USERNAME`` and ``DOCKER_TOKEN`` as the secrets
