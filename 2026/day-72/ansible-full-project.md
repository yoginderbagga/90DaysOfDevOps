# Ansible Project to Automate Docker and Nginx server Deployment


### Task 1: Plan the Project Structure 

Created the complete project directory layout from the scratch: 

```
ansible-docker-project/
  ansible.cfg
  inventory.ini
  site.yml                          # Master playbook
  group_vars/
    all.yml                         # Common variables
    web/
      vars.yml                      # Nginx variables
      vault.yml                     # Encrypted Docker Hub credentials
  roles/
    common/                         # Shared setup for all servers
      tasks/main.yml
    docker/                         # Docker installation and container management
      tasks/main.yml
      templates/
        docker-compose.yml.j2
      handlers/main.yml
      defaults/main.yml
    nginx/                          # Nginx reverse proxy
      tasks/main.yml
      templates/
        nginx.conf.j2
        app-proxy.conf.j2
      handlers/main.yml
      defaults/main.yml
```

Ensure to create a project directory ``ansible-docker-project``

```
yoginderbagga@fedora:~/ansible-docker-project$ ansible-galaxy init roles/common
- Role roles/common was created successfully
yoginderbagga@fedora:~/ansible-docker-project$ ansible-galaxy init roles/docker
- Role roles/docker was created successfully
yoginderbagga@fedora:~/ansible-docker-project$ ansible-galaxy init roles/nginx
- Role roles/nginx was created successfully
```

