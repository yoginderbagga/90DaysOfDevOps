# Ansible Roles, Galaxy, Templates and Vault

As your Ansible project grows larger and broader, managing all the tasks, variables, handlers, and other files -- into a single YAML file gets
difficult to manager. In production environment, organization doesn't only a single file to manage all these instead create the roles
for -- servers, databases, monitoring agents, load balancers etc. This helps you to organize and reuse, share the automation. 

- Ansible Roles: 
- Jinja2 Templates: 
- Ansible Galaxy:
- Ansible Vault:

### Ansible Roles:

Ansible Roles lets you break a large and complex playbooks into smaller, manageable, reusable pieces of files. 
They are self-contained packages of the tasks, variables, files, handlers organized into a standard directory. 

### Jinja2 Templates:

In Ansible, Jinja2 servers as the core templating engine used to introduce dynamic behavior, data manipulation, inserting the logic, like conditional parameters using if/else inside the templates. 

```
{{ ....}}

{% ... %}

### Ansible Galaxy:


