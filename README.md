# SentinelMap Services beta - online soon

Sign up for free with a Github account for access up to 50,000 Sentinel-2 tiles monthly.

## Basemap Tile Service

Get a new Basemaps API key.

### Leaflet quick-start example

Download the Leaflet example file:

index.html

Edit the tiles URL adding your key:

``` javascript
var Url = 'https://tile.sentinelmap.eu/2016/summer/rgb/{z}/{x}/{y}.jpg?key=<my-sentinelmap-key>';
```

Now you can open it with your favourite browser.

### Accessing Sentinelmap using the WMS format in GDAL

Download the local service description XML file:

wms_sentinelmap.xml

Edit the tiles URL adding your key:

``` xml
<ServerUrl>https://tile.sentinelmap.eu/2016/summer/rgb/${z}/${x}/${y}.jpg?key=<my-sentinelmap-key></ServerUrl>
```

Now you can open it as raster layer with QGIS.

Or save an image with 'gdal_translate', usage example:

gdal_translate -of GTIFF -outsize 100% 100% -projwin 1368500 5693500 1378500 5687500 -CO "TILED=YES" -CO "COMPRESS=JPEG" -CO "JPEG_QUALITY=75" -CO "PHOTOMETRIC=YCBCR" wms_sentinelmap.xml Venice.tif

gdal_translate -of GTIFF -outsize 1% 1% -projwin 640000 6040000 1520000 5460000 -CO "TILED=YES" -CO "COMPRESS=JPEG" -CO "JPEG_QUALITY=75" -CO "PHOTOMETRIC=YCBCR" wms_sentinelmap.xml Alps.tif

