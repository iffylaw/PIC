# computing Freezing index
# if input air temperature variablename: Freezing degree-days of air (Celsius degree-days) 
# if input ground temperature variablename: Freezing degree-days of ground surface (Celsius degree-days)

Freezing_index <- function(Year, TempName, data=QTP_ATM, SID, ...) {
  
  fi <- sapply(Year, function(Year) tryCatch({
    abs(tapply(data[TempName][data[TempName] <= 0 & data$Year==Year & data$SID==SID], 
               data$Year[data[TempName] <= 0 & data$Year==Year & data$SID==SID], sum, na.rm=T))
  }, error = function ( e ) {fi <- NA}
    , warning = function ( e ) {fi <- NA}
  ), simplify=T)
  
  idx <- !(sapply(fi, length))
  fi[idx] <- NA
  fi <- unlist(fi)
  
  names(fi) <- Year
  return(fi)
}
