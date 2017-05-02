#  Computing the MAAT of QTP sites 

Com_Indices_QTP <- function(VarName){
  
  Year <- min(Station_Info$FromYear):max(Station_Info$ToYear)
  years <- max(Station_Info$ToYear)-min(Station_Info$FromYear)+1
  stations <- length(Station_Info$SID)
  s <- Station_Info$SID
  ind <- array(NA, dim=c(years,stations))
    
  if (VarName=="MAAT"||VarName=="maat"){
    ind <- sapply(s, function(s) tryCatch({
      MAAT(Year=Year, TempName="Temperature", data =QTP_ATM, SID=s)
      }, error = function ( e ) {ind <- NA}
      , warning = function ( e ) {ind <- NA}
    ), simplify=T)
    #indice[,1:stations] <- rbind(ind[[1:stations]]) 
    }
  else if (VarName=="MAGST"||VarName=="magst"){
    ind <- sapply(s, function(s) tryCatch({
      MAGST(Year=Year, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=s)
    }, error = function ( e ) {ind <- NA}
    , warning = function ( e ) {ind <- NA}
    ), simplify=T)
  }
  else if (VarName=="MAGT"||VarName=="magt"){
    ind <- sapply(s, function(s) tryCatch({
      MAGT(Year=Year, AirTempName="Temperature", MinTempName="Tmin", MaxTempName="Tmax", data=QTP_ATM, SID=s)
    }, error = function ( e ) {ind <- NA}
    , warning = function ( e ) {ind <- NA}
    ), simplify=T)
  }
  else if (VarName=="NT"||VarName=="nt"){
    ind <- sapply(s, function(s) tryCatch({
      NT(Year=Year, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=s)
    }, error = function ( e ) {ind <- NA}
    , warning = function ( e ) {ind <- NA}
    ), simplify=T)
  }
  else if (VarName=="NF"||VarName=="nf"){
    ind <- sapply(s, function(s) tryCatch({
      NF(Year=Year, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=s)
    }, error = function ( e ) {ind <- NA}
    , warning = function ( e ) {ind <- NA}
    ), simplify=T)
  }
  else if (VarName=="Thawing_index_air"||VarName=="ta"||VarName=="thawing_index_air"){
    ind <- sapply(s, function(s) tryCatch({
      Thawing_index(Year=Year, TempName="Temperature", data=QTP_ATM, SID=s)
    }, error = function ( e ) {ind <- NA}
    , warning = function ( e ) {ind <- NA}
    ), simplify=T)
  }
  else if (VarName=="Thawing_index_ground"||VarName=="tg"||VarName=="thawing_index_ground"){
    ind <- sapply(s, function(s) tryCatch({
      Thawing_index(Year=Year, TempName="GT", data=QTP_ATM, SID=s)
    }, error = function ( e ) {ind <- NA}
    , warning = function ( e ) {ind <- NA}
    ), simplify=T)
  }
  else if (VarName=="Freezing_index_air"||VarName=="fa"||VarName=="freezing_index_air"){
    ind <- sapply(s, function(s) tryCatch({
      Freezing_index(Year=Year, TempName="Temperature", data=QTP_ATM, SID=s)
    }, error = function ( e ) {ind <- NA}
    , warning = function ( e ) {ind <- NA}
    ), simplify=T)
  }
  else if (VarName=="Freezing_index_ground"||VarName=="fg"||VarName=="freezing_index_ground"){
    ind <- sapply(s, function(s) tryCatch({
      Freezing_index(Year=Year, TempName="GT", data=QTP_ATM, SID=s)
    }, error = function ( e ) {ind <- NA}
    , warning = function ( e ) {ind <- NA}
    ), simplify=T)
  }
  else if (VarName=="Vegetation_Offset"||VarName=="vo"||VarName=="vegetation_offset"){
    ind <- sapply(s, function(s) tryCatch({
      Vegetation_Offset(Year=Year, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=s)
    }, error = function ( e ) {ind <- NA}
    , warning = function ( e ) {ind <- NA}
    ), simplify=T)
  }
  else if (VarName=="Surface_Offset"||VarName=="so"||VarName=="surface_offset"){
    ind <- sapply(s, function(s) tryCatch({
      Surface_Offset(Year=Year, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=s)
    }, error = function ( e ) {ind <- NA}
    , warning = function ( e ) {ind <- NA}
    ), simplify=T)
  }
  else if (VarName=="Thermal_Offset"||VarName=="to"||VarName=="thermal_offset"){
    ind <- sapply(s, function(s) tryCatch({
      Thermal_Offset(Year=Year, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=s)
    }, error = function ( e ) {ind <- NA}
    , warning = function ( e ) {ind <- NA}
    ), simplify=T)
  }
  else if (VarName=="Nival_Offset"||VarName=="no"||VarName=="nival_offset"){
    ind <- sapply(s, function(s) tryCatch({
      Nival_Offset(Year=Year, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=s)
    }, error = function ( e ) {ind <- NA}
    , warning = function ( e ) {ind <- NA}
    ), simplify=T)
  }
  else if (VarName=="TTOP_Smith"||VarName=="ts"||VarName=="ttop_smith"){
    ind <- sapply(s, function(s) tryCatch({
      TTOP_Smith(Year=Year, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=s)
    }, error = function ( e ) {ind <- NA}
    , warning = function ( e ) {ind <- NA}
    ), simplify=T)
  }
  else if (VarName=="TTOP_Kudryavtsev"||VarName=="tk"||VarName=="ttop_k"){
    ind <- sapply(s, function(s) tryCatch({
      TTOP_Kudryavtsev(Year=Year, AirTempName="Temperature", GroundTempName="GT", MinGTName="GT_0_MIN", 
                       MaxGTName="GT_0_MAX", data=QTP_ATM, SID=s)
    }, error = function ( e ) {ind <- NA}
    , warning = function ( e ) {ind <- NA}
    ), simplify=T)
  }
  else if (VarName=="Thaw_depth_Stefan"||VarName=="tds"||VarName=="thaw_depth"||VarName=="alt_s"){
    ind <- sapply(s, function(s) tryCatch({
      Thaw_depth_Stefan(Year=Year, AirTempName="Temperature", data=QTP_ATM, SID=s)
    }, error = function ( e ) {ind <- NA}
    , warning = function ( e ) {ind <- NA}
    ), simplify=T)
  }
  else if (VarName=="Freeze_depth_Stefan"||VarName=="fds"||VarName=="freeze_depth"){
    ind <- sapply(s, function(s) tryCatch({
      Freeze_depth_Stefan(Year=Year, AirTempName="Temperature", data=QTP_ATM, SID=s)
    }, error = function ( e ) {ind <- NA}
    , warning = function ( e ) {ind <- NA}
    ), simplify=T)
  }
  else if (VarName=="ALT_Kudryavtsev"||VarName=="ak"||VarName=="alt_k"){
    ind <- sapply(s, function(s) tryCatch({
      ALT_Kudryavtsev(Year=Year, AirTempName="Temperature", GroundTempName="GT", MinGTName="GT_0_MIN", 
                      MaxGTName="GT_0_MAX", data=QTP_ATM, SID=s)
    }, error = function ( e ) {ind <- NA}
    , warning = function ( e ) {ind <- NA}
    ), simplify=T)
  }
  else { ind <- NA }
  
  colnames(ind) <- Station_Info$SNameEN
  rownames(ind) <- Year
  write.csv(ind, file=paste(VarName, "_QTP.csv", sep=""), quote=FALSE)
  
  return(ind )
}

