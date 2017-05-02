# lookup the weather station ID in the QTP

getSID <- function(){
  station_ID <- unique(QTP_ATM$SID)
  return(station_ID)
}