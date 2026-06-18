# Knowledge Reinforcement Log (From day 1-11)

### 5 Commands That Saved Most of Time 

- Identify high consumption proces : ps aux, top 
- Identify which ports are listening : ss - tulpn
- Identify the service status : systemct status
- Display available disk space in human readable format : df -h
- Change the permission : chmod
- Output redirection command ( ">") : df -h > output-disk-space.txt


### Check If Service Is Healthy - List 3 Commands to Test

- Use the systemct status
- Use the journalctl -u <service-name>

### Safely Change Ownership and Permission - List a Command

- Use the chmod command and chown
- Use the chgrp command
- Use the selinux ( semanage command ) 

### Focus and Improvement Area For Upcoming Days

- Using Curl command


### Task 1:

high CPU consumption command

```
yoginderbagga@fedora:~$ ps -aux --sort=-%cpu | head -n 4
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
yoginde+    5198 1566  0.0 235112  5352 pts/0    R+   21:21   0:00 ps -aux --sort=-%cpu
yoginde+    3225 45.1  2.1 1984060 130976 ?      Sl   20:22  26:15 /opt/docker-desktop/bin/com.docker.backend services
yoginde+    2513  1.4  6.9 5364380 413640 ?      Ssl  20:22   0:50 /usr/bin/gnome-shell
yoginderbagga@fedora:~$
```

find the port used by which process 

```
yoginderbagga@fedora:~$ ss -tulpn | grep 22
tcp   LISTEN 0      128          0.0.0.0:22         0.0.0.0:*          
tcp   LISTEN 0      128             [::]:22            [::]:*
```
find out the total disk usage available and how much it has used in a particular file system 

```
yoginderbagga@fedora:~$ df -h /home/yoginderbagga/Downloads/
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda3        29G   12G   17G  40% /home
yoginderbagga@fedora:~$ df -h /root/
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda3        29G   12G   17G  40% /
yoginderbagga@fedora:~$ df -h /tmp
Filesystem      Size  Used Avail Use% Mounted on
tmpfs           2.9G   36K  2.9G   1% /tmp
yoginderbagga@fedora:~$ df -h /mnt/
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda3        29G   12G   17G  40% /
yoginderbagga@fedora:~$ df -h /run/user
Filesystem      Size  Used Avail Use% Mounted on
tmpfs           1.2G  1.6M  1.2G   1% /run
```
Using chmod command to change the permission of a file. 

<img width="1522" height="173" alt="Screenshot 2026-06-18 212945" src="https://github.com/user-attachments/assets/b72b4647-136a-4bef-92c2-9c8014b43934" />


### Task 2:

Use journalct command with -u to print logs for a particular server and add the tail argument to display last 4 lines of the logs.




```
yoginderbagga@fedora:/90-days-devops-Practice/90DaysOfDevOps/2026/day-12$ journalctl -u nginx.service | tail -n 4 
Jun 18 19:49:06 fedora systemd[1]: Starting nginx.service - The nginx HTTP and reverse proxy server... 
Jun 18 19:49:07 fedora nginx[1067]: nginx: the configuration file /etc/nginx/nginx.conf syntax is ok 
Jun 18 19:49:07 fedora nginx[1067]: nginx: configuration file /etc/nginx/nginx.conf test is successful 
Jun 18 19:49:08 fedora systemd[1]: Started nginx.service - The nginx HTTP and reverse proxy server. 
yoginderbagga@fedora:/90-days-devops-Practice/90DaysOfDevOps/2026/day-12$
```

### Task 3:

Use chown command to change the group ownership for the given file. One thing to note, do add a (:) as prefix before the group name that you would like to add for a particular file or the directory. 

``sudo chown :stage demo_file.txt``

After chown, first you add a column and group name right after that who will be given access, proceeded with the filename. 

```
yoginderbagga@fedora:~$ sudo chown :production test_permission.txt 
yoginderbagga@fedora:~$ ls -l test_permission.txt 
--w-r--r--. 1 yoginderbagga production 58 Jun 18 21:29 test_permission.txt
```

Use of the CURL command : 

yoginderbagga@fedora:~$ curl -o my_website.html https://www.w3school.com
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  228k  100  228k    0     0  94951      0  0:00:02  0:00:02 --:--:-- 94969


### Task 4:

Use CURL command to test the API connectivity or backend service. For the API testing purpose with the CURL I created below flask app ( using GPT) to create a local server and then tested the CURL from the terminal to see the POST sends the data and retrieve it fine
to my terminal. 


<img width="1237" height="122" alt="image" src="https://github.com/user-attachments/assets/b0e6d76d-8769-440f-82d4-5a6f51c36736" />


<img width="1082" height="253" alt="Screenshot 2026-06-19 045705" src="https://github.com/user-attachments/assets/19208ff7-8716-4867-afa9-13ef928f1c32" />


run on terminal as ``yoginderbagga@fedora:~$ python flasktest.py``
```
from flask import Flask, request

app = Flask(__name__)

@app.route("/")
def home():
    return "Flask is working!"

@app.route("/post", methods=["POST"])
def post():
    return {
        "received": request.form.to_dict()
    }

app.run(host="0.0.0.0", port=5000)
```
