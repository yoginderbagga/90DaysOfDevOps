In this session you will learn various methods to trigger a workflow in GitHub action and also running jobs in different environment at the same time. 

# Triggers & Matrix builds

## Task 1 : Triggers on a Pull Request

1. Create a ``.github/workflows/pr-check.yml``
2. Whenever a pull request is opened or updated on main branch trigger it. 
3. Add a step that prints: ``PR check running for branch: <branch name>``
4. Now create a new branch, push a commit, and opened a PR
5. Oberserve the workflow run automatically.
