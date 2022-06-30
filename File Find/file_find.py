import sys
from os import system
from time import sleep

msg_metafind = str("FILE FIND TOOL")
msg_version = str("VERSION: 1.1")
by = str("Code By: Derived")

print("==" * 31)
print("")
print(f"""\033[34m{msg_metafind:^58}
	 MODO DE USO: python3 metafind.py URL FILETYPE
EXEMPLO DE USO: python3 metafind.py www.businesscorp.com.br pdf
{msg_version:^58}
{by:^58}\033[m""")
print("")
print("==" * 31)

dominio = sys.argv[1]
filetype = sys.argv[2]

print("")
print("\033[34m[*] PROCURANDO ARQUIVOS...\033[m")
print("")
sleep(4)
print("==" * 29)


# REALIZA UM GOOGLE DORKS PELO DOMÍNIO E TIPO DE ARQUIVO
system(f'lynx --dump "https://google.com/search?q=site:{dominio}+ext:{filetype}" | grep ".{filetype}" | cut -d "=" -f2 | egrep -v "site|google" | sed "s/...$//" > links_{filetype}')

# TRANSFORMANDO OS LINKS EM UMA LISTA PARA SEREM LIDOS PELO LAÇO FOR
dir_arquivo = str(f"links_{filetype}")
arquivo = open(dir_arquivo)
links = arquivo.readlines()

if len(links) == 0:
	print("")
	print("\033[31m[X] ARQUIVOS NÃO ENCONTRADOS :(\033[m")
	print("")
	sleep(4)
	print("==" * 29)
	system(f"rm links_{filetype}")
	
else:
	print("")
	print("\033[32m[!] ARQUIVOS ENCONTRADOS:\033[m")
	print(system(f'cat links_{filetype}'))
	sleep(3)
	print("\033[32m[!] REALIZANDO O DOWNLOAD...\033[m")
	print("")


	# REALIZA O DOWNLOAD DOS ARQUIVOS
	for url in links:
		system(f'wget -q {url} ')

	# EXCLUI OS ARQUIVOS DE LINKS
	system(f"rm links_{filetype}")

	print("==" * 29)
	print("")
	print("\033[32m[*] DOWNLOAD CONCLUÍDO. EXTRAIA OS METADADOS E VISUALIZE O CONTEÚDO :D\033[m")
	print("")
	sleep(4)
	print("==" * 29)
	system("ls -l")
	print("==" * 29)
