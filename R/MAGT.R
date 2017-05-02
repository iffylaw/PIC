# Computing mean annual ground temperature (MAAT)
# 15 m 

MAGT <- function(Year, AirTempName, MinTempName, MaxTempName, data=QTP_ATM, SID) {
  
  magt <- sapply(Year, function(Year) tryCatch({
    mean(SoilTemp_Diff_Depths(Year=Year, depth=15, time=24*3600, AirTempName=AirTempName, MinTempName=MinTempName,
                              MaxTempName=MaxTempName, data=data, SID=SID),na.rm=T)
  }, error = function ( e ) {magt <- NA}
    , warning = function ( e ) {magt <- NA}
  ), simplify=T)
  
  names(magt) <- Year
  return(magt)
}