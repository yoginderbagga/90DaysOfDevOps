# Git Fundamentals and Commands 

### Runbook:  
- What is Git and where it is used?
- What features Git provides?
- Setup Git on your laptop and Perform below challenges
- Git Workflow "The 3 Stage workflow of Git including working directory, staging area and local repository"

### Git:

Before diving into the Git definition, lets take an example, suppose you created a web-development project for your work and kept in your laptop or shared with your colleagues. Due to some reason, the laptop gets corrupted and you don't have any backup
over the cloud what would you in this scenario? Anyone would be panic in this scenario, because noone wants to loose a hardworking project all of the sudden without any backup options. 

Lets take another example, your team is working on movie streaming product (BetterMovies) which source is there on the cloud as well ( say AWS ) but all the teamembers are working separately, now suppose John make changes to a particular file
index.html, Tina will not come to know what changes was done unless John shares the same file with Tina over the email, share drive or cloud. Also, if two members are working on single product features ( could be design, backend, or database )
they both have the documentation and steps for each of their work. But still they might face issue with knowing which change is for Peter and Nick. 

Now image, having a centralize system which keeps your code to a central repository (GitHub, GitLab, Bitbucket) wherein the whole team can work on the BetterMovies project, they all will have their dedicated responsibility and a place to track
which person is making which changes in the code. As Git keep track of each changes you make to the code in the repository with an identification or comment. This is called version control system which make sure to track every single changes 
a user does to the project. If at anytime user want to go back to previous version he/she can do that. 

"Technical Definition: Git is a "distributed" version control system software which help in tracking and managing the changes in code over the time. It allows multiple developers to work on the same project, view the previous
version, restore the changes of the code whenever needed. "


### Git Features:

1. Distributed Version Control System: Every teammember working on a project possess a full local clone of the project history. In comparision to CVS (Centralize Version Control) which stores the all version of the files exclusively on a central server. There is no possibility of single point of failure as every local machine contains the clone which is entire project history. 
2. Commits: As mentioned in previous definition, each commits made by a user gets save in the Git history are called commits. User can track each of those commits and revert back to any of the change per the requirement. 
3. Branch: Brach is the safest place in your repository where you can develope a new code fature, experiment, fix bugs or do the changes without altering the main or production-ready codebase. Some examples of Git Branches are :
   
      a) create a branch new_design, and keep building a new feature here without directly affecting the main branch<br>
      b) EMERGENCY TESTING! There is major error in the project wherein an image from TradeOnline main page throwing an error and this needs to be resolved ASAP. You can create a separate branch                from the master branch, make changes and then apply the changes to the production without affecting the other branches. 
   <br>
      c) Once you successfully test the changes or created a new feature then you can merge (join) with the main branch.<br>

4. Merge: As you complete the changes in your testing branch, you can then merge it with main branch. Means the changes will be now live with rest of the project as well. 
5. Cloning: You make a copy of the entire project from a remote central location like a website or server to your own server ( Laptop )
6. Collaboration: Git allows you to collaborate between your team to work on a similar project at the same time without affecting other members code. 


### Setup Git:

#### Task 1: Git Installation and Configuration

One of the first thing to do is to verify if Git software is installed on your laptop or not. If not then install it before proceeding with any further steps. <br>
```
yoginderbagga@fedora:~$ git --version
git version 2.54.0
```

#### Identity Setup

Next is to let Git know about your identitiy with your Full Name and Email Address on your local environment. This must match with the name and email id of your Git Hub account. You may update these information in futrue if you need to, but its important step to do whenever your Git in a new environment or server(Laptop)

```
yoginderbagga@fedora:~$ git config --global user.name "Yoginder Bagga"
yoginderbagga@fedora:~$ git config --global user.email "yoginder.bagga@gmail.com"
```

```
yoginderbagga@fedora:~$ git config --global --list
user.name=Yoginder Bagga
user.email=yoginder.bagga@gmail.com
```

#### Task 2: Build your first Git Project


1. Create a project directory ``devops-git-practice`` to build this as your Git project.
2. Initiatlize the directory as Git repository: To setup a completely new, empty Git repository where you will do the all work. This also create a .git hidden folder inside your project directory. 
3. Carefully read and understand Git status
4. See the Git folder to find the .git/ directory


``yoginderbagga@fedora:~$ mkdir devops-git-practice``


<img width="836" height="443" alt="Screenshot 2026-06-11 153623" src="https://github.com/user-attachments/assets/390e19cb-a888-4843-a9b0-5f6566144ae0" />

<img width="738" height="105" alt="Screenshot 2026-06-11 154225" src="https://github.com/user-attachments/assets/f9531232-d6b8-42dd-916e-96c48504899d" />


#### Task 3: Create a Git Commands Referrence 

1. Create a git-command.md file inside devops-git-practice repo and list down the commands you practiced so far.
2. Add a short description about the command you tried.

Created a file name git-command.md and added the commands used on previous steps along with the 1 line definition. 


#### Task 4: Added the file to the staging area and commit the change to Git.


``yoginderbagga@fedora:~/devops-git-practice$ git add .``

<img width="1017" height="83" alt="Screenshot 2026-06-11 161546" src="https://github.com/user-attachments/assets/5165448a-0092-48c1-a89a-21427ed39723" />

As you can see in previous command, added the file "git-commands.md" to the staging area (a place where git files are added before committing them permanently to the git); then i commited the file using git commit -m command to make the changes permanently in the git directory. 

In below screenshot, i created two more files source_code.txt and index.html, i added both the files to staging area first and then commited the source_code.txt to git. But I didn't commit index.html to the commit and kept it there in the staging area. Now use below commands to see the status:

``git status``  
``git log``


<img width="992" height="161" alt="Screenshot 2026-06-11 162447" src="https://github.com/user-attachments/assets/4eaff6bf-cdd2-4b07-be90-e467f05e02b6" />


Below screenshot shows that first commit done at "Date:   Thu Jun 11 16:02:57 2026 +0530" for the file git-command.md and second commit done at "Date:   Thu Jun 11 16:12:30 2026 +0530" for the file source_code.txt" both were done by me. Now you notice that third file "index.html" doesn't in the git log history because it was never commited. 


<img width="1035" height="266" alt="Screenshot 2026-06-11 162549" src="https://github.com/user-attachments/assets/c7b70b77-6654-450e-971f-078298634a85" />



#### Task 5: Experiment with the existing files and modify them. Verify their history. 

Made changes to the file git-commands and added to the staging area. 

<img width="796" height="171" alt="Screenshot 2026-06-11 180813" src="https://github.com/user-attachments/assets/6f10f333-9b08-485d-990a-6ade9591d056" />

```
yoginderbagga@fedora:~/devops-git-practice$ git log
commit caa8a2022d447d7caecc2009ef2a890457ff6fc2 (HEAD -> master)
Author: Yoginder Bagga <yoginder.bagga@gmail.com>
Date:   Thu Jun 11 17:57:42 2026 +0530

    Added another heading for the file index.html

commit ccaa7c15e99c74d731fb033e22a5dd916fbeaa65
Author: Yoginder Bagga <yoginder.bagga@gmail.com>
Date:   Thu Jun 11 17:45:00 2026 +0530

    modified the file with new commands

commit 25fab0809c73bf5706596806e26c3775c3cbf4d0
Author: Yoginder Bagga <yoginder.bagga@gmail.com>
Date:   Thu Jun 11 16:12:30 2026 +0530

    Adding the source_code.txt file permanently to the Git directory.

commit 7697a8088d0566d400092bf01f4f9001c82baa99
Author: Yoginder Bagga <yoginder.bagga@gmail.com>
Date:   Thu Jun 11 16:02:57 2026 +0530

    First file created for the git commands reference
yoginderbagga@fedora:~/devops-git-practice$ git add git-commands.md 
yoginderbagga@fedora:~/devops-git-practice$ git status
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	modified:   git-commands.md

yoginderbagga@fedora:~/devops-git-practice$ git commit -m "Added changes to the git-commands.md file"
[master b901d9a] Added changes to the git-commands.md file
 1 file changed, 8 insertions(+)
yoginderbagga@fedora:~/devops-git-practice$ 
```

#### Task 6: Added the file to the staging area and commit the change to Git.

















