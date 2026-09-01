# What are Variables, Facts, Conditionals and Loops in Ansible?

The playbook you created works fine with same types of packages, configuration and same behavior on every server. However, in real infrastructure things are different, in order to make the playbook flexible as per the number of servers, playbooks, grows, you need to use the variables, facts, conditionals and loops to make it more smooth and flexible from rigid static information. 

### Task 1: Using Variable in Playbook

A variable is a storage location in memory which holds the data which can be modified during the execution. In variable you can store the environment, configuration, and other data info and then use it throughout the playbook which makes it reusable. 

``vars`` keyword is used to declare a variable inside the playbook.  You can define a ``vars:`` block and inside that add multiple variable store info such as ``http_port:80`` and ``app_name: "ecommerce"; once declared then those variable can be accessed in the tasks.

```
yoginderbagga@fedora:~/ansible-practice$ cat ansible_vars.yml 
---
#Goal: To demonstrate the Ansible Variable and its use.

- name: Using Variable in Ansible
  hosts: all
  become: true

  vars: 
    app_name: ecommerce
    app_db: mydb
    app_port: 8080
    app_dir: "/opt/{{ app_name }}"
    app_dir2: "/opt/{{ app_db }}"
    packages:
      - git
      - curl
      - wget

  tasks: 
    - name: Print the Application Details
      ansible.builtin.debug:
        msg: "Deploying {{ app_name }} on port {{ app_port }} to {{ app_dir }}"

    - name: Create a Directory for Application
      ansible.builtin.file:
        path: "{{ app_dir }}"
        state: directory
        mode: '0755'

    - name: Install require packages
      ansible.builtin.apt:
        name: "{{ packages }}"
        state: present

    - name: Create Second Directory for DB
      ansible.builtin.file:
        path: "{{ app_dir2 }}"
        state: directory
        mode: '0755'
```

### Task 2: group_vars and host_vars

Its always preferable to keep the variable outside of the main playbooks file to keep the code clean, readable and scalable. There are two types of variable you can use in this case: 

- ``group_vars/``: List of variables that applies to a complete group of machines defined in inventory.
- ``host_vars/``: List of variables that target to a single, specific host. 


