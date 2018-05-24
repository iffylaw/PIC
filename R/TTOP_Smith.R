# TTOP: refers to the temperature at the top of the permafrost or at the bottom of the seasonally frozen layer.
# Smith, M.W. and Riseborough, D.W., 2002. Climate and the limits of permafrost: A zonal analysis. 
# Permafrost and Periglacial Processes, 13(1): 1-15.
# cot: coefficient of thermal conductivity during thawing
# cof: coefficient of thermal conductivity during freezing

TTOP_Smith <- function(Year, AirTempName, GroundTempName, data=QTP_ATM, SID, ...) {
  
  cot <- Station_Info$COT[Station_Info$SID==SID] 
  cof <- Station_Info$COF[Station_Info$SID==SID]
  
  ttop_a <- sapply(Year, function(Year) tryCatch({
    (cot*NT(Year=Year, AirTempName=AirTempName, GroundTempName=GroundTempName, data, SID=SID)*
              Thawing_index(Year=Year, TempName=AirTempName, data=data, SID=SID)) 
  }, error = function ( e ) {ttop_a <- NA}
  , warning = function ( e ) {ttop_a <- NA}
  ), simplify=T)

  ttop_b <- sapply(Year, function(Year) tryCatch({
    (cof*NF(Year=Year, AirTempName=AirTempName, GroundTempName=GroundTempName, data, SID=SID)*
       Freezing_index(Year=Year, TempName=AirTempName, data=data, SID=SID))
  }, error = function ( e ) {ttop_b <- NA}
    , warning = function ( e ) {ttop_b <- NA}
  ), simplify=T)

  ttop <- (ttop_a - ttop_b)/(cof*365)
  
  names(ttop) <- Year
  return(ttop)
} 

