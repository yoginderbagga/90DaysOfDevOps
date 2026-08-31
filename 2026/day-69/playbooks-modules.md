# Ansible Playbooks and Modules

### Task 1: Write Your First Playbook

Write a playbook to install and Start the Nginx web servers. 


```
---
- name: Test connectivity to dynamic AWS instance
  hosts: all
  become: true
  tasks: 
    - name: Ensure the connection is successfull and print a message.
      ansible.builtin.debug:
        msg: "Successfully connected to {{ ansible_hostname }} via dynamic inventory!"

    - name: Install nginx package in all three Servers.
      ansible.builtin.apt:
        name: nginx
        state: present
        update_cache: true

    - name: Ensure Nginx Service started during boot
      ansible.builtin.systemd:
        name: nginx
        state: started
        enabled: true

    - name: Remove the mistakenly created index.html file
      ansible.builtin.file:
        path: /usr/share/nginx/index.html
        state: absent

    - name: Remove the default Nginx welcome page
      ansible.builtin.file:
        path: /var/www/html/index.nginx-debian.html
        state: absent 

    - name: Create a Custom index page
      ansible.builtin.copy:
        content: "<h1> Deployed by Ansible </h1>"
        dest: /var/www/html/index.html
        owner: www-data
        group: www-data
        mode: '0644'
```

Read the output of the playbook carefully -- understand each tasks what ``changed`` ``ok`` or ``failed``. When you run the same playbook again, then you will see the output show ``ok`` instead of ``changed`` because as we discussed earlier, Ansible is idempotent, output will not change if not needed or if the package is already present. 

Ran the playbook couple of times, and since adding the new tasks such as "removing the index.html file", "removing the default nginx welcome page" and "create a custom index page" tasks in the existing playbook. So these were the tasks that shows ``changed`` status and the initial tasks shows ``ok``. 

### Task 2: Understand the Playbook Structure

1. Difference between a play and task?

Ans: Play defines where(hosts) and whom the ansible playbook should run, whereas the Task define what specific action to be perform on the managed hosts. In tasks, you don't specify the hosts as they just run as part of the larger context of a play. But you must explicitly define a target host for the Play. 

2. Can you have multiple plays in a single playbook?

Ans: Yes, you can have multiple plays in a single Ansible Playbook which allows you to target different groups of hosts, set execution settings and run the sequential steps across different infrastructure layer. For example, in first play you target the ``database`` server and ``web-servers`` in second play. Here is an example from internet for the use of multiple playbook in a [Single play](https://github.com/yoginderbagga/90DaysOfDevOps/blob/master/2026/day-69/multi-tier-ansible.md)

###   Task 3: Playbook  Essential Modules 

