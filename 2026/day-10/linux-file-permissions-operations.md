# Linux FiLinux File Permission and Modify Permissions

In this session, we will cover Linux file permissions, how to assign permission to the files, read the permission and modify the existing permission to a given file / directory.  

## List of Activities

Task 1: Create file and use the ls -l ( long listing ) to read the permission.    
Task 2: Read the permission of file like /etc/passwd and read its first 5 lines of content  
Task 3: Read the permission of file like /etc/group and read its first 5 lines of content  
Task 4: Spend 10 minutes to understand who can read, write and execute these files  
Task 5: Modify the existing file permission  
        a) make ``my_script.sh`` executable       
        b) set the file permission ``my_file.txt`` to read only and remove the write permission  
        c) set the third ``data.txt`` file 640  
Task 6: Evaluate file permission  
        a) Try to write on a read only and verify what happens?  
        b) Try to execute a file which is not having execute permission  
        c) Read and note the error carefully  



## Solutions: 

Task 1: 

Created files and added the text in it.  

<img width="1292" height="317" alt="image" src="https://github.com/user-attachments/assets/f6a0b964-c2b9-4bee-adf1-347b78a1a00a" />  

Try execute the script.sh without adding chmod +x permission ( i.e execute permission ) as seen its giving permission denied error message.   


<img width="1103" height="142" alt="Screenshot 2026-06-14 212733" src="https://github.com/user-attachments/assets/70409e43-0c3b-4044-9e80-13ea05495825" />
<br> <br>
Task 2:  

Use the head command to print top 4 lines of the /etc/passwd file. 

<img width="1192" height="115" alt="image" src="https://github.com/user-attachments/assets/6fdf32dc-24b1-4dbc-87e7-72b5500a070f" />

Use the tail command to print bottom 4 lines of the /etc/group file.

<img width="1277" height="117" alt="Screenshot 2026-06-14 213214" src="https://github.com/user-attachments/assets/ea0a4345-e0dc-49e7-8dec-4e00d8ec2927" />

<br> <br>
Task 3:

Print the permission of all the three files created in this session and review them, as you can see script.sh has not yet added the execute permission because we will do in next step. 

<img width="1361" height="96" alt="Screenshot 2026-06-14 213530" src="https://github.com/user-attachments/assets/9fe13364-a753-4168-9851-f293d2126c4f" />

As you can see, read and write permission are set for "User" but for the "Group" and "Other" -> Only the "Read" Permission got added.  


Task 4:

Modify the permission of script to make it executable so that owner can run the script. As currently this is only a text file with read + write permission and not the execute. 

Also, remove the read only permission from the devops.txt and make 640 for the my_notes.txt file


<img width="1157" height="90" alt="Screenshot 2026-06-14 214004" src="https://github.com/user-attachments/assets/1af63a70-cfc4-4ad5-8f25-f05714f75e6d" />

To remove the execute permission (use x) and remove it using the chmod command. 

``yoginderbagga@fedora:~/TWS_Practice$ chmod ugo-x my_notes.txt ``

<br>
<img width="1231" height="120" alt="image" src="https://github.com/user-attachments/assets/bed8ee72-f126-4421-9878-a1246ec81a72" />

The directory which was created got assigned with the 755 permission only

``drwxr-xr-x. 1 yoginderbagga yoginderbagga       62 Jun 14 21:20  TWS_Practice``


Task 5:

Try execute the script file without the +x permission and see the error message that is coming as it doesn't have the permission. 

<img width="1176" height="43" alt="Screenshot 2026-06-14 214833" src="https://github.com/user-attachments/assets/86e16261-b25b-4cba-8f73-36fad2e1029b" />

Try to write on a text file notes.txt and devops.txt wherein the file shows its read only, but strangely it allowed me to write though it doesn't happen normally. 
