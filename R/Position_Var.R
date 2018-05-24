# get the position in the data

Position_Var <- function(varName, data=QTP_ATM){
  po <- which(colnames(data)==varName)
  return(po)
}
