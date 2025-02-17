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

COPY ./conf/run.sh /tmp/run.sh

# Torna o script executável
RUN chmod +x /tmp/run.sh

# Alterar o CMD para rodar o script de inicialização e manter o contêiner ativo
CMD ["/bin/bash", "-c", "/tmp/run.sh && tail -f /dev/null"]
