library(ggplot2)

ggplot_Pic <- function(Type, SID, ...){ 
  stations <- length(Station_Info$SID)
  MinYear <- min(Station_Info$FromYear)
  MaxYear <- max(Station_Info$ToYear)
  Years <- MaxYear-MinYear+1
  
  # Convert the data to a column
  if(Type=="3m"||Type=="3M"){
    M1 <- Convert_4_ggplot(ind=MAAT_QTP)
    M2 <- Convert_4_ggplot(ind=MAGST_QTP)
    M3 <- Convert_4_ggplot(ind=MAGT_QTP)
    t_gg <- rbind(M1, M2, M3)
    Indices <- c(rep("MAAT", stations*Years),rep("MAGST",stations*Years),rep("MAGT",stations*Years))
    t_gg <- data.frame(t_gg, Indices)
  }
  else if(Type=="factor"||Type=="Factor"){
    M1 <- Convert_4_ggplot(ind=NT_QTP)
    M2 <- Convert_4_ggplot(ind=NF_QTP)
    t_gg <- rbind(M1, M2)
    Indices <- c(rep("NT", stations*Years),rep("NF",stations*Years))
    t_gg <- data.frame(t_gg, Indices)
  }
  else if(Type=="cdd"||Type=="degree-days"){
    M1 <- Convert_4_ggplot(ind=DDTa_QTP)
    M2 <- Convert_4_ggplot(ind=DDTs_QTP)
    M3 <- Convert_4_ggplot(ind=DDFa_QTP)
    M4 <- Convert_4_ggplot(ind=DDFs_QTP)
    t_gg <- rbind(M1, M2, M3, M4)
    Indices <- c(rep("DDTa", stations*Years),rep("DDTs",stations*Years), rep("DDFa",stations*Years), rep("DDFs",stations*Years))
    t_gg <- data.frame(t_gg, Indices)
  }
  else if(Type=="ttop"||Type=="TTOP"){
    M1 <- Convert_4_ggplot(ind=TTOP_S_QTP)
    M2 <- Convert_4_ggplot(ind=TTOP_K_QTP)
    t_gg <- rbind(M1, M2)
    Indices <- c(rep("TTOP (Smith & Riseborough)", stations*Years),rep("TTOP (Kudryavtsev)",stations*Years))
    t_gg <- data.frame(t_gg, Indices)
  }
  else if(Type=="alt"||Type=="ALT"){
    M1 <- Convert_4_ggplot(ind=ALT_S_QTP)
    M2 <- Convert_4_ggplot(ind=ALT_K_QTP)
    t_gg <- rbind(M1, M2)
    Indices <- c(rep("ALT (Stefan)", stations*Years),rep("ALT (Kudryavtsev)",stations*Years))
    t_gg <- data.frame(t_gg, Indices)
  }
  else if(Type=="depth"||Type=="Depth"){
    M1 <- Convert_4_ggplot(ind=ALT_S_QTP)
    M2 <- Convert_4_ggplot(ind=ALT_K_QTP)
    M3 <- Convert_4_ggplot(ind=FD_S_QTP)
    t_gg <- rbind(M1, M2, M3)
    Indices <- c(rep("ALT (Stefan)", stations*Years),rep("ALT (Kudryavtsev)",stations*Years), rep("Freeze Depth (Stefan)",stations*Years))
    t_gg <- data.frame(t_gg, Indices)
  }
  else if(Type=="offset"||Type=="Offset"){
    M1 <- Convert_4_ggplot(ind=NO_QTP)
    M2 <- Convert_4_ggplot(ind=SO_QTP)
    M3 <- Convert_4_ggplot(ind=TO_QTP)
    M4 <- Convert_4_ggplot(ind=VO_QTP)
    t_gg <- rbind(M1, M2, M3, M4)
    Indices <- c(rep("Nival Offset", stations*Years),rep("Surface Offset",stations*Years), 
                rep("Thermal Offset",stations*Years), rep("Vegetation Offset",stations*Years))
    t_gg <- data.frame(t_gg, Indices)
  }
  else {
    t_gg <- NA
  }
  
  # To determine whether the permafrost 
  cl <- Exist_Permafrost()
  
  # Get all data from Exist_Permafrost
  t_Permafrost <- t_gg[which(t_gg$SID %in% Station_Info[cl,1]),]
    
  if(SID=="Permafrost"||SID=="permafrost") t <- t_Permafrost; re <- length(cl)/2
  if(SID=="all"||SID=="ALL") t <- t_gg; re <- stations/6
  
  tiff(paste(Type,"_",SID,"_ggplot2.tif", sep=""), width=300*re, height=200*re, res=300)
  
  P1 <- ggplot(t, aes(x=Year, y=Index, colour=Indices)) + 
    geom_line(size=0.5) +
    geom_point(size=0.5) +
    geom_smooth(aes(x=Year, y=Index), method=loess, size=0.1) +
    facet_wrap( ~ SNameEN, ncol=length(re)/2) +
    theme(axis.text.x = element_text(angle=90, vjust=0.5)) +
    theme(legend.position="top") +
    xlab("Year") +
    ylab(Type) 
    
  print(P1)
  dev.off()
  
  }
  