#!/bin/bash

# Executa comandos no banco de dados

#!/bin/bash
service mariadb start

mysql -u root -e "
    CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME};
    CREATE USER IF NOT EXISTS '${DATABASE_USER}'@'%' IDENTIFIED BY '${DATABASE_PASSWORD}';
    GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${DATABASE_USER}'@'%';
    FLUSH PRIVILEGES;"

echo "Banco de dados e usuário administrador criados com sucesso!"
