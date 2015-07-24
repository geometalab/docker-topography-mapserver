#!/bin/bash
mkdir -p /map/data/shp/500 /map/data/shp/200 /map/data/shp/100 /map/data/shp/50 /map/data/shp/25 /map/data/shp/10
for i in $(cd $1;ls *.hgt)
  do
    convert='gdal_contour -a elev -i '
    $convert 500 $1$i /map/data/shp/500/$i.shp
    $convert 200 $1$i /map/data/shp/200/$i.shp
    $convert 100 $1$i /map/data/shp/100/$i.shp
    $convert 50 $1$i /map/data/shp/50/$i.shp
    $convert 20 $1$i /map/data/shp/25/$i.shp
    $convert 10 $1$i /map/data/shp/10/$i.shp
  done
