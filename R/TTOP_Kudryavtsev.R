# Kudryavtsev model: An alternative solution to the Stefan problem was proposed 
# by Kudryavtsev et al. (1974) for estimating maximum annual depth of thaw propagation
# and the mean annual temperature at the base of the active layer (equivalent to 
# the temperature at the top of permafrost, or TTOP)
# TTOP: refers to the temperature at the top of the permafrost or at the bottom of the seasonally frozen layer.
# cot: coefficient of thermal conductivity during thawing
# cof: coefficient of thermal conductivity during freezing

TTOP_Kudryavtsev <- function(Year, AirTempName, GroundTempName, MinGTName, MaxGTName, data=QTP_ATM, SID){
  
  cot <- Station_Info$COT[Station_Info$SID==SID] 
  cof <- Station_Info$COF[Station_Info$SID==SID]
  
  magst <- sapply(Year, function(Year) tryCatch({
    MAGST(Year = Year, AirTempName = AirTempName, GroundTempName = GroundTempName, data = data, SID=SID)
  }, error = function ( e ) {magst<- NA}
  , warning = function ( e ) {magst<- NA}
  ), simplify=T)
  
  temp_amp_ann <- sapply(Year, function(Year) tryCatch({
    Temp_Ampl_Annual(Year = Year, MinTempName=MinGTName, MaxTempName=MinGTName, data = data, SID=SID)
  }, error = function ( e ) {temp_amp_ann<- NA}
  , warning = function ( e ) {temp_amp_ann<- NA}
  ), simplify=T)
  
  ttop_numerator <- tryCatch({
    (0.5*magst*(cot+cof))+(temp_amp_ann*(cot-cof)/pi)*
    ((magst*asin(magst/temp_amp_ann)/temp_amp_ann)+sqrt(1-(magst^2/temp_amp_ann^2)))
  }, error = function ( e ) {ttop_numerator<- NA}
   , warning = function ( e ) {ttop_numerator<- NA}
  )
  
  ttop <- ifelse (ttop_numerator < 0, ttop_numerator/cof, ttop_numerator/cot)
  
  names(ttop) <- Year
  return(ttop)
}
