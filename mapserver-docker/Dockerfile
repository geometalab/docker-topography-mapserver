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

ADD mapserver/data /mapserver/data
ADD mapserver/config /mapserver/config
ADD mapserver/utils /mapserver/utils

RUN /mapserver/utils/convert_hgt_to_shp.sh /mapserver/data/hgt/

RUN /mapserver/utils/merge_shapefiles.sh /map/data/shp/500/ /var/www/500.shp
RUN /mapserver/utils/merge_shapefiles.sh /map/data/shp/200/ /var/www/200.shp
RUN /mapserver/utils/merge_shapefiles.sh /map/data/shp/100/ /var/www/100.shp
RUN /mapserver/utils/merge_shapefiles.sh /map/data/shp/50/ /var/www/50.shp
RUN /mapserver/utils/merge_shapefiles.sh /map/data/shp/25/ /var/www/25.shp
RUN /mapserver/utils/merge_shapefiles.sh /map/data/shp/10/ /var/www/10.shp

RUN a2enmod actions fastcgi alias cgi
ADD config/apache-site.conf /etc/apache2/sites-available/mapserver.conf
RUN a2dissite 000-default
RUN a2ensite mapserver

CMD apachectl -DFOREGROUND
