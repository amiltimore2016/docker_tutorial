# A basic apache server. To use either add or bind mount content under /var/www
FROM ubuntu:latest

MAINTAINER Antonio Medina: 1.0
ENV HTTP_PROXY 'http://web-proxy.sgp.hp.com:8080'
ENV HTTPS_PROXY 'http://web-proxy.sgp.hp.com:8080'
COPY resolv.sh /tmp/resolv.sh
RUN chmod +x /tmp/resolv.sh
RUN /tmp/resolv.sh
COPY 95proxy /etc/apt/apt.conf.d/95proxy
COPY entry.sh /usr/bin/entry.sh
RUN  chmod +x /usr/bin/entry.sh
RUN apt-get update && apt-get install -y apache2 && apt-get clean \ 
&& rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR=/var/run
ENV APACHE_PID_FILE=/var/tmp/apache.pid

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
ENTRYPOINT ["/usr/bin/entry.sh"]
