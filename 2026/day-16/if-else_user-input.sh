#!/bin/bash
#	Name: Yoginder Bagga
#	Purpose: To demonstrate if-else condition use with user input basis
#	Scope: For learning
#

read -p "Enter a number:" num

if [ $num -gt 0 ]; then
	echo "You have entered a positive number"
elif [ $num -lt 0 ]; then
	echo "You have entered a negative number"
else 
	echo "Number is Zero"
fi
