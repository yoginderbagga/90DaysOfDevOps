# Linux File Ownership ( Users & Groups ) 

In this session, we will understand file and directory ownership for the user and group perspective. 

Difference between User and Group?
<br>
User is a single entitiy or an individual account ( a pserson or a service ) that logs into the system to do the work, whereas a group is a collection of users, groups are used to effectively assigned the permission to large number of users at a time.  


## List of Activities

- Task 1: Review the ownership of the existing files and directory  
        a) Identify the owner and group columns for the given files and directory  
        b) verify the owner  
- Task 2: Perform file owner changing operation  <br>
        a) Create a devops-learning.txt file and verify its current ownership.  
        b) change the owner of the file to Dhurandar using the chown command.  
- Task 3: Perform the file group ownership changing operation  <br>
        a) create a file project-data.txt and review its group permission using ls -l command  
        b) since we already have a group named as devops, assign the project-data.txt file group ownership to the devops  
        c) review the change.   
- Task 4: Use chown to change the file owner and group with same command.    <br>
        a) Single command to change file owner and group owner together with chown command.   
        b) create a new file named as new-candidates.txt  
        c) change the owner to Dhurandar and group to devops in single command itself.   
        d) Now create a directory and change its owner to Tina and group to devops.   
- Task 5: Change the ownership of the entire directory and its sub-directory. <br>
    
    
Task 1:

As you can see majourity of the files and directory are owned by "yoginderbagga" as a user in first column and "yoginderbagga" as a group in second column. By default when a user is created in Linux, the same name group gets created as well. In next step we will change the ownership of the file. 



<img width="1001" height="348" alt="image" src="https://github.com/user-attachments/assets/d4c99d2f-5b8e-4485-840a-7eb421fc8df1" />
<br>
<br>

Task 2:

In below tasks, we created a file named as devops-learning.txt and changed its owner to Dhurandar, which initially gave permission error message. Because I ran it without sudo user, after adding the sudo it worked. And we review the change and confirm the file owner has been changed to Dhurandar while the group owner still showing as "yoginderbagga". Next we changed the owner to "Tina" and review it below. 


<img width="1517" height="335" alt="image" src="https://github.com/user-attachments/assets/209e4eb6-9585-4a14-ba0e-5bea746a200e" />

<br>
  



