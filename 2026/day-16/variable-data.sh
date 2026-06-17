#!/bin/bash
#	Name: Yoginder Bagga
#	Purpose: Demonstrate variable use in Bash script
#	Scope: For learning purpose


NAME="Tom Cruise"
ROLE="DevOps Engineer"

# run script with single quote

echo -e 'Hello this is $Name\n'
echo -e 'Profile is $ROLE\n'

# run script with double quote

echo -e "Hello this is: $NAME\n"
echo -e "Profile is: $ROLE\n"

