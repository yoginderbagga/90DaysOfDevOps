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

## Task 2: Ansible Role Structure 

To generate an Ansible role, run below command : 

``ansible-galaxy role init my_role``


```
roles/
  webserver/
    tasks/
      main.yml                               # main task list
    handlers/
      main.yml                              # Handlers (Task for restarting the service etc)
    templates/
      nginx.conf.j2 or server-info.txt.j2    # Jinja2 templates
    files/
      index.html                            # Static files
    vars/
      main.yml                              # Role variables (high priority variable)
    defaults/
      main.yml                              # Default variable (low priority variable)
    meta/
      main.yml                              # Role metadata
```
  
## Task 3: Build a Role From Scratch


Role exercise is completed as per the given tasks and here is the output below : 

<img width="1091" height="847" alt="image" src="https://github.com/user-attachments/assets/58c1187a-1dae-48e4-84f2-f9605fafddd5" />

```
yoginderbagga@fedora:~/packet/webserver/templates$ cat index.html.j2 
<h1>{{ app_name }}</h1>
<p>Server: {{ ansible_hostname }}</p>
<p>IP: {{ ansible_default_ipv4.address }}</p>
<p>Environment: {{ app_env | default('development') }}</p>
<p>Managed by Ansible</p>
```

```
yoginderbagga@fedora:~/packet/webserver/templates$ cat nginx.conf.j2 
user www-data;
worker_processes auto;

error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

events {
    worker_connections {{ max_connections }};
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    access_log /var/log/nginx/access.log;

    sendfile on;
    keepalive_timeout 65;

    include /etc/nginx/conf.d/*.conf;
}
```

```
yoginderbagga@fedora:~/packet/webserver/templates$ cat vhost.conf.j2 
server {
    listen {{ http_port }};
    listen [::]:{{ http_port }};

    server_name _;

    root /var/www/{{ app_name }};
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```
