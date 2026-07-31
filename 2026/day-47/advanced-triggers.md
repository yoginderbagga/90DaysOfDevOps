## Types of Triggers : PR Events, Cron Schedules and Event- Driven Pipelines

There are different types of triggers exists in GitHub actions which starts your Pipeline to run like ``workflow triggers``. 

1. **Repository Events**: they are triggers which actively listen for any change inside your GitHub repository.
   - ``push``
   - ``pull request``
   - ``issues``
   - ``release``
2. **Manual Triggers**: they are triggers which you use to manually control a pipeline to make it execute accordingly to clicking like add a clickable button "**Run workflow**" inside the GitHub Actions UI like ``workflow_dispatch``
   **repository_dispatch** : this is a triggers workflow via a REST API call from an external or any separate application. 
   
