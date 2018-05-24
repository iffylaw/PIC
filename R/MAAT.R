# Computing mean annual air temperature (MAAT)

MAAT <- function(Year, TempName="Temperature", data=QTP_ATM, SID, ...) {
  
  maat <- sapply(Year, function(Year) tryCatch({
    (Thawing_index(Year=Year, TempName=TempName, data=data, SID=SID) - 
             Freezing_index(Year=Year, TempName=TempName, data=data, SID=SID))/365
  }, error = function ( e ) {maat <- NA}
    , warning = function ( e ) {maat <- NA}
  ), simplify=T)
  
  names(maat) <- Year
  return(maat)
}
