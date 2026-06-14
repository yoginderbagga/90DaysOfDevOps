# Linux File Ownership ( Users & Groups ) 

In this session, we will understand file and directory ownership for the user and group perspective. 

Difference between User and Group?
<br>
User is a single entitiy or an individual account ( a pserson or a service ) that logs into the system to do the work, whereas a group is a collection of users, groups are used to effectively assigned the permission to large number of users at a time.  


## List of Activities

- Task 1: Review the ownership of the existing files and directory  
        a) Identify the owner and group columns for the given files and directory  
        b) verify the owner  
- Task 2: Perform file owner changing operation with chown command  <br>
        a) Create a devops-learning.txt file and verify its current ownership.  
        b) change the owner of the file to Dhurandar using the chown command.  
- Task 3: Perform the file group ownership changing operation with chgrp command <br>
        a) create a file project-data.txt and review its group permission using ls -l command  
        b) since we already have a group named as devops, assign the project-data.txt file group ownership to the devops  
        c) review the change.   
- Task 4: Use chown to change the file owner and group with same command.    <br>
        a) Single command to change file owner and group owner together with chown command.   
        b) create a new file named as new-candidates.txt  
        c) change the owner to Dhurandar and group to devops in single command itself.   
        d) Now create a directory and change its owner to Tina and group to devops.   
- Task 5: Change the ownership of the entire directory and its sub-directory. <br>
        a) create a new directory called deployment-env/test  
        b) create another directory called deployment-env/prod  
        c) create a file called predata.txt in /test  
        d) create a file called postdata.txt /prod  
        e) create a group called executors  
        f) changed the ownership of entire directory deployment-env  
                  - Owner:  
                  - Group:  
                  - User recursive flag ( -R)  
        g) verify the permission of all the files and sub-directories.   
    
    
Task 1:

As you can see majourity of the files and directory are owned by "yoginderbagga" as a user in first column and "yoginderbagga" as a group in second column. By default when a user is created in Linux, the same name group gets created as well. In next step we will change the ownership of the file. 



<img width="1001" height="348" alt="image" src="https://github.com/user-attachments/assets/d4c99d2f-5b8e-4485-840a-7eb421fc8df1" />
<br>
<br>

Task 2:

In below tasks, we created a file named as devops-learning.txt and changed its owner to Dhurandar, which initially gave permission error message. Because I ran it without sudo user, after adding the sudo it worked. And we review the change and confirm the file owner has been changed to Dhurandar while the group owner still showing as "yoginderbagga". Next we changed the owner to "Tina" and review it below. 


<img width="1517" height="335" alt="image" src="https://github.com/user-attachments/assets/209e4eb6-9585-4a14-ba0e-5bea746a200e" />

<br>
<br> 

Task 3:

In below tasks, we create a new file named as project-data.txt and changed its group ownership (not the user ownership), once its done then created a new directory 

<img width="1715" height="307" alt="image" src="https://github.com/user-attachments/assets/ea424f32-8b73-4ca1-a032-a6e28ac7f89a" />

As you can see, the group "yoginderbagga" has changed to devops, with running the above step. 
<br>
<br>

Task 4:

In below tasks, we create a new file named as new-candidates.txt and with a single command changed its owner to dhurandar and group owner as well to "production"
<br>

``sudo chown owner:group filename``

<img width="1245" height="210" alt="image" src="https://github.com/user-attachments/assets/09a8e9b7-cf1e-4452-a866-4c320f88923a" />

The owner and group owner has been changed from "yoginderbagga" to Dhurandar and production and then we confirmed it using the ls -l command. Also, again we ran the chown command changed the owner from Dhurandar to Tina, and group production to devops. 


