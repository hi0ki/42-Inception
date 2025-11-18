FROM debian:stable-slim

RUN apt update && apt install -y mariadb-server 

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/.


COPY tools/script_db.sh /script_db.sh
RUN chmod +x /script_db.sh

RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld

EXPOSE 3306

CMD ["./script_db.sh"]