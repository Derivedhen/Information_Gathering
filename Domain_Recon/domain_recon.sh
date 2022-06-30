#!/bin/bash


if [ "$1" == "" ]; then

	echo "----------------------------------------------------------"
	echo "|--                   DOMAIN RECON                     --|"
	echo "|--                   Version: 1.1                     --|"
	echo "|--                 Code By: Derived                   --|"
	echo "----------------------------------------------------------"
	echo "|- Exemplo de Uso: ./domainrecon.sh dominio.com.br      -|"
	echo "----------------------------------------------------------"

else
	echo "----------------------------------------------------------"
	echo "|--                   DOMAIN RECON                     --|"
	echo "|--                   Version: 1.1                     --|"
	echo "|--                 Code By: Derived                   --|"
	echo "----------------------------------------------------------"

	# SERVIDORES DNS
	echo 
	echo "-> NAME SERVERS"
	echo -----------------------------------------------
	host -t ns $1 | cut -d " " -f 4

	# SERVIDORES DE E-MAIL
	echo
	echo 
	echo "-> MX SERVERS"
	echo -----------------------------------------------
	host -t mx $1 | cut -d " " -f 7

	# CONFIGURAÇÃO SPF
	echo
	echo 
	echo "-> CONFIGURAÇÃO SPF"
	echo -----------------------------------------------
	host -t TXT $1

	# TRANSFERÊNCIA DE ZONA
	echo
	echo
	echo "-> TENTANDO TRANSFERÊNCIA DE ZONA"
	for nameserver in $(host -t ns $1 | cut -d " " -f 4); do
		echo -----------------------------------------------
		dig -t AXFR $1 @$nameserver
	done

	# BRUTE FORCE SUBDOMAIN
	echo
	echo
	echo "-> BRUTE FORCE SUBDOMAIN, WORDLIST: /usr/share/dnsenum/dns.txt"
	echo -----------------------------------------------
	for subdomain in $(cat /usr/share/dnsenum/dns.txt); do
		host $subdomain.$1 | grep -v "NXDOMAIN"
	done
fi
