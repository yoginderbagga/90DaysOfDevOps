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

1. Setup the Config file ``my_hosts.aws_ec2.yml`` (This file must ends with ``aws_ec2.yml`` as that's the plugin name)

   ```
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

   In this demo, I had created three separate EC2 instances which all had different ``.pem`` files so its important to     declare all files path in the config file itself. Wondering why we used ``keyed_groups`` above? This will automatically group EC2 instances inside the Ansible depending on the tags defined at AWS Instances ( like ``web``, ``app``, ``db``)
