#!/bin/bash
###############
#	Name: Yoginder Bagga
#	Purpose: To demonstratge while loop usage
#	Scope: for learning purpose
#
#


echo "--------Demonstrate While Loop-------"

read -p "Enter a number:" num

while [ $num -gt 0 ];
do
	echo "The number is : $num"
	((num--))	# Increments the counter
done
echo -e "Completed\n"


