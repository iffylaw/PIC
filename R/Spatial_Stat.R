# Spatial Statistic
library(RNetCDF)
library(grid)
library(ggplot2)

Spatial_Stat <- function(NetCDFName, VarName=NULL){
  
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
  
  if (is.null(VarName)){
    
    multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
      
      # Make a list from the ... arguments and plotlist
      plots <- c(list(...), plotlist)
      
      numPlots = length(plots)
      
      # If layout is NULL, then use 'cols' to determine layout
      if (is.null(layout)) {
        # Make the panel
        # ncol: Number of columns of plots
        # nrow: Number of rows needed, calculated from # of cols
        layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                         ncol = cols, nrow = ceiling(numPlots/cols))
      }
      
      if (numPlots==1) {
        print(plots[[1]])
        
      } else {
        # Set up the page
        grid.newpage()
        pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
        
        # Make each plot, in the correct location
        for (i in 1:numPlots) {
          # Get the i,j matrix positions of the regions that contain this subplot
          matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
          
          print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                          layout.pos.col = matchidx$col))
        }
      }
    }
    
     VarName <- c("MAAT", "DDTa", "DDFa", "ALT")
     
     tiff(paste("4inds_Slope.tif", sep=""), width=2000, height=2000, res=300)
     
     for (v in 1:length(VarName)){
     
        Variable_unit <- att.get.nc(nc, VarName[v], "units")
        # sometimes "long_name" & "description" are the same attribution 
        Variable_long_name <- att.get.nc(nc, VarName[v], "long_name")
        i <- c(1:time_length)
        dfr <- data.frame(Lon = rep(rep(as.vector(nc_data[[lon]]),lat_length),time_length), 
                          Lat = rep(rep(as.vector(nc_data[[lat]]),each=lon_length),time_length), 
                          Trend = as.vector(nc_data[[VarName[v]]]))
        
        sa <- (time_length*tapply(dfr$Trend,list(dfr$Lon,dfr$Lat),sum))
        -(sum(i)*tapply(dfr$Trend,list(dfr$Lon,dfr$Lat),sum))
        
        sb <- time_length*sum(i^2)-(sum(i))^2
        
        sab <- sa/sb
        
        # After computing, The LAT's order is from small to big.
        slope <- data.frame(Lon = rep(as.vector(nc_data[[lon]]),lat_length), 
                            Lat = rep(as.vector(nc_data[[lat]]),each=lon_length), 
                            Trend = as.vector(sab[,lat_length:1]))
        
        assign(paste("p", v, sep = ""), ggplot(aes(x = Lon, y = Lat, fill=Trend), data=slope) +
          geom_raster(na.rm = T) +
          coord_fixed() +
          scale_fill_gradientn(colours=c("blue","green","yellow","red"),
                               guide = "colourbar", na.value = "transparent") +
          annotate("text", x=92, y=36.5, label=paste(VarName[v], " Trend (", Variable_unit, "/y)", sep='')))
     }   
     
    multiplot(p1, p2, p3, p4, cols=2)
    dev.off()
    
  } else {
      # get the variable unit
      Variable_unit <- att.get.nc(nc, VarName, "units")
      # sometimes "long_name" & "description" are the same attribution 
      Variable_long_name <- att.get.nc(nc, VarName, "long_name")
      i <- c(1:time_length)
      dfr <- data.frame(Lon = rep(rep(as.vector(nc_data[[lon]]),lat_length),time_length), 
                        Lat = rep(rep(as.vector(nc_data[[lat]]),each=lon_length),time_length), 
                        Trend = as.vector(nc_data[[VarName]]))
      
      sa <- (time_length*tapply(dfr$Trend,list(dfr$Lon,dfr$Lat),sum))
            -(sum(i)*tapply(dfr$Trend,list(dfr$Lon,dfr$Lat),sum))
      
      sb <- time_length*sum(i^2)-(sum(i))^2
      
      sab <- sa/sb
      
      # After computing, The LAT's order is from small to big.
      slope <- data.frame(Lon = rep(as.vector(nc_data[[lon]]),lat_length), 
                        Lat = rep(as.vector(nc_data[[lat]]),each=lon_length), 
                        Trend = as.vector(sab[,lat_length:1]))
      
      tiff(paste(VarName,"_Slope.tif", sep=""), width=1500, height=1000, res=300)
      p <- ggplot(aes(x = Lon, y = Lat, fill=Trend), data=slope) +
           geom_raster(na.rm = T) +
           coord_fixed() +
           scale_fill_gradientn(colours=c("blue","green","yellow","red"),
                             guide = "colourbar", na.value = "transparent") +
        annotate("text", x=92, y=36.5, label=paste(VarName, " Trend (", Variable_unit, "/y)", sep=''))
      
      print(p)
      dev.off()
  
  }
  
  #return(sab[,lat_length:1])
  
}