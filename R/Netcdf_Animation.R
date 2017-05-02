# NetCDF Animation
require(ncdf4)
require(RNetCDF)
require(ggplot2)
require(animation)

Netcdf_Animation <- function(NetCDFName, VarName){
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
  
  # get the range of variable data, e.g. fivenum function
  # min & max value may be singular values
  # min_value <- min(unlist(nc_data[[VarName]]))
  quartile_25 <- quantile(unlist(nc_data[[VarName]]), na.rm=T)[2]
  quartile_25[quartile_25>0] =  quartile_25*0.5
  quartile_25[quartile_25<0] =  quartile_25*1.5
  quartile_75 <- quantile(unlist(nc_data[[VarName]]), na.rm=T)[4]
  quartile_75[quartile_75>0] =  quartile_75*1.5
  quartile_75[quartile_75<0] =  quartile_75*0.5
  max_value <- max(unlist(nc_data[[VarName]]), na.rm=T)
  min_value <- min(unlist(nc_data[[VarName]]), na.rm=T)
  
  # time process
  #date_int <- as.integer(nc_data[[time]])
  #date_hour <- round((nc_data[[time]]-date_int)*24)
  Years <- 1980:2010
  
  # get the variable unit
  Variable_unit <- att.get.nc(nc, VarName, "units")
  # sometimes "long_name" & "description" are the same attribution 
  Variable_long_name <- att.get.nc(nc, VarName, "long_name")
  
  # Draw function, i is the time series
  drawit = function(i, nc_data){
    #nc_data[[VarName]][,,i][is.na(nc_data[[VarName]][,,i])]<-0
    
    dfr <- data.frame(Lon = rep(as.vector(nc_data[[lon]]),lat_length), Lat = rep(as.vector(nc_data[[lat]]),each=lon_length), 
                      Variable = as.vector(nc_data[[VarName]][,,i]))
    
    p <- ggplot(aes(x = Lon, y = Lat, fill=Variable), data=dfr)
    p +  geom_raster(interpolate = T, na.rm = T) +
         coord_fixed() +
         scale_fill_gradientn(limits = c(min_value, max_value),
                              colours=c("blue","green","yellow","red"),
                              #colours = c("#0000FF","#000FF0","#00FF00","#0FF000","#FF0000"),
                              guide = "colourbar", na.value = "transparent") +
         labs(title = paste(Variable_long_name, " (", Variable_unit, ", ",  Years[i], ")", sep=''))
  }
  
  # set current directory to output the gif animation
  ani.options(outdir = getwd())
  
  # Save GIF animation
  saveGIF({
    for (i in 1:time_length) print(drawit(i, nc_data))
  }, 
  movie.name=paste(VarName,'_Animation.gif',sep=""), interval = 1)
  
  # close the netcdf file
  close.nc(nc)

}