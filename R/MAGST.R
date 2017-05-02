# Computing mean annual ground surface temperature (MAGT)

MAGST <- function(Year, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID, ...) {
  
  magst <- sapply(Year, function(Year) tryCatch({((NT(Year=Year, AirTempName=AirTempName, GroundTempName=AirTempName, data, SID=SID) * 
                                              Thawing_index(Year=Year, TempName=GroundTempName, data, SID=SID)) 
                                           - (NF(Year=Year, AirTempName=AirTempName, GroundTempName=AirTempName, data, SID=SID) * 
                                                Freezing_index(Year=Year, TempName=GroundTempName, data, SID=SID))) /365
  }, error = function ( e ) {magst <- NA}
  , warning = function ( e ) {magst <- NA}
  ), simplify=T)
  
  names(magst) <- Year
  return(magst)
}
