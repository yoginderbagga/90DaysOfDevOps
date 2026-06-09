# Nginx Webserver Deployment on EC2 Instance and Docker Setup
<br>

In this lab, we will deploy an nginx webserver on Amazon EC2 instance and also install docker package on Ubuntu OS. This guide a quick glimpse of how a cloud server deployment
happens in the DevOps and Cloud Engineering work. 
<br>

## Runbook:
<br>
1. Launch an Ubuntu T3 Tier instance and connect with it using the SSH.( Since I'm using a Oracle VM Fedora, I will connect from there, A VM is not require if you already have Linux as your base machine. )<br>
2. Once the SSH configuration and access is done, install Nginx webserver along with its dependedency packages. <br>
3. To allow the Nginx server access, configure the port 80 on the firewall ( security inbound rule ).<br>
4. Test the webserver connectivity and also captured the logs in a file ``nginx-logs.txt``<br>


## Steps:
<br>
1. Launched an Ubuntu OS EC2 Instance ( t3.micro ) and create a .pem file used for the SSH connectivity. This is needed to connect with the instance from your local machine. In launch page, select the security group IP as "0.0.0.0/0" ( not recommended in production, choose carefully) as once you allow "anywhere " then any host in the world can access the web-server.  <br>
   
Since the .pem private key file is located at my Windows base machine, i first transferred it to Fedora ( Oracle VirtualBox VM) <br>
``PS C:\Users\hp\Downloads> scp .\nginx-webserver-deploy.pem yoginderbagga@192.168.56.101:/home/yoginderbagga
yoginderbagga@192.168.56.101's password:``<br>

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/9e8aa1eb-3dfb-4b33-89a4-142dc383b644" />

<br>

2. Update system with latest packages and install nginx, verify nginx service is running. 

``ubuntu@ip-172-31-20-187:~$ sudo apt update`` <br>
``ubuntu@ip-172-31-20-187:~$ sudo apt upgrade -y`` <br>

<br>
<img width="1920" height="1080" alt="Screenshot (11)" src="https://github.com/user-attachments/assets/7471c4bc-94eb-4661-9e0a-b49834112d0a" />
<br>

``ubuntu@ip-172-31-20-187:~$ systemctl status nginx.service`` 
<br>

3. Configured the secruity group at inbound rules for security group with port 80 to allow the Nginx server to be accessible.<br>

4. Verified the nginx web-server connectivity at the instance IP address ( Public IP ). Tried access it with mobile or any other laptop too with the given public IP address and it should work. <br>

<img width="1920" height="1080" alt="Screenshot (12)" src="https://github.com/user-attachments/assets/4f6c0efb-2347-424e-b011-26fdc7d33521" />
<br>

5. Finally copied the nginx logs ( /var/log/nginx/access.log ) from Ubuntu EC2 to base Fedora OS machine. <br> <br>
``yoginderbagga@fedora:~$ scp -i nginx-webserver-deploy.pem  ubuntu@ec2-54-227-123-229.compute-1.amazonaws.com:/home/ubuntu/nginx-access.txt .``

