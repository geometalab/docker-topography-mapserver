#!/bin/bash
outfile=$2
for i in $(ls $1*.shp)
  do
    if [ -f $outfile ]
      then
       echo "merging $i"
       ogr2ogr -f 'ESRI Shapefile' -update -append $outfile $i -nln merge
    else
      echo "creating $outfile"
      ogr2ogr -f 'ESRI Shapefile' $outfile $i
    fi
  done
