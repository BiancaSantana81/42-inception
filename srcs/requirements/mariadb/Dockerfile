FROM debian:oldstable

ARG DATABASE_NAME
ARG DATABASE_USER
ARG DATABASE_PASSWORD

# Atualiza o sistema e instala o MariaDB
RUN apt update -y && apt upgrade -y \
    && apt install -y mariadb-server \
    && rm -rf /var/lib/apt/lists/*

# Criar diretório necessário para o MySQL e definir permissões
RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld

COPY /conf/init.sh /tmp/script.sh

COPY /tools/my.cnf /etc/mysql/my.cnf

RUN chmod 777 /tmp/script.sh && bash /tmp/script.sh

# Evita que o contêiner finalize imediatamente
CMD ["mysqld_safe"]