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

3. What is the use of ``become: true`` at play and task level?

Ans: Using ``become:true`` at play-level applies the privilege escalation (like using ``sudo``) to run at each tasks given in the specific play. This saves your time by providing ``become:true`` at every tasks level. Whereas if you apply ``become:true`` at the task level then it grants the sudo permission only at that particular tasks where its mentioned. Now this is clear example of least privilege principle as you're ensuring that sudo permission is given only at specific task and not the whole play.

4. What happens if a task fails -- does the rest of the tasks still run?

Ans: Interesting question, where we will explore ``ignore_errors: true`` and ``block/rescue`` mode. Before that, lets understand that if a particular task fails on a given host say "database" then Ansible immediately stop the execution of remaining tasks for that particular host. But the playbook will not stop the execution of tasks on global level, meaning that - if there are other hosts for that playbook Ansible will continue executing them for the other tasks where they succeeded. 

- How to Continue Next Tasks Regardless of the Failure?
  If you like a specific task to fail but want the same host to keep moving forward with rest of the playbooks then use ``ignore_errors: true``

- ``block/rescude`` mode ( similar to Try/Catch logic)
  List your tasks inside the ``block`` level and suppose if the ``block`` fails then Ansible stop those tasks execution and jump straight to the ``rescue`` section. And if the ``rescue`` tasks succeed, playbook reverts the failed status and continue running rest of the play. 
  

###   Task 3: Playbook  Essential Modules 

Most frequently used Ansible modules are: 

- ``yum`` / ``apt`` : To install or remove packages:
- ``service`` : To manage the service of the application package
- ``copy``: Copy the files from control node to the managed nodes.
- ``file``: To create the directories and manage permissions.
- ``command``: To run a command say ``df -h`` but no shell features.
- ``shell``: Run a command with Shell features like ( pipes, redirects):
- ``lineinfile``: To add or modify a specific line in file


Verified below playbook across all three EC2 instances and its working fine, file ``control.txt`` was copied fine to the destination directory ``/etc/nginx/conf.d`` from the source (ansible_practice)
```
#Goal: To Practice Commonly used Ansible Modules

- name: Hands-on with Ansible Common Modules
  hosts: all
  become: true
  tasks:
    - name: Install Git & CURL package
      ansible.builtin.apt:
        name: 
          - curl
          - git
        state: present

    - name: Verify if Nginx is running
      ansible.builtin.service:
        name: nginx
        state: started
        enabled: true

    - name: Copy the Config file
      ansible.builtin.copy:
        src: control.txt
        dest: /etc/nginx/conf.d/control.txt
        owner: root
        group: root
        mode: '0644'

    - name: Create application directory
      ansible.builtin.file:
        path: /opt/myapp_yogi
        state: directory
        owner: ubuntu
        mode: '0755'

    - name: Check the uptime 
      ansible.builtin.command: uptime
      register: uptime_output

    - name: Print the uptime
      ansible.builtin.debug:
        var: uptime_output.stdout

    - name: Count the Running processess
      ansible.builtin.shell: ps aux | wc -l
      register: process_count

    - name: Show process count
      ansible.builtin.debug: 
        msg: "Total processess: {{ process_count.stdout }}"

    - name: Set timezone in Environment
      ansible.builtin.lineinfile: 
        path: /etc/resolv.conf
        line: 'nameserver 8.8.8.8'
        state: present
```

### Task 4: Use Handlers to Restart a Service when Needed.

Suppose you need to restart a service or do any task but only when its actually notified by another task which reports a change in system state/environment. There you can use handler to achieve this functionality. ``Handlers`` keyword is used in the playbook to define action (restart a service) that needs to be done upon a change of configuration files or state. 
A keyword ``notify`` is used to call the handler by its name only when the tasks results in a changed status. 


```
---
#Goal: To Practice Commonly used Ansible Modules

- name: Hands-on with Ansible Common Modules
  hosts: all
  become: true
  tasks:
    - name: Install Git & CURL package
      ansible.builtin.apt:
        name: 
          - curl
          - git
        state: present

    - name: Verify if Nginx is running
      ansible.builtin.service:
        name: nginx
        state: started
        enabled: true

    - name: Copy the Config file
      ansible.builtin.copy:
        src: control.txt
        dest: /etc/nginx/conf.d/control.txt
        owner: root
        group: root
        mode: '0644'

    - name: Create application directory
      ansible.builtin.file:
        path: /opt/myapp_yogi
        state: directory
        owner: ubuntu
        mode: '0755'

    - name: Check the uptime 
      ansible.builtin.command: uptime
      register: uptime_output

    - name: Print the uptime
      ansible.builtin.debug:
        var: uptime_output.stdout

    - name: Count the Running processess
      ansible.builtin.shell: ps aux | wc -l
      register: process_count

    - name: Show process count
      ansible.builtin.debug: 
        msg: "Total processess: {{ process_count.stdout }}"

    - name: Set timezone in Environment
      ansible.builtin.lineinfile: 
        path: /etc/resolv.conf
        line: 'nameserver 8.8.8.8'
        state: present

    - name: Add DevOps Duties
      ansible.builtin.lineinfile:
        path: /etc/nginx/conf.d/control.txt
        line: "DevOps are Deploying Websites and Databases to AWS"
        state: present
        create: yes
      notify: restart nginx
  
  handlers:
    - name: restart nginx
      ansible.builtin.service:
        name: nginx
        state: restarted
```

### Task 5: Dry Run, check Diff and Verbosity for the error

1. Dry run -- This flags help you to execute a playbook or ad hoc command without actually making any modification to the managed systems. A good practice to verify the what changes will happen when you run it normally.
2. Diff mode -- Shows a line by line comparison of changes of before and after applying the changes to the managed hosts. It works similar to the linux ``diff`` too
3. Verbosity -- increase the output detail for the debugging purpose.
4. Limit: -- limit to specific host
5. List -- List the hosts that would be affected without actually running.

```
ansible-playbook install-nginx.yml --list-hosts
ansible-playbook install-nginx.yml --list-tasks
```

### Task 6: Multiple Plays in Single Playbook

Already discussed it in starting of the document and given a path to the mutiple-plays playbook as well. 

