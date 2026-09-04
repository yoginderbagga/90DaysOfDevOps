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
```

### Ansible Galaxy:

## Task 1: Jinja2 Templates

Below is an example of Jinja2 template applied on the playbook ``jinja-demo.yml`` playbook with the template file ``server-info.txt.j2``. Here we have three EC2 instances same name as before, same dynamic inventory as previous session, now each time user take an SSH to EC2 it prints its server name i.e ``role``, ``Public IP Address``, ``Private IP Address``, ``Operating System`` information based on the each instance configuration. 

Playbook code:

```
---
- name: Demonstraing Jinja2 template with 3 EC2 Instance
  hosts: all
  become: yes
  
  tasks:

    - name: Set variable for each Server
      ansible.builtin.set_fact:
        server_name: "{{ inventory_hostname }}"
        server_role: >-
          {% if 'role_web' in group_names %}
          WEB SERVER
          {% elif 'role_app' in group_names %}
          APPLICATION SERVER
          {% elif 'role_db' in group_names %}
          DATABASE SERVER
          {% else %}
          UNKNOWN SERVER
          {% endif %}
    - name: Create server information file
      ansible.builtin.template:
        src: server-info.txt.j2
        dest: /etc/motd
        mode: '0644'
  ```

  Template code:

  ```
  yoginderbagga@fedora:~/ansible-practice$ cat server-info.txt.j2 
Server Name: {{ server_name }}
Server Role: {{ server_role }}
Hostname: {{ ansible_hostname }}
Private IP : {{ ansible_default_ipv4.address }}
Operating System: {{ ansible_distribution }}
Managed by: Ansible
```

Here playbooks is defining what needs to be done like setting the facts such as hostname, role etc and then create a template which gets send to the /etc/motd location with the given permission. And template file define the logic how it retrieve the information such as above from the system and pass it to the playbook to display. 

<img width="795" height="840" alt="image" src="https://github.com/user-attachments/assets/003d304f-a4e6-413e-bdf5-2b0f56827ff4" />

<img width="976" height="667" alt="image" src="https://github.com/user-attachments/assets/4f17ef61-d752-497e-b033-d71e034c282e" />
