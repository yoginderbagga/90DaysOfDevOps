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


### Task 3: Ansible Facts -- To Get System Information. 

Ansible facts are the automatically gathered pieces of information about the managed host that are used to make automatic dynamic and adaptable. Instead of hardcoded values, use the system data info so playbook adapt to different operating systems, memory sizes or IP addresses. 

```
yoginderbagga@fedora:~/ansible-practice$ cat facts.yml 
---
- name: Facts Demo
  hosts: all
  tasks: 
    - name: Show the OS info
      ansible.builtin.debug:
        msg: >
          Hostname: {{ ansible_hostname }},
          OS: {{ ansible_distribution }} {{ ansible_distribution_version }},
          RAM: {{ ansible_memtotal_mb }}MB,
          IP: {{ ansible_default_ipv4.address }}

    - name: Show all network interfaces
      ansible.builtin.debug:
        var: ansible_interfaces
```

## Task 4: Conditionals with when

``when`` is used to control the flow of execution in Ansible playbook, similar to if-else in bash scripts. 


```
yoginderbagga@fedora:~/ansible-practice$ cat conditional.yml 
---
- name: Demonstrate Conditions in Ansible
  hosts: all
  become: true

  tasks:
    - name: Install the Nginx Server on web-servers only
      ansible.builtin.apt:
        name: nginx
        state: present
      when: tags.Role == 'web'

    - name: Install MySQL (only on db servers)
      ansible.builtin.apt:
        name: mysql-server
        state: present
      when: tags.Role == 'db'

    - name: Run only on Ubuntu
      ansible.builtin.debug:
        msg: " This is an Ubuntu Machine"
      when: ansible_distribution == "Ubuntu"

    - name: Run when Web Server enough memory
      ansible.builtin.debug:
        msg: "Web Server has enough memory"
      when: ansible_memtotal_mb >= 512
```

### Task 5: Ansible Loops

```
yoginderbagga@fedora:~/ansible-practice$ cat loop.yml 
---
- name: Ansible Loop
  hosts: all
  become: true
  
  vars:
    # List of users that needs to be created.
    system_users:
      - bob
      - alice
      - jacob

  tasks:
    - name: Create the Local user account
      ansible.builtin.user:
        name: "{{ item }}"
        state: present
        shell: /bin/bash
```
