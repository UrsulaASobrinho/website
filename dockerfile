FROM ubuntu:22.04
#FROM debian

#baixa as informações do pacote da Internet
RUN apt-get update 

#Instalando o servidor Apache 2
RUN apt-get install -y apache2 
# Apache com php 
#RUN apt-get update -y && apt-get install -y apache2 php
#RUN apt-get install –y apache2-utils 

    
# Variáveis ​​de ambiente no Apache, estas váriaveis estao vinculadas apache2.conf
ENV APACHE_LOCK_DIR="/var/lock/apache2"
ENV APACHE_PID_FILE="/var/run/apache2/apache2.pid"
ENV APACHE_RUN_USER="www-data"
ENV APACHE_RUN_GROUP="www-data"
ENV APACHE_LOG_DIR="/var/log/apache2"
ENV APACHE_SERVER_NAME="localhost"

#LABEL description="webserver"
VOLUME /var/www/html/

#Este é o arquivo de configuração principal do servidor. 
COPY apache-conf /etc/apache2/apache2.conf
 
# Expose Apache
EXPOSE 80
 
# Launch Apache
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
#CMD  [“/usr/local/apache/bin/apachectl”, “-D”, “FOREGROUND”]