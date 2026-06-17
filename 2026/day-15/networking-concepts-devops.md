# Networking Concepts for DevOps


## Definitions 

Task 1: Domain Name System  

- what happens when you type website name in browser?
- what are the difference type of DNS records? Write their definition in one line each:
- run the nslookup, dig command on terminal and understand the output

Task 2: IP Addressessing in Network

- what is the purpose of IPv4 address? How is it structured?
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
  `` dig w3school.com``<br>
<img width="1470" height="467" alt="image" src="https://github.com/user-attachments/assets/fd1f0e41-f169-43d0-888f-e1f984700685" /><br>

  
- AAAA record: An AAAA-record of a domain retrieve the IPv6 address <br> Its same as IPv4 type of record, just a different IP address type.

  <img width="1311" height="498" alt="Screenshot 2026-06-16 213208" src="https://github.com/user-attachments/assets/e4c611c0-d4b4-4960-b871-c20978b5b347" />

- CNAME: In CNAME records, no IP address are there. CNAME records is used to map an alias domain or a subdomain to an actual domain name of the website itself. Lets take an example of a website called ``company.com`` , suppose ``company.com`` is the hostname which user uses to access the website but tha actual web-server is configured for ``server123.hostingprovider.com``; instead of pointing multiple DNS records to the IP address you can do like this :
<br>

``www.company.com    CNAME    server123.hostingprovider.com``
The benefit of using CNAME is suppose the organization has changed the server IP address ``198.51.100.20`` to something else ``203.0.113.10``  which can happen time to time in org. In this case, you will not have to update the new IP address in each of the records of the sub-domains, as there can be multiple domains for a company website. The only place you have to update the IP address is one time and the rest of the 5 domains will automatically use the CNAM ( alias ) 

<br>

- MX: AN MX record is responsible for telling you which email server are used to accept email messages for a particular domain. 
- SOA: A start of authority in DNS maintain a critical information about a domain such as primary server, contact email address and zone update intervals.

<img width="1261" height="426" alt="Screenshot 2026-06-16 215248" src="https://github.com/user-attachments/assets/44822640-6a4b-4896-b6af-26126d94f80e" />


<img width="635" height="356" alt="image" src="https://github.com/user-attachments/assets/5600efc0-3ece-495f-a2c1-9d900948000c" />
<br>  

``nslookup w3school.com``  
<br>
<img width="1200" height="208" alt="Screenshot 2026-06-16 215420" src="https://github.com/user-attachments/assets/b0790874-7c36-47bd-b12a-7d37eccd2719" />


## Task 2:

## IP Addressessing in Network <br>
<br>


Internet Protocol is an 32 bit IPv4 address which is used to uniquely identify a device on the internet. IP address is divided with 4 octets of 8 bits each and seperated with a dotted notation. 
<br>

Mainly there are three parts of an IPv4 address, first Network, second Host and third is the Subnet. The network part help identify the network an IPv4 address belongs to. Host part is used to uniquely identify a machine on the network ( private or a public network ) ; each device on a network has a unique host id. The largest number of the Subnet means less number of IP address will be in one of their group. 

Subnet part: is a part of an IPv4 address which divides a network into smaller or logically independend network segments. Lets see how the subnet mask works in real world :  

- IP Address: ``192.168.1.14``  
- Subnet Mask: ``255.255.255.0``  
- Network Part: ``192.168.1.0``  
- Host ID: ``.14``  

Some of the most common subnet size : Suppose a network has a Subnet of /24 (255.255.255.0) this will have about 256 number of the IP address. Guess how many IP address will be in /16 network (255.255.0.0) it will be 65,536 number of hosts. <br>

## Difference in Public and Private IP address 
<br>

Public IP: Public is what used by the network to communicate globally with the other networks. This address is usually assigned by the ISP and web-applications, online service uses Public IP only to communicate with the outside world. You can also call a Public IP as a routable IP address. 
<br>

Private IP: A private IP is mainly used within a local network or an organization with no access outside the local internet. Loca IP address ranges are:

``10.0.0.0 - 10.255.255.255``  
``172.16.0.0 - 172.31.255.255``  
``192.168.0.0 - 192.168.255.255``  

<img width="931" height="497" alt="Screenshot 2026-06-17 163849" src="https://github.com/user-attachments/assets/9e8244c8-fe0e-4389-8214-b8b691855e54" />

As you can see the IP address starting with inet is private IP address : ``10.0.2.15``  <br>

## Task 3:


## CIDR and Subnetting


what is /24 notation in an IP address 192.168.1.0/24? <br> 

Whenever you see a / (slash) notation always remember that /24 or /16 or /8 they all indicate the first 24 bits of an IPv4 address of the 32 bits which define a network. The reamanining 8 bits left are the host part of the network. 
/24 = 255.255.255.0

<br>

How many usable hosts in a /24, /16, /28 ?
 
In a /24 subnet network there are total 256 ( 2*2*2*2*2*2*2*2) IPv4 address out of which 2 address are reserved for the default gateway and broadcast address the reamaining 254 assigned to the host IPs.

in a /16 subnet, there are total of 65,536 IPv4 address out of which 2 are reserved for default gateway and broadcast communication and the reamining 65,534 are used for the host IPs.

<br>

Subnet in Networking:
<br>
The main purpose of subnet is to divide a large network into small logical groups of network known as subnets. If there was never a subnet concept, then each network range will have huge number of IP address and in case only some of them from that range are required then a large chunk of the IPs will be wasted. Hence its useful to reduce the wastage of the IPs to divide them into a small logical groups and also to increase the security of the network. 

| CIDR | Subnet Mask     | Total IPs   | Usable Hosts |
|------|-----------------|-------------|--------------|
| /24  | 255.255.255.0   |  256        |  254         |
| /16  | 255.255.0.0     |  65,536     |  65,534      |
| /28  | 255.0.0.0       |  16,777,216 |  16,777,214  |


<br>

## Task 4:

Define Port and its purpose 

Port makes it easy for the computer to quickly identify the different kinds of internet traffic : for example, email communication goes to a different port that a web-page access. Same for the Zoom meeting port or your SSH port are different types of traffic routing. 
When the computer receives data from a destination device, it makes easy for computer to understand what to do with the data that they receive. For instance, an engineer is sending file to a client computer using the File Transfer Protocol (FTP) this will use the port 21 for the identification of the traffic once it receives or sends from the engineer device. Meanwhile the client can continue to receive and access facebook.com, Github.com or any other website simaltaneiously on a different port like http (80) or https (443)


| Port | Service |
|------|---------|
| 22   | SSH     |
| 80   | HTTP    |
| 443  | HTTPS   |
| 53   | DNS     |
| 3306 | MySql   |
| 6379 | Redis   |
| 27017| MongoDB |

SS (socket statistics )

When combine an IP address with a port number it creates a socket. This is like a software object which functions to transmit data from a source to a destination port. The socket can be in listening, established and closed state. 

NOTE: Socket is two way end point object that creates a communication end point, where as port is actually a number to identify that communication end point object at source or destination location. 

<img width="1060" height="413" alt="Screenshot 2026-06-17 171104" src="https://github.com/user-attachments/assets/29305f42-f5ed-4b29-9707-efd7fa213bdc" />



## Task 5:

