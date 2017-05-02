# vegetation offset: The second term (Surface_Offset) is negative, and represents the 
# reduction in MAGST due to vegetation effects in summer (vegetation offset)

Vegetation_Offset <- function(Year, AirTempName, GroundTempName, data=QTP_ATM, SID, ...){
  
  vo <- sapply(Year, function(Year) tryCatch({
    (Thawing_index(Year=Year, TempName=AirTempName, Data=Data, SID=SID)*
           (1-NT(Year=Year, AirTempName=AirTempName, GroundTempName=GroundTempName, data, SID=SID)))/365
  }, error = function ( e ) {vo <- NA}
    , warning = function ( e ) {vo <- NA}
  ), simplify=T)
  
  names(vo) <- Year
  return(vo)
}