# Ansible Fundamentals and Inventory Setup

## Task 1: What is Ansible Automation?

1. What is configuration management and why do we need it?
2. How is Ansible different from Chef, Puppet and Salt?
3. What is "angentless" in Ansible? How Ansible connect with the managed nodes?
4. Draw a diagram on Ansible Architecture which include:
   - Control Node:
   - Managed Node:
   - Inventory:
   - Modules:
   - Playbooks:

## Task 2: Configure Ansible Setup

Launch three EC2 instance manually from AWS Console: 

   - Instance 1: web-server-ansible
   - Instance 2: app-server-ansible
   - Instance 3: db-server-ansible

These three instance will work as your "managed node" where you're going to push the infrastructure changes, packages etc. And if you like you can spin up another instance to make it work as the "control node" or the "desktop machine" as the control node. In this exercise I will be using Fedora VM(Oracle VirtualBox) as my control node machine to put automation changes to the managed node (EC2 instances)


## Task 3: Install Ansible

Since Ansible is Agentless, there is no need to install Ansible package on the managed node i.e EC2 instance. Run below command to install and check version : 

```
sudo yum install ansible -y

yoginderbagga@fedora:~/ansible-practice$ ansible --version
ansible [core 2.18.18rc1]
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/home/yoginderbagga/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.14/site-packages/ansible
  ansible collection location = /home/yoginderbagga/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible
  python version = 3.14.5 (main, May 11 2026, 00:00:00) [GCC 15.2.1 20260123 (Red Hat 15.2.1-7)] (/usr/bin/python3)
  jinja version = 3.1.6
  libyaml = True
yoginderbagga@fedora:~/ansible-practice$
```

## Task 4: Create Inventory File
