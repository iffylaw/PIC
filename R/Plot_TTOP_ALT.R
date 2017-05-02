# plot TTOP & ALT
#library(ggplot2)
#library(gridExtra)

Plot_TTOP_ALT <- function(VarName, SID, ...){
  stations <- length(Station_Info$SID)
  MinYear <- min(Station_Info$FromYear)
  MaxYear <- max(Station_Info$ToYear)
  
  # To determine whether the permafrost 
  cl <- Exist_Permafrost()
  
  if (SID=="permafrost"){
    s <- cl
    r <- 8
  } else if (SID=="all"){
    s <- 1:stations
    r <- 12
  }
  else {
    s <- NA
    r <- NA
  }
  
  mint <- min(TTOP_S_QTP[,s], TTOP_K_QTP[,s], na.rm=T)
  maxt <- max(TTOP_S_QTP[,s], TTOP_K_QTP[,s], na.rm=T)
  
  mina <- min(ALT_S_QTP[,s], ALT_K_QTP[,s], na.rm=T)
  maxa <- max(ALT_S_QTP[,s], ALT_K_QTP[,s], na.rm=T)
  
  tiff(paste(VarName,"_", SID, ".tif", sep=""), width=560*r, height=435*r, res=300)
  par(mfrow=c(ceiling(sqrt(length(s))),ceiling(sqrt(length(s)))))
  
  if (VarName=="TTOP"||VarName=="ttop") {
  
    
    
    for(ss in s){
      
      plot(MinYear:MaxYear, TTOP_S_QTP[,ss], type="o", ylim=c(mint, maxt), col="blue",
           xlab="Year", ylab=expression("TTOP (" * degree * "C)"), pch=20)
      lines(MinYear:MaxYear, TTOP_K_QTP[,ss], type="o", col="red", pch=20)
      abline(line(MinYear:MaxYear, TTOP_S_QTP[,ss]), col="blue")
      abline(line(MinYear:MaxYear, TTOP_K_QTP[,ss]), col="red")
      abline(h=0, col="grey")
      legend("bottomleft", legend = Station_Info[ss,3], bty="n", cex = 2)
    }
    plot.new()
    legend("center", legend = c("Smith & Riseborough","Kudryavtsev"), col=c("blue","red"), lty=1, pch=20, bty="n", cex = 2)
  }
  
  if (VarName=="ALT"||VarName=="alt") {
    
    for(ss in s){
      
      plot(MinYear:MaxYear, ALT_S_QTP[,ss], type="o", ylim=c(0, maxa), col="blue",
           xlab="Year", ylab="ALT (m)", pch=20)
      lines(MinYear:MaxYear, ALT_K_QTP[,ss], type="o", col="red", pch=20)
      abline(line(MinYear:MaxYear, ALT_S_QTP[,ss]), col="blue")
      abline(line(MinYear:MaxYear, ALT_K_QTP[,ss]), col="red")
      abline(h=0, col="grey")
      legend("bottomleft", legend = Station_Info[ss,3], bty="n", cex = 2)
    }
    plot.new()
    legend("center", legend = c("Stefan","Kudryavtsev"), col=c("blue","red"), lty=1, pch=20, bty="n", cex = 2)
    
  }
  dev.off()
}