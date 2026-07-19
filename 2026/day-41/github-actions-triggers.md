In this session you will learn various methods to trigger a workflow in GitHub action and also running jobs in different environment at the same time. 

# Triggers & Matrix builds

## Task 1 : Triggers on a Pull Request

1. Create a ``.github/workflows/pr-check.yml``
2. Whenever a pull request is opened or updated on main branch trigger it. 
3. Add a step that prints: ``PR check running for branch: <branch name>``
4. Now create a new branch, push a commit, and opened a PR
5. Oberserve the workflow run automatically.

Verify: Does it show up on the PR page? 

## Task 2: Scheduled Trigger 

1. Add a ``schedule:`` trigger to any workflow using cron syntax
2. Set it to run every day at midnight UTC
3. Write in your words, what is the cron command for every Monday at 9 AM?

## Task 3: Manual Trigger

1. Create a ``.github/workflows/manual.yml`` with a ``workflow_dispatch:`` trigger
2. Add an input that asks for an ``environment`` name (staging/production)
3. Print the input value in a step
4. Go to Action Tab --> Run workflow

## Task 4: Matrix Builds

Create ``.github/workflows/matrix.yml`` that : 

1. Uses a matrix strategy to run the same job across:
   1. Python version: ``3.10``, ``3.11``, ``3.12``
2. Each job installs Python and prints the version
3. Watch all 3 run in parallel

## Task 5: Exclude & Fail-Fast

1. In your matrix, exclude one specific combinations (e.g. Python 3.10 on Windows)
2. Set ``fail-fast: false`` -- trigger a failure in one job and what happens to the rest
3. Write in your notes; What exactly is ``fail-fast: true`` (the default) do vs ``false``? 
