FROM debian:jessie

RUN apt update
RUN apt install nano mysql-client cron -y
COPY backup-cron /etc/cron.d/backup-cron
COPY recovery.sh /usr/local/bin/recovery.sh
RUN chmod +x /usr/local/bin/recovery.sh
RUN crontab /etc/cron.d/backup-cron

CMD ["cron", "-f"]
