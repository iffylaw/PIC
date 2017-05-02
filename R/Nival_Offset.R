# Nival Offset: The first term (Surface_Offset) on the right-hand-side is positive, 
# and represents the elevation of MAGST over MAAT due to the insulating effect of 
# winter snow cover (nival offset) 

Nival_Offset <- function(Year, AirTempName, GroundTempName, data=QTP_ATM, SID){
  
  no <- sapply(Year, function(Year) tryCatch({
    (Thawing_index(Year=Year, TempName=AirTempName, Data=Data, SID=SID)*
           (1-NF(Year=Year, AirTempName=AirTempName, GroundTempName=GroundTempName, data, SID=SID)))/365
  }, error = function ( e ) {no <- NA}
    , warning = function ( e ) {no <- NA}
  ), simplify=T)

  names(no) <- Year
  return(no)
}