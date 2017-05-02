# temperature amplitude

Temp_Ampl_Annual <- function(Year, MinTempName, MaxTempName, data=QTP_ATM, SID, ...){
  
  po_min <- Position_Var(MinTempName, data)
  po_max <- Position_Var(MaxTempName, data)
  
  temp_ampl_a <- sapply(Year, function(Year) tryCatch({
    (tapply(data[,po_max][data$Year==Year & data$SID==SID], data$Year[data$Year==Year & data$SID==SID], max, na.rm=T) -
      tapply(data[,po_min][data$Year==Year & data$SID==SID], data$Year[data$Year==Year & data$SID==SID], min, na.rm=T))/2
  }, error = function ( e ) {temp_ampl_a <- NA}
  , warning = function ( e ) {temp_ampl_a <- NA}
  ), simplify=T)
  
  temp_ampl_a <- as.numeric(temp_ampl_a)
  names(temp_ampl_a) <- Year
  return(temp_ampl_a)
}