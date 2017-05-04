# Spatial Statistic
library(RNetCDF)

Spatial_Stat <- function(NetCDFName, VarName){
  nc <- open.nc(NetCDFName)
  nc_data <- read.nc(nc)
  
  # get the variable name of lon & lat & time
  # sometimes these variable names have different name, such as LONGXY(y, x), LATIXY(y, x), lat(lon, lat), lon(lon, lat), etc
  nc_variables <- names(nc_data)
  lon <- nc_variables[1]
  lat <- nc_variables[2]
  time <- nc_variables[3]
  time_length <- length(var.get.nc(nc, "time"))
  lon_length <- length(var.get.nc(nc, "longitude"))
  lat_length <- length(var.get.nc(nc, "latitude"))
  # get the variable unit
  Variable_unit <- att.get.nc(nc, VarName, "units")
  # sometimes "long_name" & "description" are the same attribution 
  Variable_long_name <- att.get.nc(nc, VarName, "long_name")
  i <- c(1:time_length)
  dfr <- data.frame(Lon = rep(rep(as.vector(nc_data[[lon]]),lat_length),time_length), 
                    Lat = rep(rep(as.vector(nc_data[[lat]]),each=lon_length),time_length), 
                    Variable = as.vector(nc_data[[VarName]]))
  
  sa <- (time_length*tapply(i*dfr$Variable,list(dfr$Lon,dfr$Lat),sum))
        -(sum(i)*tapply(dfr$Variable,list(dfr$Lon,dfr$Lat),sum))
  
  sb <- time_length*sum(i^2)-(sum(i))^2
  
  sab <- sa/sb
  
  # After computing, The LAT's order is from small to big.
  slope <- data.frame(Lon = rep(as.vector(nc_data[[lon]]),lat_length), 
                    Lat = rep(as.vector(nc_data[[lat]]),each=lon_length), 
                    Variable = as.vector(sab[,lat_length:1]))
  
  tiff(paste(VarName,"_Slope.tif", sep=""), width=1500, height=1000, res=300)
  p <- ggplot(aes(x = Lon, y = Lat, fill=Variable), data=slope) +
       geom_raster(na.rm = T) +
       coord_fixed() +
       scale_fill_gradientn(colours=c("blue","green","yellow","red"),
                         guide = "colourbar", na.value = "transparent") +
    labs(title = paste(VarName, " Trend (", Variable_unit, "/y)", sep=''))
  
  print(p)
  dev.off()
  
  return(sab[,lat_length:1])
  
}