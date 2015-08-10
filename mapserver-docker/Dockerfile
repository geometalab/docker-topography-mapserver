FROM debian:jessie

RUN echo 'deb http://ftp.es.debian.org/debian jessie main contrib non-free\ndeb-src http://ftp.es.debian.org/debian jessie main contrib non-free\ndeb http://ftp.debian.org/debian/ jessie-updates main contrib non-free\ndeb-src http://ftp.debian.org/debian/ jessie-updates main contrib non-free\ndeb http://security.debian.org/ jessie/updates main contrib non-free\ndeb-src http://security.debian.org/ jessie/updates main contrib non-free' >  /etc/apt/sources.list

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
  mapserver-bin\
  cgi-mapserver\
  apache2\
  apache2-mpm-worker\
  libapache2-mod-fastcgi\
  libapache2-mod-php5\
  php5-common\
  php5-cli\
  php5-fpm\
  php5\
  gdal-bin

WORKDIR /mapserver/

ADD mapserver/config /mapserver/config

ADD mapserver/data/merged/ /var/www/

RUN a2enmod actions fastcgi alias cgi
ADD config/apache-site.conf /etc/apache2/sites-available/mapserver.conf
RUN a2dissite 000-default
RUN a2ensite mapserver

CMD apachectl -DFOREGROUND
