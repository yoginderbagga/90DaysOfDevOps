# Persistent Data and Container Communication [ Docker Volumes & Networking ]

### What is Dokcer volume?

Docker volume is a persistent data storage mechanism used to store the data permanently unlike in the case of default filesystem in which the data gets deleted as soon as the docker is removed or destroyed. 

Two most common docker storage mechanisms are 

1. Docker Volume: Stored at the host operating system ( In linux at : /var/lib/docker/volumes/), they are used mostly for the production data, and managed by the docker itself. 
2. Bind Mounts: Another way to store Docker container data to the localhost is to use Bind mounts which link a specific file or folder from the host machine to the container. Bind Mounts are not directly managed by the Docker CLI and they are not used as frequently as Docker volume. Bind mounts create a link between a file or directory on the host machine (Fedora Linux) and a file or directory inside the container. If any changes made to either location they are immediately reflected in the other side too. So the ``Bind Mounts`` are not managed by Docker instead they're like a connectivity link, if change happens on one source code the other side of the file with same name get changed as well. ( Useful during the development stage as software developers are consistenyl making changes, editing the code )

## Task 1: Adding data to Postgre Container

1. Run a Postgres or MySQL Container and add some data inside it ( a table or rows )
2. Stop and remove the container
3. Run a new one and verify if the data is still there or not

Write your observation in few lines.

## Task 2: Creating Volumes

1. Created a Named Volume , run the same container with volume attached to it.
2. Add the database companydb and a table, and then remove the container again
3. Now create a new container with the same Volume you had attached before.
4. Verify if the data is still there. 



## Task 3: Setting up Bind Mounts



## Task 4: What is Docker Networking?



## Task 5: Setting up Customer Networks



## Task 6: Bring All Concepts Together


# Task 1: Creating a Postgres container 

a) created a container with the official postgres image and run the container. 

```
ubuntu@ip-172-31-19-178:~/postgre$ docker run --name idatabase -e POSTGRES_PASSWORD=mypass -p 5432:5432 -d postgres
Unable to find image 'postgres:latest' locally
latest: Pulling from library/postgres
d5d76d0b0f65: Pull complete 
e95a6c7ea7d4: Pull complete 
97bcc504aa3b: Pull complete 
0ff2e2431cea: Pull complete 
12eb26f51ae1: Pull complete 
68a752b4a968: Pull complete 
60c77d82eba8: Pull complete 
4eb3b0865106: Pull complete 
2fcab0f6cbf5: Pull complete 
926c1bf368d7: Pull complete 
74c100cd0ed8: Pull complete 
78b3b98b5637: Pull complete 
cdf3c51537bb: Pull complete 
0bdfb2e194c4: Download complete 
29bf8f85e20b: Download complete 
Digest: sha256:1a5b3e745bbd82d6deb146505e504da3c2f248cac15e431951b148fbe4f8613a
Status: Downloaded newer image for postgres:latest
ee30a3c247bc37c0bf672ee5c1937b519b4b53a96e46aa904ab49f563810fee2
```

b) Go inside the container using ``exec`` and run the psql for the database creation.

```
ubuntu@ip-172-31-19-178:~/postgre$ docker exec -it idatabase psql -U postgres
psql (18.4 (Debian 18.4-1.pgdg13+1))
Type "help" for help.

postgres=# CREATE DATABASE companydb;
CREATE DATABASE
postgres=# \c companydb 
You are now connected to database "companydb" as user "postgres".

c) Create a table name as employees and inser the data 
companydb=# CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);
CREATE TABLE
companydb=# \dt
            List of tables
 Schema |   Name    | Type  |  Owner   
--------+-----------+-------+----------
 public | employees | table | postgres
(1 row)

companydb=# INSERT INTO employees (name, department, salary)
VALUES ('Alice', 'IT', 70000);
INSERT 0 1
companydb=# INSERT INTO employees (name, department, salary)
VALUES ('Bob', 'HR', 50000);
INSERT 0 1
companydb=# INSERT INTO employees (name, department, salary)
VALUES ('Charlie', 'Finance', 65000);
INSERT 0 1
companydb=# SELECT * FROM employees;
 id |  name   | department | salary 
----+---------+------------+--------
  1 | Alice   | IT         |  70000
  2 | Bob     | HR         |  50000
  3 | Charlie | Finance    |  65000
(3 rows)
```

c) Stop the container and remove it compltely 

```
ubuntu@ip-172-31-19-178:~/postgre$ docker stop idatabase 
idatabase
ubuntu@ip-172-31-19-178:~/postgre$ docker rm idatabase 
idatabase
```

d) Re-build the same container and you can see there no longer exist ``companydb``; this is the disadvantage when not using the ``Docker volume`` as whatever data storage in your container gets lost as you remove the container.  In Next task we will learn Docker Volume to understand how to persist this data. 

<img width="1780" height="602" alt="image" src="https://github.com/user-attachments/assets/50ed1bd2-b14a-4919-b068-cca3b169d711" />

# Task 2: Named volumes

Excersise completed. Removed the previous container and rebuild it again with a Volume data and then removed it back again. This time data was persisted into the same container as the data persistent done with volume. 


ubuntu@ip-172-31-19-178:~/postgre$ docker run -d --name yogi_postgre -e POSTGRES_PASSWORD=mypass -p 5432:5432 --mount type=volume,source=yogi_data_vol,target=/var/lib/postgresql postgres


```
ubuntu@ip-172-31-19-178:~/postgre$ docker exec -it yogi_postgre psql -U postgres
psql (18.4 (Debian 18.4-1.pgdg13+1))
Type "help" for help.

postgres=# CREATE DATABASE companydb;
CREATE DATABASE
postgres=# \c companydb 
You are now connected to database "companydb" as user "postgres".
companydb=# CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    salary INT
);
CREATE TABLE
```

```
companydb=# INSERT INTO employees (name, salary)
VALUES
('Alice', 70000),
('Bob', 80000);
INSERT 0 2
companydb=# SELECT * FROM employees;
 id | name  | salary 
----+-------+--------
  1 | Alice |  70000
  2 | Bob   |  80000
(2 rows)
```

```
ubuntu@ip-172-31-19-178:~/postgre$ docker rm -f yogi_postgre 
yogi_postgre
```

``ubuntu@ip-172-31-19-178:~/postgre$ docker run -d --name yogi_postgre -e POSTGRES_PASSWORD=mypass -p 5432:5432 --mount type=volume,source=yogi_data_vol,target=/var/lib/postgresql postgres``


# Task 3: Bind Mounts in Docker 


