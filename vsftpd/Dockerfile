# Copied from https://github.com/fauria/docker-vsftpd/tree/e5544259
FROM centos:7
ENV FTP_USER =*String** \
    FTP_PASS=**Random** \
    PASV_ADDRESS=**IPv4** \
    PASV_MIN_PORT=21100 \
    PASV_MAX_PORT=21110 \
    LOG_STDOUT=**Boolean**

VOLUME /home/vsftpd
VOLUME /var/log/vsftpd

EXPOSE 20 21

CMD ["/usr/sbin/run-vsftpd.sh"]

RUN yum install -y vsftpd db4-utils db4 \
    && yum clean all

RUN mkdir -p /home/vsftpd/
RUN chown -R ftp:ftp /home/vsftpd/

COPY vsftpd.conf /etc/vsftpd/
COPY vsftpd_virtual /etc/pam.d/
COPY run-vsftpd.sh /usr/sbin/
RUN chmod +x /usr/sbin/run-vsftpd.sh
