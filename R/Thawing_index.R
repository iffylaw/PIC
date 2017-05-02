# Computing thawing index
# if input air temperature variablename: Thawing degree-days of air (Celsius degree-days)
# if input ground temperature variablename: Thawing degree-days of ground surface (Celsius degree-days)

Thawing_index <- function(Year, TempName, data=QTP_ATM, SID, ...) {
  
  ti <- sapply(Year, function(Year) tryCatch({
    abs(tapply(data[TempName][data[TempName] > 0 & data$Year==Year & data$SID==SID], 
                     data$Year[data[TempName] > 0 & data$Year==Year & data$SID==SID], sum, na.rm=T))
  }, error = function ( e ) {ti <- NA}
  , warning = function ( e ) {ti <- NA}
  ), simplify=T)
  
  idx <- !(sapply(ti, length))
  ti[idx] <- NA
  ti <- unlist(ti)
  
  names(ti) <- Year
  return(ti)
}
