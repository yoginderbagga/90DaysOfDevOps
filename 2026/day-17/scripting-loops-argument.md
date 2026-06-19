# Shell Scripting Loops, Arguments & Error Handeling

## List of Topics

1. for and while loops
2. command line arugument ( ``$1``, ``$2``, ``$#``, ``$@``)
3. Installing Linux packages with Shell Scripting
4. Adding the error handeling feature

### Task 1:

1. Write a for loop ``simple_for.sh`` to print 5 fruits from the list, print each one.
2. Write a for loop ``simple_count.sh`` to print number 1 to 10 using a for loop

Solution: Added both the for loop scripts in the repository with the file name as ``simple_for.sh`` and ``simple_count.sh``

Learning: In second script, used the range {..} concept to increment, also there was no condition to perform the increment as for loop works differently in bash as comparison to for loop C (which uses condition) and also add the counter ((num--) inside the do - done block not the outside. 

### Task 2:

1. Write a script to take input from the user and decrement it till its 0 using the while loop and print done.

Solution: Added the script ``count_while.sh``

Learning: When comparing a number (numeric comparison) use the -gt or -lt not the < or > symbol in the condition block []

<img width="1027" height="171" alt="image" src="https://github.com/user-attachments/assets/b1662113-7d70-44cd-852b-c3ae4ae88f3b" />


## Task 3: Command Line Arguments

Suppose a script is being executed and you would like to pass an a value that moment. This can be achieved with argument, they also control the behaviour of the script dynamically. 

1. Write a script welcome.sh and accept a name as argument. 


```
yoginderbagga@fedora:~/90-days-devops-Practice/90DaysOfDevOps/2026/day-17$ ./welcome.sh golu
--------Demonstrage Command Line Argument-----
The first argument is : golu
```

In below screenshot, i passed three argument value golu, bholu and kyoko during execution of the script, and they get executed in the output. In script, used ``$#`` to print total number of the argument, ``$1`` to print the first argument, and ``$@`` to print all the arguments passed. 

<img width="1035" height="100" alt="image" src="https://github.com/user-attachments/assets/599f7359-e722-4774-a89b-c91eca3dfc86" />

2. 
