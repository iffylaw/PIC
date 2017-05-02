# To determine which sites exists permafrost by TTOP values 
library(ggplot2)
library(ggmap)

Exist_Permafrost <- function(plot="no"){
  # whether any value of the column less than 0
  # if has, plot
  
  stations <- length(Station_Info$SID)
  count1 <-array(NA, dim=c(stations))
  for(s in 1:stations){
    if (mean(TTOP_S_QTP[,s], na.rm=TRUE)<0){
      count1[s]=s  
    }
  }
  
  count2 <-array(NA, dim=c(stations))
  for(s in 1:stations){
    if (mean(TTOP_K_QTP[,s], na.rm=TRUE)<0){
      count2[s]=s  
    }
    
  }
  # select stations which less than 0
  #count1 <- count1[!is.na(count1)]
  #count2 <- count2[!is.na(count2)]
  cl1 <- length(count1[!is.na(count1)]) 
  cl2 <- length(count2[!is.na(count2)]) 
  
  # select more stations
  cl <- NA
  if (cl1 >= cl2){
    cl=count1
  } else {
    cl=count2
  }
  
  if(plot=="yes"){
    per <- data.frame(Station_Info, ifelse(Station_Info[cl,1]%in%Station_Info$SID,"Permafrost","Other"))
    names(per)[16] <- "Type"
    
    tiff("Permafrost_QTP.tif", width=700*3, height=500*3, res=300)
    q <- qmap(location=c(lon = 90, lat = 35),zoom=5, maptype='terrain', legend='topleft')
      q + geom_point(data=per, aes(x=Lon, y=Lat, colour=factor(Type)), size=2)
    dev.off()
  
  }
  
  cl <- cl[!is.na(cl)]
  #cl <- Station_Info[cl,]
  return(cl)
}