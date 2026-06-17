#!/bin/bash
#
#	Name: Yoginder Bagga
#	Purpose: Test the web-server status on server
#	Scope: For learning only
#

echo "This script is test the service status on the server"
read -p "Press Y if you would like to test" input

if [ "$input" == "Y" ]; then
	systemctl status nginx
elif [ "$input" == "N" ]; then
	echo "You have selected no"
else 
	echo "No choice"
fi


