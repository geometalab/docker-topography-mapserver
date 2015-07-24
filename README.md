docker-compose build
docker-compose up

http://localhost:12345/cgi-bin/mapserv?map=/mapserver/config/mapserver_quickstart.map&SERVICE=WMS&REQUEST=Getmap&VERSION=1.1.1&LAYERS=Admin%20Countries&SRS=EPSG:4326&BBOX=-137,29,-53,88&FORMAT=PNG&WIDTH=800&HEIGHT=600

http://localhost:12345/cgi-bin/mapserv?map=/mapserver/config/mapserver_quickstart.map&SERVICE=WMS&REQUEST=Getmap&VERSION=1.1.1&LAYERS=N00E006_200&SRS=EPSG:4326&BBOX=6,0,7,1&FORMAT=PNG&WIDTH=800&HEIGHT=600


Zoomlevel to ratio:
```
  22:
       375
  21 :
       750
  20 : 1128.497220
       1500
  19 : 2256.994440
       3000
  18 : 4513.988880
       5000
  17 : 9027.977761
       10000
  16 : 18055.955520
       20000
  15 : 36111.911040
       40000
  14 : 72223.822090
       80000
  13 : 144447.644200
       160000
  12 : 288895.288400
       400000
  11 : 577790.576700
       800000
  10 : 1155581.153000
       1500000
  9  : 2311162.307000
       3000000
  8  : 4622324.614000
       6000000
  7  : 9244649.227000
       12500000
  6  : 18489298.450000
       25000000
  5  : 36978596.910000
       50000000
  4  : 73957193.820000
       100000000
  3  : 147914387.600000
       200000000
  2  : 295828775.300000
       400000000
  1  : 591657550.500000
```
