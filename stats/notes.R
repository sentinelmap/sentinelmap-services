min_z <- 5
max_z <- 14
a <- min_z : max_z
ntiles <- 4 ^ (a - 4)
ntiles_tot <- sum(ntiles)

ntiles
ntiles_tot

# convert OSM tile numbers to lon/lat (in deg = top-left)
library(sp)

OSMxy2ll <- function( x , y , zoom=15 ) {
    n <- 2 ^ zoom
    lon.deg <- x / n * 360.0 - 180.0
    lat.rad <- atan( sinh( pi*( 1 - 2 * y / n ) ) )
    lat.deg <- lat.rad * 180.0 / pi
    data.frame( x = lon.deg , y = lat.deg )
}
longlatCRS <- CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +units=m +no_defs")
mercCRS <- CRS("+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs")

## <DataWindow>

bb_z <- 4
bb_x <- 8
bb_y <- 5

ul <- OSMxy2ll(bb_x, bb_y, bb_z)
lr <- OSMxy2ll(bb_x + 1, bb_y + 1, bb_z)
ul_longlat <- SpatialPoints(ul, longlatCRS )
lr_longlat <- SpatialPoints(lr, longlatCRS )
ul_merc <- spTransform(ul_longlat, mercCRS)
lr_merc <- spTransform(lr_longlat, mercCRS)

UpperLeftX <- ul_merc$x
UpperLeftY <- ul_merc$y
LowerRightX <- lr_merc$x
LowerRightY <- lr_merc$y
UpperLeftX
UpperLeftY
LowerRightX
LowerRightY

TileX <- 8192
TileY <- 5120

TileLevel <- 14

BlockSizeX <- 256
BlockSizeY <- 256
TileCountX <- 1
TileCountY <- 1

SizeX <- TileCountX * BlockSizeX * (2 ^ (TileLevel - bb_z))
SizeY <- TileCountY * BlockSizeY * (2 ^ (TileLevel - bb_z))
SizeX
SizeY

YOrigin <- "top"
