USER = bsantana

# WORDPRESS_DIRECTORY =/home/$(USER)/data/wordpress
# MARIADB_DIRECTORY = /home/$(USER)/data/mariadb

# ----- descomentar pc de casa e comentar na máquina da 42
MARIADB_DIRECTORY = /home/bsantana/data/mariadb
WORDPRESS_DIRECTORY =/home/bsantana/data/wordpress

all: create_directorys

# Alvo para criar o diretório
create_directorys:
	@echo "Criando diretório de dados do MariaDB em $(MARIADB_DIRECTORY)..."
	@sudo mkdir -p $(MARIADB_DIRECTORY)
	@sudo mkdir -p $(WORDPRESS_DIRECTORY)
	@echo "Diretório pronto para ser copiado para o contêiner!"