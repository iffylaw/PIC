# Surface Offset is equal to the difference between the MAGST and MAAT

Surface_Offset <- function(Year, AirTempName, GroundTempName, data=QTP_ATM, SID){
  
  so <- sapply(Year, function(Year) tryCatch({
    MAAT(Year=Year, TempName=AirTempName, data, SID=SID) -
      MAGST(Year=Year, AirTempName=AirTempName, GroundTempName=GroundTempName, data, SID=SID)
  }, error = function ( e ) {so <- NA}
  , warning = function ( e ) {so <- NA}
  ), simplify=T)
  
  names(so) <- Year
  return(so)
}