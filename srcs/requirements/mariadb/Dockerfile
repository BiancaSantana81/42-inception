FROM debian:oldstable

# Atualiza o sistema e instala o MariaDB
RUN apt update -y && apt upgrade -y \
    && apt install -y mariadb-server \
    && rm -rf /var/lib/apt/lists/*

# Criar diretório necessário para o MySQL e definir permissões
RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld

# Evita que o contêiner finalize imediatamente
CMD ["mysqld_safe"]
