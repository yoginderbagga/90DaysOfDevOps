#### Nginx Webserver Deployment on EC2 Instance and Docker Setup
<br>

In this lab, we will deploy an nginx webserver on Amazon EC2 instance and also install docker package on Ubuntu OS. This guide a quick glimpse of how a cloud server deployment
happens in the DevOps and Cloud Engineering work. 
<br>

Steps:
<br>
1. Launch an Ubuntu T3 Tier instance and connect with it using the SSH.( Since I'm using a Oracle VM Fedora, I will connect from there, A VM is not require if you already have Linux as your base machine. )<br>
2. Once the SSH configuration and access is done, install Nginx webserver along with its dependedency packages. <br>
3. To allow the Nginx server access, configure the port 80 on the firewall ( security inbound rule ).<br>
4. Test the webserver connectivity and also captured the logs in a file ``nginx-logs.txt``<br>
