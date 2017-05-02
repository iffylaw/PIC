# convert the values of MAAT & MAGST & MAGT to one column

Convert_4_ggplot <- function(ind){
  stations <- length(Station_Info$SID)
  MinYear <- min(Station_Info$FromYear)
  MaxYear <- max(Station_Info$ToYear)
  Years <- MaxYear-MinYear+1
  
  # backup a data
  ind_B <- ind
  
  dim(ind_B) <- c(Years*stations,1)
  
  colnames(ind_B)[1] <- "Index"
  
  Year <- rep(c(MinYear:MaxYear),stations)
  
  SID <- c()
  for(i in 1:stations) SID <- c(SID, rep(Station_Info[i,1],Years))
  
  SNameEN <- c()
  for(i in 1:stations) SNameEN <- c(SNameEN, rep(Station_Info[i,3],Years))
  
  ind_gg <- data.frame(ind_B, Year, SID, SNameEN)
  
  colnames(ind_gg)[2] <- "Year"
  colnames(ind_gg)[3] <- "SID"
  colnames(ind_gg)[4] <- "SNameEN"
  
  rm(ind_B)
  #M_QTP_ggplot2 <- rbind(MAAT_QTP_gg, MAGST_QTP_gg, MAGT_QTP_gg)
  #Method <- c(rep("MAAT", stations*Years),rep("MAGST",stations*Years),rep("MAGT",stations*Years))
  #M_QTP_ggplot2 <- data.frame(M_QTP_ggplot2, Method)
  
  return(ind_gg)
  
}