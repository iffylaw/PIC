# Thermal Offset: the thermal offset is equal to (TTOP - MAGST).Between the ground surface 
# and the top of permafrost, heat transfer by conduction varies seasonally between frozen 
# and thawed states, since the thermal conductivity of ice is four times that of water.
# cot: Thermal conductivity of ground in thawed state (W/moC)
# cof: Thermal conductivity of ground in Frozen state (W/moC)

Thermal_Offset <- function(Year, AirTempName, GroundTempName, data=QTP_ATM, SID){
  
  cot <- Station_Info$COT[Station_Info$SID==SID] 
  cof <- Station_Info$COF[Station_Info$SID==SID]
  
  to <- sapply(Year, function(Year) tryCatch({
    (NT(Year=Year, AirTempName=AirTempName, GroundTempName=GroundTempName, data, SID=SID)*
           Thawing_index(Year=Year, TempName=AirTempName, Data=Data, SID=SID)*((cot/cof)-1))/365
  }, error = function ( e ) {to <- NA}
    , warning = function ( e ) {to <- NA}
  ), simplify=T)
  
  names(to) <- Year
  return(to)
}