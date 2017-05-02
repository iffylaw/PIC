# temperature amplitude

Temp_Ampl_Daily <- function(Year, MinTempName, MaxTempName, data=QTP_ATM, SID, ...){
  
  po_min <- Position_Var(MinTempName, data)
  po_max <- Position_Var(MaxTempName, data)
  
  temp_ampl <- sapply(Year, function(Year) tryCatch({
    data[,po_max][data$Year==Year & data$SID==SID] -
    data[,po_min][data$Year==Year & data$SID==SID]
  }, error = function ( e ) {temp_amp <- NA}
  , warning = function ( e ) {temp_amp <- NA}
  ), simplify=T)
  
  names(temp_ampl) <- Year
  return(temp_ampl)
}