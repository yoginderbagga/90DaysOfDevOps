### Multiple- Play inside a Single Playbook

Below is an example of Multiple-Plays in a Playbook which target two different EC2 Instance as per the group created ``role_web``
and ``role_app``

```
yoginderbagga@fedora:~/ansible-practice$ cat ansible_modules.yml 
---
#Goal: To Practice Commonly used Ansible Modules

- name: Hands-on with Ansible Common Modules
  hosts: role_web
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


- name: Second Play with Tasks 
  hosts: role_app
  become: true
  tasks:
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
```

Also, here is the inventory file which uses the AWS plugin to implement dynamic inventory : 

```
yoginderbagga@fedora:~/ansible-practice$ cat my_hosts.aws_ec2.yml 
plugin: amazon.aws.aws_ec2

regions:
  - us-east-1

hostnames:
  - ip-address

keyed_groups:
  - key: tags.Role
    prefix: role

compose:
  ansible_user: "'ubuntu'"
  ansible_ssh_private_key_file: >-
    '/home/yoginderbagga/web-server-ansible.pem'
    if tags.Role == 'web'
    else '/home/yoginderbagga/app-server-ansible.pem'
    if tags.Role == 'app'
    else '/home/yoginderbagga/db-server-ansible.pem'
    if tags.Role == 'db'
    else '/home/yoginderbagga/web-server-ansible.pem'
```

 ansible.cfg

 ```
yoginderbagga@fedora:~/ansible-practice$ cat ansible.cfg 
[defaults]
inventory =  my_hosts.aws_ec2.yml
host_key_checking = False
remote_user = ubuntu
private_key_file = /home/yoginderbagga/web-server-ansible.pem

[inventory]
enable_plugins = amazon.aws.aws_ec2
```
