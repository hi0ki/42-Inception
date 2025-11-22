FROM debian:stable-slim

RUN apt-get update && apt-get install -y vsftpd

COPY vsftpd.conf /etc/vsftpd.conf

RUN useradd -m -d /var/www/html ftpuser && \
    echo "ftpuser:ftppass" | chpasswd && \
    chown -R ftpuser:ftpuser /var/www/html

EXPOSE 21 30000-30009

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]