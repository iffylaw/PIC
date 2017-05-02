# Get the station information of QTP

SID_info <- function(SID){
  position <- which(Station_Info$SID==SID)
  info <- Station_Info[position, ]
  return(info)
}