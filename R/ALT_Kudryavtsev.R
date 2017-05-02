# Kudryavtsev model: An alternative solution to the Stefan problem was proposed 
# by Kudryavtsev et al. (1974) for estimating maximum annual depth of thaw propagation
# and the mean annual temperature at the base of the active layer (equivalent to 
# the temperature at the top of permafrost, or TTOP)
# cot: coefficient of thermal conductivity during thawing
# cof: coefficient of thermal conductivity during freezing
# psn: period of the temperature wave, adjusted for snow melt
# vhct: volumetric heat capacity during thawing, Jm3
# vlh: volumetric latent heat of fusion, Jm$3

ALT_Kudryavtsev <- function(Year, AirTempName, GroundTempName, MinGTName, 
                            MaxGTName, data=QTP_ATM, SID){
  
  cot <- Station_Info$COT[Station_Info$SID==SID]
  cof <- Station_Info$COF[Station_Info$SID==SID] 
  psn <- Station_Info$PSN[Station_Info$SID==SID]
  vhct <- Station_Info$VHCT[Station_Info$SID==SID]
  Y <- Station_Info$Y[Station_Info$SID==SID]
  W <- Station_Info$W[Station_Info$SID==SID]
  vlh <- VLH(density = Y, soilMoisture = W)
  
  temp_amp_ann <- sapply(Year, function(Year) tryCatch({
    Temp_Ampl_Annual(Year = Year, MinTempName=MinGTName, MaxTempName=MinGTName, data = data, SID=SID)
  }, error = function ( e ) {temp_amp_ann <- NA}
  , warning = function ( e ) {temp_amp_ann <- NA}
  ), simplify=T)
  
  ttop_k <- sapply(Year, function(Year) tryCatch({
    TTOP_Kudryavtsev(Year = Year, AirTempName = AirTempName, 
                             GroundTempName = GroundTempName,MinGTName = MinGTName, 
                             MaxGTName = MaxGTName, data = data, SID=SID)
  }, error = function ( e ) {ttop_k <- NA}
    , warning = function ( e ) {ttop_k <- NA}
  ), simplify=T)
  
  az <- tryCatch({
    ((temp_amp_ann-ttop_k)/log10((temp_amp_ann+(vlh/(2*vhct)))/(abs(ttop_k)+(vlh/(2*vhct))))) - vlh/(2*vhct)
  }, error = function ( e ) {az <- NA}
    , warning = function ( e ) {az <- NA}
  )
  
  zc <- tryCatch({
    2*(temp_amp_ann-ttop_k)*sqrt(((cot+cof)/2)*psn*vhct/pi)/(2*az*vhct+vlh)
  }, error = function ( e ) {zc <- NA}
  , warning = function ( e ) {zc <- NA}
  )
  
  alt_a <- tryCatch({
    2*(temp_amp_ann-ttop_k)*sqrt(cot*psn*vhct/pi)
    }, error = function ( e ) {alt_a <- NA}
    , warning = function ( e ) {alt_a <- NA}
  )
  
  alt_b <- tryCatch({
    (2*az*vhct*zc+vlh*zc)*vlh*sqrt(((cot+cof)/2)*psn/(pi*vhct))
  }, error = function ( e ) {alt_b <- NA}
  , warning = function ( e ) {alt_b <- NA}
  )
  
  alt_c <- tryCatch({
    2*az*vhct*zc+vlh*zc+(2*az*vhct+vlh)*sqrt(((cot+cof)/2)*psn/(pi*vhct))
  }, error = function ( e ) {alt_c <- NA}
  , warning = function ( e ) {alt_c <- NA}
  )
  
  alt_d <- tryCatch({
    2*az*vhct+vlh
  }, error = function ( e ) {alt_d <- NA}
  , warning = function ( e ) {alt_d <- NA}
  )
  
  alt <- tryCatch({
    (alt_a+(alt_b/alt_c))/alt_d
  }, error = function ( e ) {alt <- NA}
    , warning = function ( e ) {alt <- NA}
  )
  
  names(alt) <- Year
  return(alt)
}
