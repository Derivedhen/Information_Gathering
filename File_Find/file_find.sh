#!/bin/bash

if [ "$1" == "" ]; then
	echo "-------------------------------------------------- "
	echo "|--                  FILE FIND                  --|"
	echo "|--                 Version: 1.0                --|"
	echo "|--               Code By: Derived              --|"
	echo "---------------------------------------------------"
	echo "|- MODO DE USO: ./filefind.sh dominio.com.br pdf -|"
	echo "|- MODO DE USO: ./filefind.sh dominio.com.br txt -|"
	echo "|- MODO DE USO: ./filefind.sh dominio.com.br asp -|"
	echo "---------------------------------------------------"
else
	lynx --dump "https://google.com/search?q=site:$1+ext:$2" | grep ".$2" | cut -d "=" -f 2 | egrep -v "site|google" | sed s'/...$//'g
fi
