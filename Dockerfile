FROM debian
MAINTAINER Tobias Hofmann <tobi...@gmail.com>
# update apt and install apache2, wget and unzip
RUN apt-get update \ 
  && apt-get install -y \ 
  apache2 \ 
  wget \ 
  unzip \ 
  && apt-get clean \ 
  && rm -rf /var/lib/apt/lists/*
# download openui5 sdk
RUN wget https://openui5.hana.ondemand.com/downloads/openui5-sdk-1.32.10.zip -P /var/www/html
# unzip into apache www root directory
RUN unzip -o /var/www/html/openui5-sdk-1.32.10.zip -d /var/www/html/
RUN rm /var/www/html/openui5-sdk-1.32.10.zip
EXPOSE 80
ENTRYPOINT /usr/sbin/apache2ctl -D FOREGROUND