# Plot the SeqMK
#The sequential Mann-Kendall (MK) trend test was used to statistically assess 
# whether there was a shift in trends of the climate factors and permafrost indices (Fraile, 1993). 
# The two series for MK trend test, a progressive one and a backward one, were sets up. If they cross
# each other and diverge beyond a specific threshold value and exceeding the confidence level of 95%, 
# then there is a statistically significant trend shift point.

library(pheno)

Plot_MK <- function(VarName, SID, ...){
  stations <- length(Station_Info$SID)
  MinYear <- min(Station_Info$FromYear)
  MaxYear <- max(Station_Info$ToYear)
  
  tiff(paste(VarName,"_", SID, ".tif", sep=""), width=560*r, height=435*r, res=300)
      
    plot(MinYear:MaxYear,seqMK(VarName)$prog, type="l", col="red", ylim=c(-3,3))
    lines(MinYear:MaxYear,seqMK(VarName)$retr, type="l", col="black")
    abline(1.96,0)
    abline(-1.96,0)
  
  dev.off()
}