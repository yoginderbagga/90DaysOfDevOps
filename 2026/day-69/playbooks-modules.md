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



### Task 2: Understand the Playbook Structure


###   Task 3: Playbook  Essential Modules 

