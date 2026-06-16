# Networking Concepts for DevOps


## Definitions 

Task 1: Domain Name System  

- what happens when you type website name in browser?
- what are the difference type of DNS records? Write their definition in one line each:
- run the nslookup, dig command on terminal and understand the output

Task 2: IP Addressessing in Network

- what is the purpose of IPv5 address? How is it structured?
- write one line summary of public and private IPs -- also share an example of each
- define private IP ranges?
- on terminal, run ip addr command identify the private ip address.

Task 3: Subnetting and CIDR Concepts 

- what is /24 notation in an IP address 192.168.1.0/24?
- How many usable hosts in a /24, /16, /28 ?
- Define subnet in few lines.

Task 4: Port in networking

- What is the purpose of using ports in networking?
- write down few common ports and their use case?
- Run ss -tulpn and list the listening ports with their service

Task 5: What concepts you learned?

- run curl http://google.com:8080 -- what do you in the context of networking when running this command?
- app can't reach to a database 10.0.1.50:3306 -- what is the first thing you would check?


Task 1:

What happens when you visit a website?

There is just so much happens under the hoot when you type a website name on a browser. Lets try to understand this with high level details. 

Computer only understand the address and not the google.com which you type on browser. The computer has to do some extra work in order to translate the domain ( website name to put simply ) to an IP address to understand it. But how all these happens, lets break down in steps : 

1. Whenever you visit a website the request first goes through the ``DNS resolver`` which acts like a middlemen between your comptuer and the internet and helps in translating the domain into address. Resolver first always check the temporary cache in your computer to see the most recent DNS request to see if someone has already recently visited the similar site so it immediately returns the the saved IP address from there. This process is known as DNS Resolution and its actually a complex and detailed process so i only added a glimpse of what the resolver does. There are multiple DNS resolver and DNS resolver exists we will cover later in the post. For now stick with the next step that happens right after the DNS record with the IP address is available. <br>
2. Now the Server's location is known next is to establish a connection also known as ( TCP Handshake process ) In this process, broads create a dedicated connection with the host you're trying to connect using TCP THree way handshake. As most browser now use https protocole a secure TLS/SSL handshake takes place to fully secure the data transactions. <br>
3. 

4. 



