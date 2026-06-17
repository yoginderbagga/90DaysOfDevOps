# Shell Scripting for Linux

Shell scripting is kind of programming language which allows you to write a list of commands in a script like format so you don't have to type individual command each time for a task. The scripts written in shell scripting are executed by the command-line interpreter not the compiler; the main purpose of scripting is to automate the tasks instead of manually typing the commands. 

For example, you would like to take a backup of a directory to a location, you can use the tar command and do that. But doing this for multiple server and each time will be time consuming. Instead you can write a script which run on daily basis at a particular time to create the backup, and also you may clean the old files that are not needed. 



Task 1: Create your first ``hello-devops.sh``shell script and run it. 

- write about each line that you understood from the script.
- how did you executed it?

Task 2: Create another script with variables in it.

- Add a variable to store your Name.
- Add a variable to store your Role.
- Run the script with single quote vs double quote and identify the difference.

Task 3: Take user input with read

- Create another script and take user input with read statement
- print the input value.

Task 4: Utilizing If-else condition

- Create a script to take a number as input using read 
- use if-else to check if a number is positive, negative, or zero

Task 5: Integrate them all 

These scripts are all individual script which does a single task in isolation but they're not a fully fledge production level script or not even a script that shows what is being automated, or no service is specified. 

So create another script ``server_testing.sh`` which does below activitiy:

1. Capture the service name into a variable (like nginx, sshd)
2. Take input from user : "Do you want to test the service status? (y/n)"
3. If answer is ``y`` -- runs the ``systemctl status <service>``; and print whether service is active status or not.
4. If answer is ``n`` -- print "skipping"



Task 1:

Script ``hello-devops.sh`` is created and below is the results of the script when executing it. 

<img width="1107" height="122" alt="Screenshot 2026-06-17 184919" src="https://github.com/user-attachments/assets/99e1fa40-d73e-4f51-86a3-fa01a9254e1c" />


Task 2:

