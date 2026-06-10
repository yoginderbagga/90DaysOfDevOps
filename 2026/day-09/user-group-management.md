# User and Group Management 
<br>

#### 1. Create user account in Linux and verify their record exists
<br>

- Raju
- John
- Tina

Verify at: /etc/passwd and /home directory 

#### 2. Create Groups 

- programmers
- devops

verify at: /etc/group 

#### 3. Assign users their secondary group

- Raju -> programmers
- John -> programmers + devops
- Tina -> devops

verify at: /etc/group or id "user" command to check if their group is properly assigned.

#### 4. Create a share directory for the users and set appropriate permission

1. Create a directory named: /opt/client-project
2. Set group owner to the programmers
3. Set the permission to 775 (rwxrwxr-x)
4. Create the test files as the user Raju, John and Tina

verify at: file permission to see which permission they got.

#### 5. Now setup a Team collaboartion group 

1. Create a user Hermione along with the home directory
2. Setup a group team-collab
3. Add the user Hermione and Raju to team-collab
4. Create /opt/team-project directory
5. Assign the appropriate permission to team-collab group as 775
6. Create a file by the user Hermione and verify the permission.

# Solution


1. User create

<br>

```
yoginderbagga@fedora:~$ sudo useradd Raju
[sudo] password for yoginderbagga: 
yoginderbagga@fedora:~$ sudo useradd John 
yoginderbagga@fedora:~$ sudo useradd Tina
```

Verification user creation at location /etc/passwd:
<br>

``yoginderbagga@fedora:~$ cat /etc/passwd``


2. Setup groups


```
yoginderbagga@fedora:~$ sudo groupadd programmers
yoginderbagga@fedora:~$ sudo groupadd devops
```

verify group creation at location /etc/group
``yoginderbagga@fedora:~$ cat /etc/group``


3. Assign users to their secondary group. 











# Observation / Challenges 

























