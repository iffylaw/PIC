# ggmap the TTOP & ALT
library(ggmap)
library(animation)

Map_Pic <- function(VarName){
  
  stations <- length(Station_Info$SID)
  MinYear <- min(Station_Info$FromYear)
  MaxYear <- max(Station_Info$ToYear)
  Years <- MaxYear-MinYear+1
  
  title <- ""
  d <- array(NA, dim=c(Years, stations))
  
  if(VarName=="MAAT"){
    d <- MAAT_QTP
    title <- "MAAT"
  }
  else if(VarName=="MAGST"){
    d <- MAGST_QTP
    title <- "MAGST"
  }
  else if(VarName=="MAGT"){
    d <- MAGT_QTP
    title <- "MAGT"
  }
  else if(VarName=="DDTa"){
    d <- DDTa_QTP
    title <- "DDTa"
  }
  else if(VarName=="DDTs"){
    d <- DDTs_QTP
    title <- "DDTs"
  }
  else if(VarName=="NT"){
    d <- NT_QTP
    title <- "NT"
  }
  else if(VarName=="NF"){
    d <- NF_QTP
    title <- "NF"
  }
  else if(VarName=="NO"){
    d <- NO_QTP
    title <- "Nival Offset"
  }
  else if(VarName=="SO"){
    d <- SO_QTP
    title <- "Surface Offset"
  }
  else if(VarName=="TO"){
    d <- TO_QTP
    title <- "Thermal Offset"
  }
  else if(VarName=="VO"){
    d <- VO_QTP
    title <- "Vegetation Offset"
  }
  else if(VarName=="TTOP_K"){
    d <- TTOP_K_QTP
    title <- "TTOP by Kudryavstev"
  }
  else if(VarName=="TTOP_S"){
    d <- TTOP_S_QTP
    title <- "TTOP by Smith & Riseborough"
  }
  else if(VarName=="ALT_K"){
    d <- ALT_K_QTP
    title <- "ALT by Kudryavstev"
  }
  else if (VarName=="ALT_S"){
    d <- ALT_S_QTP
    title <- "ALT by Stefan"
  }
  else if (VarName=="FD"){
    d <- FD_S_QTP
    title <- "Freeze Depth"
  }
  else {
    d <- NA
    title <- ""
  }
  
  map = function(i){
    
    ggmap(get_googlemap(center=c(lon = 90, lat = 35),zoom=5, maptype='terrain')) +
      geom_point(data=as.data.frame(d[i,]),
                 aes(x=Station_Info$Lon, y=Station_Info$Lat), size=d[i,], col="red") +
      scale_size_identity() +
      ggtitle(paste(title, " (", (MinYear:MaxYear)[i], ")", sep=""))
  }
  
  saveGIF( for(i in 1:Years) print(map(i)), 
           movie.name = paste(VarName, "_ggmap.gif", sep=""), convert = "convert")
  
}