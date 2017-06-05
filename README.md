# SentinelMap Services beta

SentinelMap Services documentation and tools.

[Sign up](https://devs.sentinelmap.eu) for free with a Github account for access up to 50,000 Sentinel-2 tiles monthly.

## Basemap Tile Service

Get a new Basemaps API key.

### Leaflet quick-start example

For running an interactive web map using [Leaflet](http://leafletjs.com/), you can start with this example file:

[index.html](https://github.com/sentinelmap/sentinelmap-services/blob/master/Leaflet_quick-start/index.html) \[[download raw file](https://raw.githubusercontent.com/sentinelmap/sentinelmap-services/master/Leaflet_quick-start/index.html)\]

Edit the tiles URL \([line 48](https://github.com/sentinelmap/sentinelmap-services/blob/master/Leaflet_quick-start/index.html#L48)\) adding your key:

``` javascript
var Url = 'https://tile.sentinelmap.eu/2016/summer/rgb/{z}/{x}/{y}.jpg?key=_my-sentinelmap-key_';
```

Now you can open it with your browser or deploy on the web.

### Accessing Sentinelmap using the WMS format in GDAL

Accessing the service is also  possible using the WMS format in [GDAL](http://www.gdal.org/). Service is accessed by using this local service description XML file:

[wms_sentinelmap.xml](https://github.com/sentinelmap/sentinelmap-services/blob/master/WMS/wms_sentinelmap.xml) \[[download raw file](https://raw.githubusercontent.com/sentinelmap/sentinelmap-services/master/WMS/wms_sentinelmap.xml)\]

Edit the tiles URL \([line 3](https://github.com/sentinelmap/sentinelmap-services/blob/master/WMS/wms_sentinelmap.xml#L3)\) adding your key:

``` xml
<ServerUrl>https://tile.sentinelmap.eu/2016/summer/rgb/${z}/${x}/${y}.jpg?key=_my-sentinelmap-key_</ServerUrl>
```

Now you can open it as raster layer with [QGIS](http://www.qgis.org).

Or save an image with '[gdal_translate](http://www.gdal.org/gdal_translate.html)', usage examples:

``` sh
gdal_translate -of GTIFF -outsize 100% 100% -projwin 1368500 5693500 1378500 5687500 -CO "TILED=YES" -CO "COMPRESS=JPEG" -CO "JPEG_QUALITY=75" -CO "PHOTOMETRIC=YCBCR" wms_sentinelmap.xml Venice.tif
```

``` sh
gdal_translate -of GTIFF -outsize 1% 1% -projwin 640000 6040000 1520000 5460000 -CO "TILED=YES" -CO "COMPRESS=JPEG" -CO "JPEG_QUALITY=75" -CO "PHOTOMETRIC=YCBCR" wms_sentinelmap.xml Alps.tif
```

