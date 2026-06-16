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


## Task 1:

What happens when you visit a website?

There is just so much happens under the hoot when you type a website name on a browser. Lets try to understand this with high level details. 

Computer only understand the address and not the google.com which you type on browser. The computer has to do some extra work in order to translate the domain ( website name to put simply ) to an IP address to understand it. But how all these happens, lets break down in steps : 

1. Whenever you visit a website the request first goes through the ``DNS resolver`` which acts like a middlemen between your comptuer and the internet and helps in translating the domain into address. Resolver first always check the temporary cache in your computer to see the most recent DNS request to see if someone has already recently visited the similar site so it immediately returns the the saved IP address from there. This process is known as DNS Resolution and its actually a complex and detailed process so i only added a glimpse of what the resolver does. There are multiple DNS resolver and DNS resolver exists we will cover later in the post. For now stick with the next step that happens right after the DNS record with the IP address is available. <br>

2. Now the Server's location is known next is to establish a connection also known as ( TCP Handshake process ) In this process, broads create a dedicated connection with the host you're trying to connect using TCP THree way handshake. As most browser now use https protocole a secure TLS/SSL handshake takes place to fully secure the data transactions. <br>

3. HTTP Request : In this step, HTTP asks the server ( destination ) for the website files to load. The browser has request packet which consist of information such as target path, the HTTP version and metadata headers for the browser type.  

4. HTTP Response : As the web-server receives the packet it then ready the page for you also known as payload. Nginx or ( apache ) webs server are used on the destination location to process your request and prepare the website files you have requested ( index.html ) for example. <br>
The server now ready to reply with the HTTP response packet ( 200 OK for the success ) and the HTML,CSS or Javascript  file in the response body. 

5. Rendering the page: Now the response page is at the source location ( your computer ) where the browser makes it beautiful? Here the browser adds the styling on HTML files using the CSS and adds the Javascript features like DOM to make the page more dynamic. 


Different types of DNS records <br>

DNS records are basically the instructions or the steps written on a plain text files which are used to connect domain names with the IP address within the DNS server. Use commands like ``dig``, ``nslookup`` on terminal to check info about DNS records.
<br>


- A record: An A-record of a domain retrieve the actual IPv4 address.<br>
  `` dig w3school.com``<br?
<img width="1470" height="467" alt="image" src="https://github.com/user-attachments/assets/fd1f0e41-f169-43d0-888f-e1f984700685" />

  
- AAAA record: An AAAA-record of a domain retrieve the IPv6 address <br> Its same as IPv4 type of record, just a different IP address type.

  <img width="1311" height="498" alt="Screenshot 2026-06-16 213208" src="https://github.com/user-attachments/assets/e4c611c0-d4b4-4960-b871-c20978b5b347" />

- CNAME:
- MX: AN MX record is responsible for telling you which email server are used to accept email messages for a particular domain. 
- SOA: 

<img width="635" height="356" alt="image" src="https://github.com/user-attachments/assets/5600efc0-3ece-495f-a2c1-9d900948000c" />


