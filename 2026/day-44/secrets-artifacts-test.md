# GitHub Actions: Secrets, Artifacts and Tests in CI

In today's session you will how to store the sensitive information securely, storing the build outputs, and running the tests of the pipeline. 

## Task 1: Managing GitHub Secrets 

Managing the GitHub secrets is an important task of your Continuous Integration as you safely store the sensitive information like : ``api keys``, ``tokens``, ``password`` in GitHub configuration. 

1. in the repo, go to -> Settings -> Secrets and Variables -> Actions and create a secret ``BIG_SECRET_INFO``
2. create a workflow which will read it and print a message ``Your secret is set:true``
3. Now print the secret message ``${{ secrets.BIG_SECRET_INFO }}`` directly -- and observe what output you get.

Write in your notes, what do you understand and why you should never print secrets in CI logs?
