USER = bsantana

WORDPRESS_DIRECTORY =/home/$(USER)/data/wordpress
MARIADB_DIRECTORY = /home/$(USER)/data/mariadb

all: create_directorys

# Alvo para criar o diretório
create_directorys:
	@echo "Criando diretório de dados do MariaDB em $(MARIADB_DIRECTORY)..."
	@sudo mkdir -p $(MARIADB_DIRECTORY)
	@sudo mkdir -p $(WORDPRESS_DIRECTORY)
	@echo "Diretório pronto para ser copiado para o contêiner!"

## adicionar regra para baixar o .env de um repo no meu github, regras para build, up clean etc