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

ADD mapserver/data /mapserver/data
ADD mapserver/config /mapserver/config
RUN mkdir -p /mapserver/data/shp

RUN gdal_contour -a elev -i 500 /mapserver/data/hgt/N00E006.hgt /var/www/N00E006_500.shp
RUN gdal_contour -a elev -i 200 /mapserver/data/hgt/N00E006.hgt /var/www/N00E006_200.shp
RUN gdal_contour -a elev -i 100 /mapserver/data/hgt/N00E006.hgt /var/www/N00E006_100.shp
RUN gdal_contour -a elev -i 50 /mapserver/data/hgt/N00E006.hgt /var/www/N00E006_50.shp
RUN gdal_contour -a elev -i 20 /mapserver/data/hgt/N00E006.hgt /var/www/N00E006_20.shp
RUN gdal_contour -a elev -i 10 /mapserver/data/hgt/N00E006.hgt /var/www/N00E006_10.shp

RUN chown www-data:www-data -R /mapserver

RUN a2enmod actions fastcgi alias cgi
ADD config/apache-site.conf /etc/apache2/sites-available/mapserver.conf
RUN a2dissite 000-default
RUN a2ensite mapserver

CMD apachectl -DFOREGROUND
