#!/bin/bash
# gdaldem hillshade N00E006.hgt N00E006.tif
gdal_translate -co "COMPRESS=LZW" -of GTiff N00E006.hgt N00E006.tif
gdaldem color-relief N00E006.tif color_relief.txt N00E006_color_relief.tif
# gdaldem slope N00E006.tif N00E006_slope.tif
gdaldem slope N00E006.hgt -co "COMPRESS=LZW" N00E006_slope.tif -compute_edges -p
gdaldem color-relief N00E006_slope.tif slopeshade.txt N00E006_slopeshade.tif
gdaldem color-relief N00E006.hgt slopeshade.txt N00E006_slopeshade.tif
gdaldem hillshade N00E006.hgt N00E006_hillshade.tif
