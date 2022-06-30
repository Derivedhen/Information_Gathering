#!/bin/bash

if [ "$1" == "" ]; then
	echo "----------------------------------------------------------"
	echo "|--                     WEB RECON                      --|"
	echo "|--                   Version: 1.2                     --|"
	echo "|--                 Code By: Derived                   --|"
	echo "----------------------------------------------------------"
	echo "|- Exemplo de Uso: ./WebRecon.sh http://site.com.br     -|"
	echo "|- Exemplo de Uso: ./webrecon.sh http://site.com.br php -|"
	echo "|- Exemplo de Uso: ./webrecon.sh http://site.com.br txt -|"
	echo "----------------------------------------------------------"

else
	echo "----------------------------------------------------------"
	echo "|--                     WEB RECON                      --|"
	echo "|--                   Version: 1.2                     --|"
	echo "|--                 Code By: Derived                   --|"
	echo "----------------------------------------------------------"
	echo "|- Exemplo de Uso: ./WebRecon.sh http://site.com.br     -|"
	echo "|- Exemplo de Uso: ./webrecon.sh http://site.com.br php -|"
	echo "|- Exemplo de Uso: ./webrecon.sh http://site.com.br txt -|"
	echo "----------------------------------------------------------"
	
	webserver=$(curl -s --head http://rh.businesscorp.com.br/ | grep "Server" | cut -d " " -f 2)

	# PARA MUDAR A WORDLIST, ALTERE ESSE DIRETÓRIO
	wordlist='web_recon.txt'
	
	echo "----------------------------------------------------------"
	echo "-> Web Server Identificado: $webserver"
	echo "-> Wodlist Utilizada: $wordlist"
	echo "----------------------------------------------------------"


	# LISTAGEM DE DIRETORIO
	echo "Buscando por Diretorios:"
	for diretorio in $(cat $wordlist); do
		resposta=$(curl -s -H "User-Agent: DerivedTool" -o /dev/null -w "%{http_code}" $1/$diretorio/)
		if [ $resposta == "200" ]; then
			echo "Diretorio econtrado: $1/$diretorio"
		fi
	done
	echo "----------------------------------------------------------"

	# LISTAGEM DE ARQUIVOS
	if [ "$2" != "" ]; then
		echo "Buscando por Arquivos"
		for arquivo in $(cat $wordlist); do
			resposta=$(curl -s -H "User-Agent: DerivedTool" -o /dev/null -w "%{http_code}" $1/$arquivo.$2)
			if [ $resposta == "200" ]; then
				echo "Arquivo Encontrado: $1/$arquivo.$2"
			fi
		done
	fi
fi
