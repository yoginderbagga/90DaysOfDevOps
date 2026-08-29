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


