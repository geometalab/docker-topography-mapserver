docker-compose build
docker-compose up

http://localhost:12345/cgi-bin/mapserv?map=/mapserver/config/mapserver_quickstart.map&SERVICE=WMS&REQUEST=Getmap&VERSION=1.1.1&LAYERS=Admin%20Countries&SRS=EPSG:4326&BBOX=-137,29,-53,88&FORMAT=PNG&WIDTH=800&HEIGHT=600

http://localhost:12345/cgi-bin/mapserv?map=/mapserver/config/mapserver_quickstart.map&SERVICE=WMS&REQUEST=Getmap&VERSION=1.1.1&LAYERS=N00E006_200&SRS=EPSG:4326&BBOX=6,0,7,1&FORMAT=PNG&WIDTH=800&HEIGHT=600
