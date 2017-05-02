# plot MAAT & MAGST & MAGT

Plot_3M <- function(SID, ...){
  stations <- length(Station_Info$SID)
  MinYear <- min(Station_Info$FromYear)
  MaxYear <- max(Station_Info$ToYear)
  
  # To determine whether the permafrost 
  MAAT_QTP <- Outlier_Process(MAAT_QTP[,1:stations])
  MAGST_QTP <- Outlier_Process(MAGST_QTP[,1:stations])
  MAGT_QTP <- Outlier_Process(MAGT_QTP[,1:stations])
  cl <- Exist_Permafrost()
  
  if (SID=="permafrost"){
    s <- cl
    r <- 8
  } else if (SID=="all"){
    s <- 1:stations
    r <- 15
  }
  else {
    s <- NA
    r <- NA
  }
  
  minm <- min(MAAT_QTP[,s], MAGST_QTP[,s], MAGT_QTP[,s], na.rm=T)
  maxm <- max(MAAT_QTP[,s], MAGST_QTP[,s], MAGT_QTP[,s], na.rm=T)
  
  tiff(paste("3M_", SID, ".tif", sep=""), width=560*r, height=435*r, res=300)
  par(mfrow=c(ceiling(sqrt(length(s))),ceiling(sqrt(length(s)))))
  
  for(ss in s){
      
      plot(MinYear:MaxYear, MAAT_QTP[,ss], type="o", ylim=c(minm, maxm), col="blue",
           xlab="Year", ylab=expression(" (" * degree * "C)"), pch=20)
      lines(MinYear:MaxYear, MAGST_QTP[,ss], type="o", col="red", pch=20)
      lines(MinYear:MaxYear, MAGT_QTP[,ss], type="o", col="green", pch=20)
      abline(line(MinYear:MaxYear, MAAT_QTP[,ss]), col="blue")
      abline(line(MinYear:MaxYear, MAGST_QTP[,ss]), col="red")
      abline(line(MinYear:MaxYear, MAGT_QTP[,ss]), col="green")
      legend("bottomleft", legend = Station_Info[ss,3], bty="n", cex = 2)
    }
    plot.new()
    legend("center", legend = c("MAAT", "MAGST", "MAGT"), col=c("blue","red", "green"), lty=1, pch=20, bty="n", cex = 2)

  dev.off()
}  
