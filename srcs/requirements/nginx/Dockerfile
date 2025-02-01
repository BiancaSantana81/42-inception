FROM debian:oldstable

# estou copiando da pasta atual para a pasta /etc/nginx no meu contêiner
COPY conf/nginx.conf /etc/nginx/conf/nginx.conf

COPY html /usr/share/nginx/html

RUN apt update -y && apt upgrade -y && apt install nginx -y

CMD ["nginx", "-g", "daemon off;"]