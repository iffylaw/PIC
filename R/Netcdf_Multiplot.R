# NetCDF multiplot

require(ncdf4)
require(RNetCDF)
require(ggplot2)
#require(animation)

Netcdf_Multiplot <- function(NetCDFName, VarName){
  # set current directory to output the gif animation
  #ani.options(outdir = getwd())
  
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
  tiff(paste(VarName,"_allyears.tif", sep=""), width=2800, height=2000, res=300)
  dfr <- data.frame(Lon = rep(as.vector(nc_data[[lon]]),lat_length), Lat = rep(as.vector(nc_data[[lat]]),each=lon_length), 
                    Legend=as.vector(nc_data[[VarName]][,,1]), Year=Years[1])
  
  for (i in 2:time_length){ 
    
    dfr <- rbind(dfr, data.frame(Lon = rep(as.vector(nc_data[[lon]]),lat_length), Lat = rep(as.vector(nc_data[[lat]]),each=lon_length), 
                                 Legend=as.vector(nc_data[[VarName]][,,i]), Year=Years[i]))
  }
  
  p <- ggplot(aes(x = Lon, y = Lat, fill=Legend), data=dfr) +
      geom_raster(interpolate = T, na.rm = T) +
      coord_fixed() +
      facet_wrap( ~ Year, ncol=8) +
      scale_fill_gradientn(limits = c(min_value, max_value),
                           colours=c("blue","green","yellow","red"),
                           #colours = c("#0000FF","#000FF0","#00FF00","#0FF000","#FF0000"),
                           na.value = "transparent") +
      ggtitle(paste(Variable_long_name, " (", Variable_unit, ")", sep="")) +
      theme(plot.title = element_text(hjust = 0.5))
  
  print(p)
  dev.off()
  
  
  # close the netcdf file
  close.nc(nc)
  
}