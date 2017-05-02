# Ground temperature at any time t and depth z below a ground surface
# cof: Thermal conductivity of ground in frozen state (W/moC)
# cot: Thermal conductivity of ground in thawed state (W/moC)
# co: Thermal conductivity W/moC
# vhct: volumetric heat capacity, Jm3

SoilTemp_Diff_Depths <- function(Year, depth, time, AirTempName, MinTempName, MaxTempName, data=QTP_ATM, SID, ...){
  
  po_mean <- Position_Var(AirTempName, data)
  co <- (Station_Info$COT[Station_Info$SID==SID] + Station_Info$COF[Station_Info$SID==SID])/2
  vhct <- Station_Info$VHCT[Station_Info$SID==SID]
  
  gt <- sapply(Year, function(Year) tryCatch({
    data[,po_mean][data$Year==Year & data$SID==SID] + 
    Temp_Ampl_Daily(Year=Year, MinTempName=MinTempName, MaxTempName=MaxTempName, data=data, SID=SID)*
    exp(-depth*sqrt(pi*vhct/(co*24*3600)))*
    sin((2*pi*time/24*3600)-(depth*sqrt(pi*vhct/(co*24*3600))))
  }, error = function ( e ) {gt <- NA}
  , warning = function ( e ) {gt <- NA}
  ), simplify=T)
  
  names(gt) <- Year
  return(gt)
}