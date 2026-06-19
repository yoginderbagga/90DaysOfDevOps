# Networking Concepts and Commands


## OSI Layer vs TCP / IP Stack 

<img width="850" height="1177" alt="image" src="https://github.com/user-attachments/assets/44b4ca0f-1e6f-41e6-9d2f-c608dd8818a1" />

1. Application Layer: This is where the network layer data is shown to an application which can be an email or web-browser. HTTP, FTP, and SMTP are some of the common services used at the application layer level.

 
2. Presentation Layer: This is where the data gets encrypted / decrypted, compressed to ensure that data is available in the correct format for the application which runs it. SSL / TLS security are the common protocols which are used to encrypt and authenticate data between the client and the server.

   
3. Session Layer: When you login to a application say facebook.com it establish, maintain, and eventually terminate the connection between the applications. The job of session layer is to manage the on-going session from the time it initiates to closing the session. ( Example sockets ) 
   
4. Transport Layer: This layer is responsible for reliable, transparent data transfer among the end systems. ( Used for error recovery, flow control and end to end transfer examples are : TCP and UDP protocols ) TCP make sure that once the data is send to destination it gets reached there without any error message, and if there's any error or issue it reports the error. Whereas the UDP protocol which is used in connection-less application like videos, gaming, VOIP they don't ensure if the data is dropped in between, its gone there's no way to recover that. ( UDP is less reliable)
    
5. Network Layer: The actual layer which manages the data packet routing, IP addressing and the IP protocols from the source to a destination network. ( Protocols include: IP, ICMP, IPSec)


6. Data Link Layer: This layer is responsible to ensure that data reaches correctly from the network to a physical layer, and it manages the error detection. ( A MAC address, network switches( Cisco, Juniper) they work on the data link layer at the local network communication. 

7. Physical Layer: This layer is responsible for the physical and electrical signal transmission between the devices. When a computer connect to a network through Cat5, Cat6cable then physical layer handle the tranmission of the binary data through the electrical signals along the cable. 


# Quick Checklist

- ifconfig / ip addr
- ping <ip-address>
- traceroute
- ss -tulpn
- dig <domain> / nslookup <domain>
- CURL : responsible to transferring data to a URL and it supports various protocol like http, HTTPS, FTP etc


``yoginderbagga@fedora:~$ sudo ss -tulpn | grep :80`` the ss command quickly fetches the process which is using the port 80. 

<img width="1787" height="166" alt="image" src="https://github.com/user-attachments/assets/048a5f28-8de2-439b-a4f1-edcf0e35b710" />


Using CURL command to fetch the data about the web-browser : 

As you can see below CULR - I command is used to ask the web-server to provide the http server header response but not the actual HTML page content. Its like knocking a door the near by and asking "Is everything alright?" In production env you may use nginx, apache or gunicorn web-server in that moment it will be helpful to run a CURL toward that server to check if the server HTTP is working good or not. 

``200 means success in HTTP code`` and ``404 means not found`` and ``403 means forbidden``   

The terminal result shows which means HTTP is working good  ``HTTP/1.1 200 OK``



<img width="987" height="360" alt="image" src="https://github.com/user-attachments/assets/0474f123-98c6-4411-8cde-90f590604f6a" />






