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
<br>
After changing permission SSH worked successfully. 

2. Second issue, removed the SSH key from the .ssh directory ( /root/.ssh ) as a sudo user and then exit from the SSH connection. Tried connecting again which worked fine,  this was bit surprising as i had already removed the public key from the authorized_keys file. So I removed the public key from the "authorized_keys" file inside the .ssh folder at home directory instead of as the root user.. Now after restarting the SSH service access didn't worked. Therefore, added the public key back inside the /home/ubuntu/.ssh/authorized_keys file which then fixed the issue.
<br>
Always, ensure the public present at the server location where you're trying to take the SSH only then it would work.
<br>

3. Third issue, deleted the inbound firewall rule for SSH port 22 in AWS. As SSH works on port 22 by default, what would happened if you delete the SSH inbound rule from the AWS? To test this, i deleted the rule and then verified the SSH connectivity which didn't work. So added the inbound port 22 back to firewall
   this fixed the problem. <br>

``yoginderbagga@fedora:~$ ssh -i "testing-ssh.pem" ubuntu@ec2-1.2.3.4.compute-1.amazonaws.com
ssh: connect to host ec2-1.2.3.4.compute-1.amazonaws.com port 22: Connection refused``<br>

<img width="1735" height="741" alt="InboundRule" src="https://github.com/user-attachments/assets/a95c22c6-64d7-4d81-9908-bb48fa18d292" />
<br>

4. Fourth issue, this didn't directly stopped the SSH access or cause troubles with your SSH connectivity but slowed down the CPU resources. Created below shell script and run it in the background (using &) ; once your run below script this will take highest CPU resource and increase the uptime value. Now, create another script to repeat below code 10 times using for loop. 

Part A)
```
ubuntu@ip-1.2.3.4:~/shell_script$ cat repeat_cpu_hog.sh 
#!/bin/bash

while true
do 
	:
done 
```
<br>
Part B)

```
ubuntu@ip-1.2.3.4:~/shell_script$ cat repeat_cpu_hog.sh 
#!/bin/bash

for repeat in {1..10}
do 
	./CPU_hog.sh &
done
ubuntu@ip-1.2.3.4:~/shell_script$ 
```

<img width="1025" height="92" alt="Screenshot 2026-06-08 233016" src="https://github.com/user-attachments/assets/08fd9a38-43bb-48bb-a161-acbd2eaacdf1" />

<br>
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/b475ed3f-6f2f-42f0-8594-da2d9b33dcff" /><br>
Since these scripts are for the testing purpose only, you can kill them using kill -9 command and then verify the results of the CPU consumption and load should be decreased. <br><br>

``kill -9 6759 7442 7443``<br>
<br>
<img width="1920" height="1080" alt="Screenshot (8)" src="https://github.com/user-attachments/assets/c77a35b8-7a91-48c4-a021-84ad6196acdb" />




