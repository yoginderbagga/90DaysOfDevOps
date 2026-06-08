# Linux Server Troubleshooting 
<br>
In this session, you will diagnose issue with Linux server with the SSH issue. Create a short, to the point runbook with the steps you would follow when a server fails to SSH. During the session, you can capture the error messages, logs,
screenshots at a throwaway folder so you remember where the files are located. 
<br>

## Guidlines <br>
1. Define the problem statement in short summary but include the medium level information in the detailed section. Provide error message that the user is facing, was it working before. Add the environment details ( OS details )
2. As you progress towards the troubleshooting, record each relevant information as you simulate the issue, including the error screenshots, login ID, logs.
3. A solid foundational knowledge is helpful in resolving complex issues rather than blindly jumping from one step to the other.
4. Because this runbook is a playground for your learning purpose, define each step of what you are doing and why you're doing and how you're doing. 
<br>

#### Problem <br>
An IT Engineer is unable to SSH to a EC server using his key based authentication due to the below error message, he could access it fine previously. 
<br>

#### Environment <br>
Operating System: Ubuntu (uname -a) <br>
IP Address : 10.X.X.X <br>
User info : 
<br>

#### Prerequisite Knowledge About: <br>

1. ~/.ssh/authorized_keys: It is a local configuration file at the server side which stores the public key information. One line at a time. <br>
2. /etc/ssh/sshd_config file: It is a system wide configuration file for the SSH server. <br>
3. /var/log/auth.log or /var/log/secure: Logging file to store the system wide logs of your Linux machine. <br>
4. ssh-keygen: A command to create the SSH-keys.<br>
5. ~/.ssh/id_rsa.pub OR ~/.ssh/id_ed25519.pub : Public Keys ( Stays at server location, where user is trying to reach ) <br>
6. ~/.ssh/id_ed25519 : Private Keys ( Stays at client location, where user is currently stay)<br>

#### Troubleshooting Steps <br>

1. First issue that occured during the SSH from Virtual Machine ( Fedora ) to Amazone EC2 Instance was below error message :<br>

<img width="1427" height="285" alt="SSH_Runbook" src="https://github.com/user-attachments/assets/db99b7c9-a99e-4ca6-ae77-53d15205aa49" />
<br>

This shows the private key file (.pem) is too open for anybody to use it or can cause issue in future if not changed the permission. Hence modify its permission to 0644 with below command. Since it showed 644 permission which is read for the group and others as well. Now after changing its only read for the user and zero 
for group and other. <br>

<img width="1045" height="176" alt="image" src="https://github.com/user-attachments/assets/800fd954-875e-4e09-ac16-662b0104ac49" />









