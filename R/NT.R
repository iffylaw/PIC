# n factor for thawing

NT <- function(Year, AirTempName, GroundTempName, data=QTP_ATM, SID, ...) {
  
  nt_a <- sapply(Year, function(Year) tryCatch({
    Thawing_index(Year=Year, TempName=GroundTempName, data=data, SID=SID)
  }, error = function ( e ) {nt_a <- NA}
  , warning = function ( e ) {nt_a <- NA}
  ), simplify=T)
  
  nt_b <- sapply(Year, function(Year) tryCatch({
    Thawing_index(Year=Year, TempName=AirTempName, data=data, SID=SID)
  }, error = function ( e ) {nt_b <- NA}
  , warning = function ( e ) {nt_b <- NA}
  ), simplify=T)
  
  nt <- nt_a/nt_b
  
  names(nt) <- Year
  return(nt)
}
