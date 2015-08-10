#!/bin/bash

merge_shps() {
  for i in $(ls ${shp_dir}*.shp)
    do
      if [ -f ${outdir_base}${outfile}.shp ]
        then
         echo "merging $i"
         ogr2ogr -f 'ESRI Shapefile' -update -append ${outdir_base}${outfile}.shp $i -nln ${outfile}
      else
        echo "creating $outfile.shp"
        ogr2ogr -f 'ESRI Shapefile' ${outdir_base}${outfile}.shp $i
      fi
    done
}

create_vrt(){
  echo '<OGRVRTDataSource>
  <OGRVRTUnionLayer name="unionLayer">' > $merge_vrt
  for i in $(cd $shp_dir;ls $1*.shp)
    do
      echo "    <OGRVRTLayer name=\"merge\">
      <SrcDataSource>$i</SrcDataSource>
    </OGRVRTLayer>" >> $merge_vrt
    done

  echo '  </OGRVRTUnionLayer>
</OGRVRTDataSource>' >> $merge_vrt
  echo "merging"
  ogr2ogr $outfile $merge.vrt
}

shp_dir_base='data/shp/'
outdir_base='mapserver-docker/mapserver/data/merged/'

shp_dir="${shp_dir_base}500/"
outfile="500"
merge_vrt="500.vrt"
merge_shps
# create_vrt

shp_dir="${shp_dir_base}200/"
outfile="200"
merge_vrt="200.vrt"
merge_shps
# create_vrt

shp_dir="${shp_dir_base}100/"
outfile="100"
merge_vrt="100.vrt"
merge_shps
# create_vrt

shp_dir="${shp_dir_base}50/"
outfile="50"
merge_vrt="50.vrt"
merge_shps
# create_vrt

shp_dir="${shp_dir_base}20/"
outfile="20"
merge_vrt="20.vrt"
merge_shps
# create_vrt

shp_dir="${shp_dir_base}10/"
outfile="10"
merge_vrt="10.vrt"
merge_shps
# create_vrt
