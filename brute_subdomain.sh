#!/bin/bash

# PARA MUDAR A WORDLIST, ALTERE A VARIÁVEL ABAIXO
link_wordlist=('subdomains.lst')
wordlist=$(cat $link_wordlist)

if [ "$1" == "" ]; then
	echo "----------------------------------------------------------"
	echo "|--               BRUTE FORCE SUBDOMAIN                --|"
	echo "|--                  Version: 1.2                      --|"
	echo "|--                Code By: Derived                    --|"
	echo "----------------------------------------------------------"
	echo "|-     Exemplo de Uso: ./dnsrecon.sh dominio.com.br     -|"
	echo "----------------------------------------------------------"

else
	echo "----------------------------------------------------------"
	echo "|--               BRUTE FORCE SUBDOMAIN                --|"
	echo "|--                  Version: 1.2                      --|"
	echo "|--                Code By: Derived                    --|"
	echo "----------------------------------------------------------"
	echo "|-     Exemplo de Uso: ./dnsrecon.sh site.com.br        -|"
	echo "----------------------------------------------------------"
	echo "|-> WORDLIST UTILIZADA: $link_wordlist"
	echo ""
	echo "|-> PROCURANDO SUBDOMÍNIOS..."

	for subdomain in $wordlist;
	do
		host $subdomain.$1 | grep -v "NXDOMAIN"
	done
fi
