FROM debian:stable-slim

RUN apt update && apt install -y mariadb-server 

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY init.sh /init.sh
RUN chmod +x /init.sh


RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld
    
EXPOSE 3306

CMD ["/init.sh"]