# Computing Volumetric latent heat of fusion, J/m^2
# density: dry density of soil, kg/m^3
# W: water content of the soil in percentages, %

VLH <- function(density, soilMoisture){
  vlh <- 80*density*soilMoisture/100
  return(vlh)
}