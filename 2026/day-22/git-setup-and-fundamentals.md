# Git Fundamentals and Commands 

### Runbook:  
- What is Git and where it is used?
- What features Git provides?
- Setup Git on your laptop and Perform below challenges

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



