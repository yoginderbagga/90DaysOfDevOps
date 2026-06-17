# Shell Scripting for Linux

Shell scripting is kind of programming language which allows you to write a list of commands in a script like format so you don't have to type individual command each time for a task. The scripts written in shell scripting are executed by the command-line interpreter not the compiler; the main purpose of scripting is to automate the tasks instead of manually typing the commands. 

For example, you would like to take a backup of a directory to a location, you can use the tar command and do that. But doing this for multiple server and each time will be time consuming. Instead you can write a script which run on daily basis at a particular time to create the backup, and also you may clean the old files that are not needed. 



Task 1: Create your first ``hello-devops.sh``shell script and run it. 

- write about each line that you understood from the script.
- how did you executed it?

Task 2: Create another script ``variable-data.sh`` with variables in it.

- Add a variable to store your Name.
- Add a variable to store your Role.
- Run the script with single quote vs double quote and identify the difference.

Task 3: Create another script ``user-input.sh`` to take user input with read

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



## Task 1:

Script ``hello-devops.sh`` is created and below is the results of the script when executing it. 

<img width="1107" height="122" alt="Screenshot 2026-06-17 184919" src="https://github.com/user-attachments/assets/99e1fa40-d73e-4f51-86a3-fa01a9254e1c" />


## Task 2:

Script ``variable-data`` is created and below is the result when executing the script. You can see the difference with single quote (``) the variable value was not expended as the single quote treat each string data as literally as string only. Whereas if you use the double quote ("") in the script that will treat each variable as the variable itself i.e it will expand the variable and display its values. 

<img width="1583" height="208" alt="Screenshot 2026-06-17 190929" src="https://github.com/user-attachments/assets/54ba5b0b-1b5e-4338-90e3-4e2cc3438196" />


## Task 3: 

Script ``user-input.sh`` shows how to take the input with the ``read`` statement that stores the value of input into a variable. Also, used the (-p)
to keep the message and input into a single line. 

<img width="1612" height="188" alt="Screenshot 2026-06-17 192816" src="https://github.com/user-attachments/assets/8fab86ec-4a3f-4bf0-9fd4-49a2b3508f7a" />

## Task 4: 

Script ``if-else_user-input.sh`` is created and below is the result when executing the script. 

<img width="1667" height="253" alt="Screenshot 2026-06-17 194618" src="https://github.com/user-attachments/assets/0eea37d6-4466-44ff-b0e5-d6ad989c4818" />

