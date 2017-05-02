# Spatial PIC
# cot: Thermal conductivity of ground in thawed state (W/moC)
# cof: Thermal conductivity of ground in frozen state (W/moC)
# L:	volumetric latent heat of fusion	(KJ/m3) 3.34*10^5 KJ/m3
# Y: Dry bulk density (kg/m3)
# W:	Soil water content in thawed state	(%)
# Wu:	Soil unfrozen water content in frozen state	(%)

library(RNetCDF)

Spatial_Pic <- function(NetCDFName, StartYear, EndYear){
  
  L <- 3.34*10^5
  
  # Create NetCDF and copy attribution as well as the frocing NetCDF data
  pic_nc <- create.nc(NetCDFName)
  
  dim.def.nc(pic_nc, "longitude", 51)
  dim.def.nc(pic_nc, "latitude", 74)
  dim.def.nc(pic_nc, "time", unlim=TRUE)
  
  var.def.nc(pic_nc, "longitude", "NC_DOUBLE", c("longitude"))
  var.def.nc(pic_nc, "latitude", "NC_DOUBLE", c("latitude"))
  var.def.nc(pic_nc, "time", "NC_DOUBLE", "time")
  
  var.def.nc(pic_nc, "FD", "NC_DOUBLE", c("longitude", "latitude", "time"))
  var.def.nc(pic_nc, "ALT", "NC_DOUBLE", c("longitude", "latitude", "time"))
  var.def.nc(pic_nc, "MAAT", "NC_DOUBLE", c("longitude", "latitude", "time"))
  var.def.nc(pic_nc, "DDTa", "NC_DOUBLE", c("longitude", "latitude", "time"))
  var.def.nc(pic_nc, "DDFa", "NC_DOUBLE", c("longitude", "latitude", "time"))
  
  att.put.nc(pic_nc, "longitude", "long_name", "NC_CHAR", "longitude")
  att.put.nc(pic_nc, "longitude", "units", "NC_CHAR", "degrees_east")
  att.put.nc(pic_nc, "longitude", "axis", "NC_CHAR", "X")
  
  att.put.nc(pic_nc, "latitude", "long_name", "NC_CHAR", "longitude")
  att.put.nc(pic_nc, "latitude", "units", "NC_CHAR", "degrees_north")
  att.put.nc(pic_nc, "latitude", "axis", "NC_CHAR", "Y")
  
  att.put.nc(pic_nc, "time", "long_name", "NC_CHAR", "time")
  att.put.nc(pic_nc, "time", "units", "NC_CHAR", "hours since 1900-01-01 00:00:00")
  att.put.nc(pic_nc, "time", "calendar", "NC_CHAR", "standard")
  att.put.nc(pic_nc, "time", "axis", "NC_CHAR", "T")
  
  #att.put.nc(pic_nc, "FD", "_FillValue", "NC_FLOAT", "-3.4e+38f")
  #att.put.nc(pic_nc, "ALT", "_FillValue", "NC_FLOAT", "-3.4e+38f")
  #att.put.nc(pic_nc, "MAAT", "_FillValue", "NC_FLOAT", "-3.4e+38f")
  #att.put.nc(pic_nc, "DDTa", "_FillValue", "NC_FLOAT", "-3.4e+38f")
  #att.put.nc(pic_nc, "DDFa", "_FillValue", "NC_FLOAT", "-3.4e+38f")
  
  att.put.nc(pic_nc, "FD", "missing_value", "NC_DOUBLE", "-3.4e+38")
  att.put.nc(pic_nc, "ALT", "missing_value", "NC_DOUBLE", "-3.4e+38")
  att.put.nc(pic_nc, "MAAT", "missing_value", "NC_DOUBLE", "-3.4e+38")
  att.put.nc(pic_nc, "DDTa", "missing_value", "NC_DOUBLE", "-3.4e+38")
  att.put.nc(pic_nc, "DDFa", "missing_value", "NC_DOUBLE", "-3.4e+38")
  
  att.put.nc(pic_nc, "FD", "units", "NC_CHAR", "m")
  att.put.nc(pic_nc, "ALT", "units", "NC_CHAR", "m")
  att.put.nc(pic_nc, "MAAT", "units", "NC_CHAR", "oC")
  att.put.nc(pic_nc, "DDTa", "units", "NC_CHAR", "oC")
  att.put.nc(pic_nc, "DDFa", "units", "NC_CHAR", "oC")
  
  att.put.nc(pic_nc, "FD", "long_name", "NC_CHAR", "Max Freezing Depth")
  att.put.nc(pic_nc, "ALT", "long_name", "NC_CHAR", "Active Layer Thickness")
  att.put.nc(pic_nc, "MAAT", "long_name", "NC_CHAR", "Mean annual air temperature")
  att.put.nc(pic_nc, "DDTa", "long_name", "NC_CHAR", "Thawing degree-days of air")
  att.put.nc(pic_nc, "DDFa", "long_name", "NC_CHAR", "Freezing degree-days of air")
  
  att.put.nc(pic_nc, "FD", "projection", "NC_CHAR", "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
  att.put.nc(pic_nc, "ALT", "projection", "NC_CHAR", "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
  att.put.nc(pic_nc, "MAAT", "projection", "NC_CHAR", "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
  att.put.nc(pic_nc, "DDTa", "projection", "NC_CHAR", "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
  att.put.nc(pic_nc, "DDFa", "projection", "NC_CHAR", "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
  
  att.put.nc(pic_nc, "FD", "projection_format", "NC_CHAR", "PROJ.4")
  att.put.nc(pic_nc, "ALT", "projection_format", "NC_CHAR", "PROJ.4")
  att.put.nc(pic_nc, "MAAT", "projection_format", "NC_CHAR", "PROJ.4")
  att.put.nc(pic_nc, "DDTa", "projection_format", "NC_CHAR", "PROJ.4")
  att.put.nc(pic_nc, "DDFa", "projection_format", "NC_CHAR", "PROJ.4")
  
  year <- c(710037, 718797, 727557, 736317, 745101, 753861, 762621, 
             771381, 780165, 788925, 797685, 806445, 815229, 823989, 832749, 841509, 
             850293, 859053, 867813, 876573, 885357, 894117, 902877, 911637, 920421, 
             929181, 937941, 946701, 955485, 964245, 973005)
  
  para <- open.nc("../Data/QTEC_Forcing_Daily/Parameters.nc", write=FALSE)
  W <- var.get.nc(para, "W")/100
  Wu <- var.get.nc(para, "Wu")/100
  Y <- var.get.nc(para, "Y")
  cot <- var.get.nc(para, "cot")
  cof <- var.get.nc(para, "cof")
  
  Years <- StartYear:EndYear
  for (y in Years) {
    QTEC_Forcing_Daymean <- open.nc(paste("../Data/QTEC_Forcing_Daily/QTEC_Forcing_Daily_", 
                                          y, ".nc", sep=""), write=FALSE)
    
    latitude <- var.get.nc(QTEC_Forcing_Daymean, "latitude")
    longitude <- var.get.nc(QTEC_Forcing_Daymean, "longitude")
    
    ALL_Days <- dim.inq.nc(QTEC_Forcing_Daymean,"time")$length
    
    AIR_TEMP <- var.get.nc(QTEC_Forcing_Daymean, "temp")
    Air_Temp_less_0 <- AIR_TEMP[,,1:ALL_Days]-273.15
    Air_Temp_upper_0 <- AIR_TEMP[,,1:ALL_Days]-273.15
    
    Air_Temp_less_0[Air_Temp_less_0[,,1:ALL_Days] > 0] =0
    Air_Temp_upper_0[Air_Temp_upper_0[,,1:ALL_Days] < 0] =0
    
    Thawing_index <- abs(rowSums(Air_Temp_upper_0, dims=2))
    Freezing_index <- abs(rowSums(Air_Temp_less_0, dims=2))
    maat <- (Thawing_index-Freezing_index)/365
      
    Dt <- sqrt((2*cot*86400*Thawing_index)/(L*Y*(W-Wu)))
    Df <- sqrt((2*cof*86400*Freezing_index)/(L*Y*(W-Wu)))
    
    yy <- which(Years==y)
    
    print(paste("Calculating: ", Years[yy], sep=""))
    
    Thawing_index[which(is.na(Thawing_index)||Thawing_index=="NA")] <- -3.4e+38
    Freezing_index[which(is.na(Freezing_index)||Freezing_index=="NA")] <- -3.4e+38
    maat[which(is.na(maat)||maat=="NA")] <- -3.4e+38
    Dt[which(is.na(Dt)||Dt=="NA")] <- -3.4e+38
    Df[which(is.na(Df)||Df=="NA")] <- -3.4e+38
    #print(Freezing_index)
    var.put.nc(pic_nc, "latitude", latitude)
    var.put.nc(pic_nc, "longitude", longitude)
    var.put.nc(pic_nc, "time", year)
    var.put.nc(pic_nc, "DDTa", Thawing_index, c(1, 1, yy), c(51, 74, 1), na.mode=0)
    var.put.nc(pic_nc, "DDFa", Freezing_index, c(1, 1, yy), c(51, 74, 1), na.mode=0)
    var.put.nc(pic_nc, "MAAT", maat, c(1, 1, yy), c(51, 74, 1), na.mode=0)
    var.put.nc(pic_nc, "ALT", Dt, c(1, 1, yy), c(51, 74, 1), na.mode=0)
    var.put.nc(pic_nc, "FD", Df, c(1, 1, yy), c(51, 74, 1), na.mode=0)
    
    sync.nc(pic_nc)
    close.nc(QTEC_Forcing_Daymean)
  }
  
  # Global attribution
  att.put.nc(pic_nc, "NC_GLOBAL", "Title", "NC_CHAR", "Compute Spatial permafrost indices")
  att.put.nc(pic_nc, "NC_GLOBAL", "Author", "NC_CHAR", "Lihui Luo email:luolh@lzb.ac.cn")
  
  close.nc(pic_nc)
  
}