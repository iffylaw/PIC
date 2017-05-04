# PIC (Permafrost Indices Computing)

![Alt text](https://github.com/iffylaw/PIC/blob/master/Figure/PIC_Stations.png)

At present, there are dozens of different indices are used to evaluate the characteristics and dynamics of permafrost presence or absence, including:

  - thawing/freezing degree-days of air and ground surface (DDTa/DDTs/DDFa/DDFs)
  - seasonal thawing/freezing n factor (nt/nf)
  - MAAT (mean annual air temperature)
  - MAGT (mean annual ground temperature)
  - MAGST (mean annual ground surface temperature)
  - TTOP (the temperature at the top of permafrost)
  - ALT (active layer thickness)
  - maximum freeze depth (FD)

### Examples

```sh
#
# The example of Permafrost Indices Computing (PIC) 
# Author: Lihui Luo (E-mail: luolh@lzb.ac.cn)
# Cold and Arid Regions Environmental and Engineering Research Institute, 
# Chinese Academy of Sciences
#
##########################################################################################
# Compute temperature/depth-related indices using daily weather observations
##########################################################################################

# Thawing_index: DDTa
Thawing_index(Year=1980, TempName="Temperature", data=QTP_ATM, SID=52908)
Thawing_index(Year=1980:2010, TempName="Temperature", data=QTP_ATM, SID=52908)

# Thawing_index: DDTs
Thawing_index(Year=1980, TempName="GT", data=QTP_ATM, SID=52908)
Thawing_index(Year=1980:2010, TempName="GT", data=QTP_ATM, SID=52908)

# Freezing_index: DDFa
Freezing_index(Year=1980, TempName="Temperature", data=QTP_ATM, SID=52908)
Freezing_index(Year=1980:2010, TempName="Temperature", data=QTP_ATM, SID=52908)

# Freezing_index: DDFs
Freezing_index(Year=1980, TempName="GT", data=QTP_ATM, SID=52908)
Freezing_index(Year=1980:2010, TempName="GT", data=QTP_ATM, SID=52908)

# MAAT
MAAT(Year=1980, TempName="Temperature", data=QTP_ATM, SID=52908)
MAAT(Year=1980:2010, TempName="Temperature", data=QTP_ATM, SID=52908)

# NT
NT(Year=1980, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=52908)
NT(Year=1980:2010, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=52908)

# NF
NF(Year=1980, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=52908)
NF(Year=1980:2010, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=52908)

# MAGST
MAGST(Year=1980, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=52908)
MAGST(Year=1980:2010, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=52908)

# Temp_Amp_Daily
Temp_Ampl_Daily(Year=1980, MinTempName="GT_0_MIN", MaxTempName="GT_0_MAX", data=QTP_ATM, SID=52908)
Temp_Ampl_Daily(Year=1980:2010, MinTempName="Tmin", MaxTempName="GT_0_MAX", data=QTP_ATM, SID=52908)

# Temp_Amp_Manual
Temp_Ampl_Annual(Year=1980, MinTempName="GT_0_MIN", MaxTempName="GT_0_MAX", data=QTP_ATM, SID=52908)
Temp_Ampl_Annual(Year=1980:2010, MinTempName="GT_0_MIN", MaxTempName="GT_0_MAX", data=QTP_ATM, SID=52908)

# SoilTemp_Diff_Depths:soil temperature at 15 m
SoilTemp_Diff_Depths(Year=1980, depth=15, time=3600*12, AirTempName="Temperature", MinTempName="Tmin", MaxTempName="Tmax", data=QTP_ATM, SID=52908)
SoilTemp_Diff_Depths(Year=1980:2010, depth=15, time=3600*12, AirTempName="Temperature", MinTempName="Tmin", MaxTempName="Tmax", data=QTP_ATM, SID=52908)

# MAGT
MAGT(Year=1980, AirTempName="Temperature", MinTempName="Tmin", MaxTempName="Tmax", data=QTP_ATM, SID=52908)
MAGT(Year=1980:2010, AirTempName="Temperature", MinTempName="Tmin", MaxTempName="Tmax", data=QTP_ATM, SID=52908)

#Vegetation_Offset
Vegetation_Offset(Year=1980, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=52908)
Vegetation_Offset(Year=1980:2010, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=52908)

# Surface_Offset
Surface_Offset(Year=1980, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=52908)
Surface_Offset(Year=1980:2010, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=52908

# Thermal_Offset
Thermal_Offset(Year=1980, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=52908)
Thermal_Offset(Year=1980:2010, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=52908)

# Nival_Offset
Nival_Offset(Year=1980, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=52908)
Nival_Offset(Year=1980:2010, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=52908)

# TTOP_Smith
TTOP_Smith(Year=1980, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=52908)
TTOP_Smith(Year=1980:2010, AirTempName="Temperature", GroundTempName="GT", data=QTP_ATM, SID=52908)

# TTOP_Kudryavtsev
TTOP_Kudryavtsev(Year=1980, AirTempName="Temperature", GroundTempName="GT", MinGTName="GT_0_MIN", MaxGTName="GT_0_MAX", data=QTP_ATM, SID=52908)
TTOP_Kudryavtsev(Year=1980:2010, AirTempName="Temperature", GroundTempName="GT", MinGTName="GT_0_MIN", MaxGTName="GT_0_MAX", data=QTP_ATM, SID=52908)

# Thaw_depth_Stefan
Thaw_depth_Stefan(Year=1980, AirTempName="Temperature", data=QTP_ATM, SID=52908)
Thaw_depth_Stefan(Year=1980:2010, AirTempName="Temperature", data=QTP_ATM, SID=52908)

# Freeze_depth_Stefan is for seasonal frozen soil
Freeze_depth_Stefan(Year=1980, AirTempName="Temperature", data=QTP_ATM, SID=56444)
Freeze_depth_Stefan(Year=1980:2010, AirTempName="Temperature", data=QTP_ATM, SID=56444)

# ALT_Kudryavtsev
ALT_Kudryavtsev(Year=1980, AirTempName="Temperature", GroundTempName="GT", MinGTName="GT_0_MIN", MaxGTName="GT_0_MAX", data=QTP_ATM, SID=52908)
ALT_Kudryavtsev(Year=1980:2010, AirTempName="Temperature", GroundTempName="GT", MinGTName="GT_0_MIN", MaxGTName="GT_0_MAX", data=QTP_ATM, SID=52908)

##########################################################################################
# compute and save the temperature/depth-related indices
##########################################################################################
MAAT_QTP <- Com_Indices_QTP(VarName = "MAAT")
MAGST_QTP <- Com_Indices_QTP(VarName = "MAGST")
MAGT_QTP <- Com_Indices_QTP(VarName = "MAGT")
NT_QTP <- Com_Indices_QTP(VarName = "NT")
NF_QTP <- Com_Indices_QTP(VarName = "NF")
DDTa_QTP <- Com_Indices_QTP(VarName = "Thawing_index_air")
DDTs_QTP <- Com_Indices_QTP(VarName = "Thawing_index_ground")
DDFa_QTP <- Com_Indices_QTP(VarName = "Freezing_index_air")
DDFs_QTP <- Com_Indices_QTP(VarName = "Freezing_index_ground")
VO_QTP <- Com_Indices_QTP(VarName = "Vegetation_Offset")
SO_QTP <- Com_Indices_QTP(VarName = "Surface_Offset")
TO_QTP <- Com_Indices_QTP(VarName = "Thermal_Offset")
NO_QTP <- Com_Indices_QTP(VarName = "Nival_Offset")
TTOP_S_QTP <- Com_Indices_QTP(VarName = "TTOP_Smith")
TTOP_K_QTP <- Com_Indices_QTP(VarName = "TTOP_Kudryavtsev")
ALT_S_QTP <- Com_Indices_QTP(VarName = "Thaw_depth_Stefan")
FD_S_QTP <- Com_Indices_QTP(VarName = "Freeze_depth_Stefan")
ALT_K_QTP <- Com_Indices_QTP(VarName = "ALT_Kudryavtsev")

##########################################################################################
# process the outlier values
##########################################################################################
stations <- length(Station_Info$SID)

MAAT_QTP <- Outlier_Process(MAAT_QTP[,1:stations])
MAGST_QTP <- Outlier_Process(MAGST_QTP[,1:stations])
MAGT_QTP <- Outlier_Process(MAGT_QTP[,1:stations])
NT_QTP <- Outlier_Process(NT_QTP[,1:stations])
NF_QTP <- Outlier_Process(NF_QTP[,1:stations])
DDTa_QTP <- Outlier_Process(DDTa_QTP[,1:stations])
DDTs_QTP <- Outlier_Process(DDTs_QTP[,1:stations])
DDFa_QTP <- Outlier_Process(DDFa_QTP[,1:stations])
DDFs_QTP <- Outlier_Process(DDFs_QTP[,1:stations])
VO_QTP <- Outlier_Process(VO_QTP[,1:stations])
SO_QTP <- Outlier_Process(SO_QTP[,1:stations])
TO_QTP <- Outlier_Process(TO_QTP[,1:stations])
NO_QTP <- Outlier_Process(NO_QTP[,1:stations])
TTOP_S_QTP <- Outlier_Process(TTOP_S_QTP[,1:stations])
TTOP_K_QTP <- Outlier_Process(TTOP_K_QTP[,1:stations])
ALT_S_QTP <- Outlier_Process(ALT_S_QTP[,1:stations])
FD_S_QTP <- Outlier_Process(FD_S_QTP[,1:stations])
ALT_K_QTP <- Outlier_Process(ALT_K_QTP[,1:stations])

##########################################################################################
# Save these indices to Rdata file
##########################################################################################
save(MAAT_QTP, file="I:/PIC/PIC/MAAT_QTP.Rdata")
save(MAGST_QTP, file="I:/PIC/PIC/MAGST_QTP.Rdata")
save(MAGT_QTP, file="I:/PIC/PIC/MAGT_QTP.Rdata")
save(NT_QTP, file="I:/PIC/PIC/NT_QTP.Rdata")
save(NF_QTP, file="I:/PIC/PIC/NF_QTP.Rdata")
save(DDTa_QTP, file="I:/PIC/PIC/DDTa_QTP.Rdata")
save(DDTs_QTP, file="I:/PIC/PIC/DDTs_QTP.Rdata")
save(DDFa_QTP, file="I:/PIC/PIC/DDFa_QTP.Rdata")
save(DDFs_QTP, file="I:/PIC/PIC/DDFs_QTP.Rdata")
save(VO_QTP, file="I:/PIC/PIC/VO_QTP.Rdata")
save(SO_QTP, file="I:/PIC/PIC/SO_QTP.Rdata")
save(TO_QTP, file="I:/PIC/PIC/TO_QTP.Rdata")
save(NO_QTP, file="I:/PIC/PIC/NO_QTP.Rdata")
save(TTOP_S_QTP, file="I:/PIC/PIC/TTOP_S_QTP.Rdata")
save(TTOP_K_QTP, file="I:/PIC/PIC/TTOP_K_QTP.Rdata")
save(ALT_S_QTP, file="I:/PIC/PIC/ALT_S_QTP.Rdata")
save(FD_S_QTP, file="I:/PIC/PIC/FD_S_QTP.Rdata")
save(ALT_K_QTP, file="I:/PIC/PIC/ALT_K_QTP.Rdata")

##########################################################################################
# to determine which stations may exist permafrost 
##########################################################################################
Exist_Permafrost()
Exist_Permafrost(plot="yes")

##########################################################################################
# Statistic analysis of stations 
##########################################################################################
# Single index
MAAT_QTP_Stat <- Com_Stats_QTP(ind1=MAAT_QTP)
MAGST_QTP_Stat <- Com_Stats_QTP(ind1=MAGST_QTP)
MAGT_QTP_Stat <- Com_Stats_QTP(ind1=MAGT_QTP)
NT_QTP_Stat <- Com_Stats_QTP(ind1=NT_QTP)
NF_QTP_Stat <- Com_Stats_QTP(ind1=NF_QTP)
DDTa_QTP_Stat <- Com_Stats_QTP(ind1=DDTa_QTP)
DDTs_QTP_Stat <- Com_Stats_QTP(ind1=DDTs_QTP)
DDFa_QTP_Stat <- Com_Stats_QTP(ind1=DDFa_QTP)
DDFs_QTP_Stat <- Com_Stats_QTP(ind1=DDFs_QTP)
VO_QTP_Stat <- Com_Stats_QTP(ind1=VO_QTP)
SO_QTP_Stat <- Com_Stats_QTP(ind1=SO_QTP)
TO_QTP_Stat <- Com_Stats_QTP(ind1=TO_QTP)
NO_QTP_Stat <- Com_Stats_QTP(ind1=NO_QTP)
TTOP_S_QTP_Stat <- Com_Stats_QTP(ind1=TTOP_S_QTP)
TTOP_K_QTP_Stat <- Com_Stats_QTP(ind1=TTOP_K_QTP)
ALT_S_QTP_Stat <- Com_Stats_QTP(ind1=ALT_S_QTP)
FD_S_QTP_Stat <- Com_Stats_QTP(ind1=FD_S_QTP)
ALT_K_QTP_Stat <- Com_Stats_QTP(ind1=ALT_K_QTP)

# Same two indices (TTOP & ALT)
TTOP_S_K_QTP_Stat <- Com_Stats_QTP(ind1=TTOP_S_QTP, ind2=TTOP_K_QTP)
ALT_S_K_QTP_Stat <- Com_Stats_QTP(ind1=ALT_S_QTP, ind2=ALT_K_QTP)

##########################################################################################
# Visualization of stations
##########################################################################################
# plot TTOP & ALT
Plot_TTOP_ALT(VarName="TTOP", SID="permafrost")
Plot_TTOP_ALT(VarName="TTOP", SID="all")

Plot_TTOP_ALT(VarName="ALT", SID="permafrost")
Plot_TTOP_ALT(VarName="ALT", SID="all")

# plot MAAT & MAGST & MAGT
Plot_3M(SID="permafrost")
Plot_3M(SID="all")

#-----------------------------------------------------------------------------------------
# ggplot2 MAAT & MAGST & MAGT
ggplot_pic(Type="3m", SID="all")
ggplot_Pic(Type="3m", SID="permafrost")

# ggplot2 n factor (nt & nf)
ggplot_Pic(Type="factor", SID="all")
ggplot_Pic(Type="factor", SID="permafrost")

# ggplot2 offset (Nival Offset & Surface Offset & Thermal Offset & Vegetation Offset)
ggplot_Pic(Type="offset", SID="all")
ggplot_Pic(Type="offset", SID="permafrost")

# ggplot2 Celsius degree-days (DDTa & DDTs & DDFa & DDFs)
ggplot_Pic(Type="cdd", SID="all")
ggplot_Pic(Type="cdd", SID="permafrost")

# ggplot2 TTOP using Smith & Riseborough, and Kudryavtsev function
ggplot_Pic(Type="ttop", SID="all")
ggplot_Pic(Type="ttop", SID="permafrost")

# ggplot2 ALT using Stefan & Kudryavtsev function
ggplot_Pic(Type="alt", SID="all")
ggplot_Pic(Type="alt", SID="permafrost")

# ggplot2 Freeze/Thaw Depth (ALT using Stefan & Kudryavtsev function)
ggplot_Pic(Type="depth", SID="all")
ggplot_Pic(Type="depth", SID="permafrost")

#-----------------------------------------------------------------------------------------
# ggmap: create a Gif animation
Map_Pic(VarName="MAAT")
Map_Pic(VarName="MAGST")
Map_Pic(VarName="MAGT")
Map_Pic(VarName="NF")
Map_Pic(VarName="NT")
Map_Pic(VarName="DDTa")
Map_Pic(VarName="DDTs")
Map_Pic(VarName="DDFa")
Map_Pic(VarName="DDFs")
Map_Pic(VarName="NO")
Map_Pic(VarName="SO")
Map_Pic(VarName="TO")
Map_Pic(VarName="VO")
Map_Pic(VarName="TTOP_S")
Map_Pic(VarName="TTOP_K")
Map_Pic(VarName="ALT_S")
Map_Pic(VarName="ALT_K")
#--------FD: Freeze Depth
Map_Pic(VarName="FD")

##########################################################################################
# Spatial PIC (MAAT & DDTa & DDFa & ALT & FD) 
##########################################################################################
Spatial_Pic(NetCDFName="PIC_indices.nc", StartYear=1980, EndYear=2010)

# spatial visualization
Netcdf_Multiplot(NetCDFName = "PIC_indices.nc", VarName = "MAAT")
Netcdf_Multiplot(NetCDFName = "PIC_indices.nc", VarName = "DDTa")
Netcdf_Multiplot(NetCDFName = "PIC_indices.nc", VarName = "DDFa")
Netcdf_Multiplot(NetCDFName = "PIC_indices.nc", VarName = "ALT")
Netcdf_Multiplot(NetCDFName = "PIC_indices.nc", VarName = "FD")

# spatial animation
Netcdf_Animation(NetCDFName = "PIC_indices.nc", VarName = "MAAT")
Netcdf_Animation(NetCDFName = "PIC_indices.nc", VarName = "DDTa")
Netcdf_Animation(NetCDFName = "PIC_indices.nc", VarName = "DDFa")
Netcdf_Animation(NetCDFName = "PIC_indices.nc", VarName = "ALT")
Netcdf_Animation(NetCDFName = "PIC_indices.nc", VarName = "FD")

# spatial statistic
Spatial_Stat("PIC_indices.nc","MAAT")
Spatial_Stat("PIC_indices.nc","DDTa")
Spatial_Stat("PIC_indices.nc","DDFa")
Spatial_Stat("PIC_indices.nc","ALT")
Spatial_Stat("PIC_indices.nc","FD")
```

![Alt text](https://github.com/iffylaw/PIC/blob/master/Figure/Animation/ALT_Animation.gif)
![Alt text](https://github.com/iffylaw/PIC/blob/master/Figure/MAAT_ggmap.gif)

License
----

GNU-GPL 3.0 
