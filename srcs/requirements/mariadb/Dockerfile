FROM debian:oldstable

ARG ADMIN_NAME
ARG ADMIN_PASSWORD
ARG DATABASE_NAME
ARG ROOT_PASSWORD

RUN apt update -y && apt upgrade -y \
    && apt install mariadb-server -y \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

COPY cnf/my.cnf /etc/mysql/my.cnf

COPY conf/run.sh /tmp/run.sh

RUN chmod 777 /tmp/run.sh && bash /tmp/run.sh

CMD ["mysqld_safe"]