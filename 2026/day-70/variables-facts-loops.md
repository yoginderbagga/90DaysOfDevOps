# What are Variables, Facts, Conditionals and Loops in Ansible?

The playbook you created works fine with same types of packages, configuration and same behavior on every server. However, in real infrastructure things are different, in order to make the playbook flexible as per the number of servers, playbooks, grows, you need to use the variables, facts, conditionals and loops to make it more smooth and flexible from rigid static information. 

### Task 1: Using Variable in Playbook

A variable is a storage location in memory which holds the data which can be modified during the execution. In variable you can store the environment, configuration, and other data info and then use it throughout the playbook which makes it reusable. 

``vars`` keyword is used to declare a variable inside the playbook.  You can define a ``vars:`` block and inside that add multiple variable store info such as ``http_port:80`` and ``app_name: "ecommerce"; once declared then those variable can be accessed in the tasks.

