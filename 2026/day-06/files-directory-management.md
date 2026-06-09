# Files and Directory Management | Read and Write to Files 
<br>
In Linux, you can read and write to files using using built-in shell commands, Input/Output redirection operators such as "<" and the output redirection operators ">". <br>

1. Input Redirection ("<") : The input ("<") redirection in Linux allows you to force a particular command to read the data ( with a pattern like sort etc) from a file or text block instead of waiting for the keyboard input from the terminal screen. 

   Example: Input Redirection ("<"):
   <br>
``sandbox@playground:~/file_management$ grep "/bash" < high_cpu_process.txt``<br><br>
   <img width="1267" height="142" alt="image" src="https://github.com/user-attachments/assets/65dc4345-06f8-48ad-8457-4bd96aa0fe0f" /><br><br>
   <img width="852" height="157" alt="image" src="https://github.com/user-attachments/assets/cd69b7b7-f12a-42aa-91fb-36940c58ab38" /><br>
   <br>
   <img width="787" height="347" alt="image" src="https://github.com/user-attachments/assets/a594d642-2939-4e30-a834-aec4308fcc06" />

<br>


2. Output Redirection (">"): Which redirects the standard output of any command into a file defined by you like .html, .text, .md etc and this completely overwrite any existing content. See below example, I ran the command
   df -h > output_list
<br>
<br>
Example : Output Redirection<br>

<img width="1000" height="511" alt="image" src="https://github.com/user-attachments/assets/f1038518-67c6-4540-a341-7114879c254c" />
<br>
Now overwrite the existing content with same output redirection operator but different results. <br><br>
<img width="962" height="357" alt="image" src="https://github.com/user-attachments/assets/3d901cbb-35ce-45f8-b54a-2b48a6043a5e" />

Example #2 : Output Redirection <br>
<img width="1307" height="191" alt="image" src="https://github.com/user-attachments/assets/dff95177-2a73-4d77-9f43-c49617bd36e2" />

3. Append Operator ( >> ) : Which appends the output / text to an existing file instead of overwriting the file content, it inserts the new output at the bottom of the document or text file.<br>

<img width="977" height="372" alt="image" src="https://github.com/user-attachments/assets/50f2aebe-1f97-452a-b9d7-588741867b11" />


4. Head and Tail command : Head prints the top few lines of the text file. And tail prints the bottom few lines of a text file.<br>

   <img width="987" height="297" alt="image" src="https://github.com/user-attachments/assets/9d65a960-b39d-4373-b7c7-c91764bfc9e5" />




   
