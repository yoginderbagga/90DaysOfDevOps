###  Multi-Tier Application Update using Ansible( Multiple Plays) 


##### An example I took from Gemini to understand the concept of using Multiple Plays in a Single Playbook. Only once the execution of ``PLAY 1: Database Migration`` it will then proceed to ``PLAY 2: Application Upgrade`` to perform the upgradation of application and eventually the ``PLAY 3: Load Balancer Reload``
---
# PLAY 1: Database Migration
- name: Run Database Migrations
  hosts: db-servers
  become: true
  gather_facts: false
  tasks:
    - name: Ensure database backup is taken
      amazon.aws.rds_instance_snapshot: # Example local action/cloud task
        db_instance_identifier: prod-db
        db_snapshot_identifier: pre-deploy-snapshot
      delegate_to: localhost

    - name: Run Schema Migration Scripts
      ansible.builtin.command: /opt/app/bin/migrate-db.sh
      changed_when: true

# PLAY 2: Application Upgrade
- name: Deploy New Application Version
  hosts: app-servers
  serial: 1 # Rolling update: updates one app server at a time to prevent downtime
  become: true
  tasks:
    - name: Pull Latest Docker Image
      community.docker.docker_image:
        name: myapp/api:latest
        source: pull

    - name: Restart Application Container
      community.docker.docker_container:
        name: api-service
        image: myapp/api:latest
        state: started
        restart: true

# PLAY 3: Load Balancer Reload
- name: Refresh Load Balancer Traffic
  hosts: load-balancers
  become: true
  tasks:
    - name: Run Health Checks against App Servers
      ansible.builtin.uri:
        url: "http://{{ item }}/health"
        status_code: 200
      loop: "{{ groups['app-servers'] }}"

    - name: Reload Nginx to Clear Cache and Register Targets
      ansible.builtin.service:
        name: nginx
        state: reloaded
