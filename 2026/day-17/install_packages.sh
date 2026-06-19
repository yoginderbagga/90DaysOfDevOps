#!/bin/bash
#	Name: Yoginder Bagga
#	Purpose: Demonstrate package install using bash script
#	Scope: For learning purpose
#


packages=("nginx" "curl" "wget2")

for package in "${packages[@]}"
do

	if rpm -q "$package" &>/dev/null
	then 
		echo "$package is already installed."
	else
		echo "$package is not installed, Installijng...."
		sudo dnf install -y "$package"
	fi

done

echo "Pacakges verification completed."




