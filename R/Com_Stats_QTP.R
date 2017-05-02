# computing the statistic values

Com_Stats_QTP <- function(ind1, ind2, ...){
  
  stations <- length(Station_Info$SID)
  Year <- min(Station_Info$FromYear):max(Station_Info$ToYear)
  
  if(missing(ind2)) {
    stat_name = c("intercept","slope", "r", "rr", "sd_k")
    stats=array(NA, dim=c(length(stat_name),stations))
    d1 <- Year
    d2 <- ind1
    
    for(s in 1:length(stat_name)){
      for (v in 1:stations){
        stats[s,v] <- tryCatch({
          Stat(stat_name[s], d1, d2[,v])
        }, error = function ( e ) {stats <- NA}
        , warning = function ( e ) {stats <- NA}
        )
      }
    }
    
    colnames(stats) <- Station_Info$SNameEN
    rownames(stats) <- stat_name
    
  } else  {
    stat_name = c("intercept","slope", "r", "rr", "rmse", "nrmse", "sd_s", "sd_k", "mef", "nae", "vr", "pbias", "nse", "rsr", "d" )
    stats=array(NA, dim=c(length(stat_name),stations))
    d1 <- ind1
    d2 <- ind2
    
    for(s in 1:length(stat_name)){
      for (v in 1:stations){
        stats[s,v] <- tryCatch({
          Stat(stat_name[s], d1[,v], d2[,v])
        }, error = function ( e ) {stats <- NA}
        , warning = function ( e ) {stats <- NA}
        )
      }
    }
    colnames(stats) <- Station_Info$SNameEN
    rownames(stats) <- stat_name
  }
  
  #write.csv(stats, file=paste(ind1, "_Stat.csv", sep=""), quote=FALSE)
  return(stats)
}