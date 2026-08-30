## Dynamic Inventory in Ansible

Before diving into the topic, lets understand a scenario first : Your organization have 20 EC2 Instances linux server to manage the workload. Each EC2 instance has a specific public IP address you get from AWS Management Console and use it. 
When you build an inventory file you define these hosts or servers IP address manually by statically adding them into the text file ``inventory.ini`` most commonly used/simple. And other one is ``YAML Format``. When your infrastructure scale you or spin up new servers or terminate an existing server, stop a cloud instance then AWS assigned a new ``Public IP Address`` to the instances. Manually updating those IP address for hundreds of servers is time consuming and also error prone. 

To resolve this problem, Ansible Dynamic inventory are used in the organization. A dynamic inventory helps you automatically assigns the IP address to the managed hosts in real time. Instead of manually writing the IP address to the file, dynamic inventory looks for the external sources such as Cloud (AWS,Azure,GCP), virtualization platforms(VMware, VirtualBox), or LDAP. 

Lets take a look at demo project ``ansible-practice`` which consist of: 


| File | Description |
| --- | --- |
| ansible.cfg | To configure global settings, default behaviours, and env path for Ansible |
| my_hosts.**aws_ec2.yml** | Dedicated configuration file, and define Ansible plugin inside this. |
| setup.yml  | Playbook file  |


### How to configure Dynamic Inventory for your Infrastrucutre?

