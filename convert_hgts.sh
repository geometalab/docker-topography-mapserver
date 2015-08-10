#!/bin/bash
contour() {
  out="data/shp/$size/$i.shp"
  tif="data/tif/$i.tif"
  if [ ! -f $out ]
    then
    gdal_contour -a elev -i $size $dir$i $out
  fi
}

slopeshade() {
  out="data/slopeshade/${i}_slopeshade.tif"
  # gdaldem slope -co "COMPRESS=LZW" -of GTiff $dir$i ${out}_.tif
  # gdaldem color-relief -co "COMPRESS=LZW" -of GTiff -alpha ${out}_.tif slopeshade.txt $out
  # gdaldem color-relief -co "COMPRESS=LZW" -of GTiff -alpha ${out}_.tif slopeshade.txt $out
  gdaldem hillshade -co "COMPRESS=LZW" -of GTiff -alt 20 -compute_edges $dir$i $out
}

# This function is currently not needed!
tif() {
  out="data/tif/$i.tif"
  if [ ! -f $out ]
    then
    gdal_translate -co "COMPRESS=LZW" -of GTiff $dir$i $out
  fi
}

dir='data/hgt/'
mkdir -p data/tif
mkdir -p data/slopeshade
mkdir -p data/shp/500 data/shp/200 data/shp/100 data/shp/50 data/shp/20 data/shp/10
for i in $(cd $dir;ls *.hgt)
  do
    tif
    slopeshade
    size=500 contour
    size=200 contour
    size=100 contour
    size=50 contour
    size=20 contour
    size=10 contour
  done
