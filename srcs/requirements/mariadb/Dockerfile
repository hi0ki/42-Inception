FROM debian:stable-slim

RUN apt update && apt install -y mariadb-server 

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY init.sql /etc/mysql/init.sql

RUN mkdir -p /var/run/mysqld



CMD [ "mysqld_safe" ]