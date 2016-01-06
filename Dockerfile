FROM debian
MAINTAINER Tobias Hofmann <tobi...@gmail.com>
# update apt and install apache2, wget and unzip
RUN apt-get update && apt-get install -y apache2 wget unzip
# download openui5 sdk
RUN wget https://openui5.hana.ondemand.com/downloads/openui5-sdk-1.32.9.zip -P /var/www/html
# unzip into {version} directory
RUN mkdir /var/www/html/1.32.9
RUN unzip /var/www/html/openui5-sdk-1.32.9.zip -d /var/www/html/1.32.9
RUN rm /var/www/html/openui5-sdk-1.32.9.zip
EXPOSE 80
ENTRYPOINT /usr/sbin/apache2ctl -D FOREGROUND
