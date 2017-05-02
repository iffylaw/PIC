# Stefan function: compute freezing and thawing depth using
# accumulated ground surface degree-day total I (either the freezing 
# index DDF or thawing index DDT);                                   
# is widely used for spatial active-layer characterisation by        
# estimating soil properties (‘edaphic parameters’) empirically,     
# using summer air temperature records and active-layer data         
# obtained from representative locations  
# Thermal conductivity conversion: 1 W·m-1·K-1 = 1 J·cm-1·s-1·℃-1 = 1 * 60 * 60 * 24 J·m-1d-1℃
# The quantity tT/86,400 defines the ‘thawing index’ DDT (°C days), a time–temperature 
# integral usually calculated by summing mean daily temperatures above 0°C.
# The n-factors are identified based on vegetation type:
# forest land, 2.30; grassland and shrub, 1.89; grassland, 1.39; mixed area
# of meadow and steppe meadow, 1.60; and no vegetation, 2.55.
# Df: Depth of Freeze (m)
# cof: Thermal conductivity of ground in frozen state (W/moC)
# L:	volumetric latent heat of fusion	(KJ/m3) 3.34*10^5 KJ/m3
# Y: Dry bulk density (kg/m3)
# W:	Soil water content in thawed state	(%)
# Wu:	Soil unfrozen water content in frozen state	(%)

Freeze_depth_Stefan <- function(Year, AirTempName, data=QTP_ATM, SID, ...){
  
  L <- 3.34*10^5
  cof <- Station_Info$COF[Station_Info$SID==SID] 
  Y <- Station_Info$Y[Station_Info$SID==SID]
  W <- Station_Info$W[Station_Info$SID==SID]/100
  Wu <- Station_Info$Wu[Station_Info$SID==SID]/100
  
  Df <- sapply(Year, function(Year) tryCatch({
    sqrt((2*cof*86400*Freezing_index(Year=Year,TempName = AirTempName, data= data, SID = SID))/
               (L*Y*(W-Wu)))
  }, error = function ( e ) {Df <- NA}
  , warning = function ( e ) {Df <- NA}
  ), simplify=T)
  
  names(Df) <- Year
  return(Df)
}