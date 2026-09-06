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

Ensure to create a project directory ``ansible-docker-project`` and create three specific roles for ``common``, ``docker``, and ``nginx``

```
yoginderbagga@fedora:~/ansible-docker-project$ ansible-galaxy init roles/common
- Role roles/common was created successfully
yoginderbagga@fedora:~/ansible-docker-project$ ansible-galaxy init roles/docker
- Role roles/docker was created successfully
yoginderbagga@fedora:~/ansible-docker-project$ ansible-galaxy init roles/nginx
- Role roles/nginx was created successfully
```

### Task 2: Create the Common Roles 

Purpose of this role is to provide base packages and setup your system for the docker and nginx deployment. 

``roles/common/tasks/main.yml``

```
---
- name: Update package cache
  yum:
    update_cache: true
  tags: common

- name: Install common packages
  yum:
    name: "{{ common_packages }}"
    state: present
  tags: common

- name: Set hostname
  hostname:
    name: "{{ inventory_hostname }}"
  tags: common

- name: Set timezone
  timezone:
    name: "{{ timezone }}"
  tags: common

- name: Create deploy user
  user:
    name: deploy
    groups: wheel
    shell: /bin/bash
    state: present
  tags: common
```

Now add all the variable specific to ``common`` roles inside the ``group_vars/all.yml`` file. 

```
---
timezone: Asia/Kolkata
project_name: devops-app
app_env: development
common_packages:
  - vim
  - curl
  - wget
  - git
  - htop
  - tree
  - jq
  - unzip
```

## Task 3: Create the Docker Role 

Purpose of this role is to install the Docker package, start the docker service and pull images and run the containers. 

``roles/docker/defaults/main.yml``:

```
---
docker_app_image: nginx
docker_app_tag: latest
docker_app_name: myapp
docker_app_port: 8080
docker_container_port: 80
```

Note: I followed the steps from this step till the end as per documentation(read me) including the encrypt Docker hub credential with Vault and building the master playbook to deploy it. 

Ran the playbook and it did executed on few tasks but some tasks were skipped for example : ``Install Docker and run container`` and ``Configure Nginx reverse proxy`` and rest were executed as per below screenshot. 

Completed tasks : ``Update System Package Cache``, ``Set Hostname`` , ``Set timezone``  ``Create a Deploy user`` . This needs to be investigated in the future when i resume this, for now we can call it a day!

