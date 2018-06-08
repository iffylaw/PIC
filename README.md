# PIC (Permafrost Indices Computing)


----
### 0. Introduction
----

![Alt text](https://github.com/iffylaw/PIC/blob/master/Figure/PIC_Stations.png)

**Figure 1.** Map of the data location over QTP.

> **At present, there are dozens of different indices are used to evaluate the characteristics and dynamics of permafrost presence or absence, including:**

  >- thawing/freezing degree-days of air and ground surface (DDTa/DDTs/DDFa/DDFs)
  >- seasonal thawing/freezing n factor (nt/nf)
  >- MAAT (mean annual air temperature)
  >- MAGT (mean annual ground temperature)
  >- MAGST (mean annual ground surface temperature)
  >- TTOP (the temperature at the top of permafrost)
  >- ALT (active layer thickness)
  >- maximum freeze depth (FD)
  
  ![Alt text](https://github.com/iffylaw/PIC/blob/master/Figure/PIC.png)
  
 **Figure 2.** The Structure Diagram of PIC

**Table 1.** Most important user functions in the R package PIC. 

| R function                  | Description and reference                                                                                                                                                            | Unit | Equation   |
|-----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------|------------|
| **Temperature-related indices**  |
| Freezing_index              | Freezing degree-days for air and ground                                                                                                                                              | ℃    | (4,6)      |
| Thawing_index               | Thawing degree-days for air and ground                                                                                                                                               | ℃    | (3,5)      |
| MAAT                        | Mean annual air temperature                                                                                                                                                          | ℃    | (7)        |
| MAGST                       | Mean annual ground surface temperature (5 cm)                                                                                                                                        | ℃    | (8)        |
| MAGT                        | Mean annual ground  temperature (at 15 m)                                                                                                                                            | ℃    | (10)       |
| NT                          | Thawing n-factor                                                                                                                                                                     |      | (11)       |
| NF                          | Freezing n-factor                                                                                                                                                                    |      | (12)       |
| Surface_Offset              | The difference between the MAGST and MAAT                                                                                                                                            | ℃    |            |
| Thermal_Offset              | The difference between the TTOP and MAGST                                                                                                                                            | ℃    |            |
| Vegetation_Offset           | The second term (Surface_Offset) is negative, and represents the reduction in MAGST due to vegetation effects in summer (vegetation offset)                                          | ℃    |            |
| Nival_Offset                | The first term (Surface_Offset) on the right-hand-side is positive, and represents the elevation of MAGST over MAAT due to the insulating effect of winter snow cover (nival offset) | ℃    |            |
| TTOP_Smith                  | The temperature at the top of the permafrost using Smith & Riseborough function                                                                                                      | ℃    | (13)       |
| TTOP_Kudryavtsev            | The temperature at the top of the permafrost using Kudryavtsev function                                                                                                              | ℃    | (14)       |
| **Depth-related indices**     |
| Freeze_depth_Stefan         | Maximum freezing depth using Stefan function                                                                                                                                         | m    | (20)       |
| Thaw_depth_Stefan           | Active layer thickness using Stefan function                                                                                                                                         | m    | (16)       |
| ALT_Kudryavtsev             | Active layer thickness (ALT) or maximum thawing depth using Kudryavtsev function                                                                                                     | m    | (19)       |
| **Region**                  |
| Spatial_Pic                 | Spatial changes with MAAT, DDTa, DDFa and ALT                                                                                                                                        | m    | (3,4,7,16) |
| **Toolkit**                       |
| Com_Indices_QTP             | Computing all indices for all stations of the QTP                                                                                                                                    |      |            |
| Outlier_Process             | Process the abnormal value                                                                                                                                                           |      |            |
| VLH                         | Computing volumetric latent heat of fusion                                                                                                                                           | J/m3 | (2)        |
| Convert_4_ggplot            | Convert the values of TTOP & ALT to one columns                                                                                                                                      |      |            |
| Exist_Permafrost            | To determine which stations exists permafrost by TTOP values                                                                                                                         |      |            |
| **Statistic**               |
| Stat                        | Statistic functions with more 10 methods                                                                                                                                             |      | (21,22,23) |
| Spatial_Stat                | Spatial statistic method, just for spatial trend                                                                                                                                     |      | (24)       |
| Com_Stats_QTP               | Computing the statistc values for one or both of these indices                                                                                                                       |      |            |
| **Visualization**                |
| Plot_3M                     | Plot MAAT, MAGST, and MAGT for all stations or a station                                                                                                                             |      |            |
| Plot_TTOP_ALT               | Plot TTOP and ALT for all stations or a station                                                                                                                                      |      |            |
| ggplot_Pic                  | Plot multiple indices all stations or a station using ggplot2                                                                                                                        |      |            |
| Map_Pic                     | Plot multiple indices all stations or a station using ggmap                                                                                                                          |      |            |
| Netcdf_Multiplot            | Region visualization of NetCDF with multiple plots                                                                                                                                   |      |            |
| Netcdf_Animation            | Region animation of NetCDF                                                                                                                                                           |      |            |

----
### 1. Statistics
----

> **The stat function contains all statistical methods for station calculation. A spatial trend can also be computed using the Spatial_Stat function after the regional calculation.**

**Table 2.** ALT Statistic values

|           | Pishan   | Hetian   | Minfeng  | Mangya | Yutian   | Lenghu  | Tuole   | Yeniugou | Zhangye  | Qilian  | Shandan | Yongchang | Dacaidan | Delingha | Gangcha | Menyuan | Nuomuhong | Dulan   | Qiabuqia | Xining   | Wudaoliang | Xinghai | Shiquanhe | Gaize   | Bange  | Anduo  | Pulan   | Shenzha | Dangxiong | Lazi    | Rikeze  | Nimu     | Lasa    | Jiangzi | Cuona   | Longzi  | Pali    | Zaduo  | Yushu   | Maduo  | Qingshuihe | Shiqu  | Changdou | Dege    | Ganzi   | Seda   | Daofou   | Maerkang | Xinlong | Zuogong | Kangding | Deqin   |
|-----------|----------|----------|----------|--------|----------|---------|---------|----------|----------|---------|---------|-----------|----------|----------|---------|---------|-----------|---------|----------|----------|------------|---------|-----------|---------|--------|--------|---------|---------|-----------|---------|---------|----------|---------|---------|---------|---------|---------|--------|---------|--------|------------|--------|----------|---------|---------|--------|----------|----------|---------|---------|----------|---------|
| intercept | 1.84     | 1.63     | 1.73     | 4.99   | 1.30     | 2.21    | -0.55   | -1.43    | 1.96     | 3.40    | 4.85    | 2.57      | -0.33    | 2.84     | -1.41   | 0.21    | 1.72      | 2.67    | 3.48     | 1.98     | -0.10      | 1.72    | 5.77      | 3.49    | 0.03   | -0.82  | 2.75    | -0.87   | 3.70      | 2.94    | 2.19    | 1.34     | 0.57    | 2.15    | 4.02    | 2.72    | -0.99   | 0.11   | 2.68    | 0.15   | 0.40       | 0.42   | 0.68     | 4.16    | 1.52    | 1.04   | 1.84     | 0.40     | 1.68    | 3.64    | 1.75     | 2.36    |
| slope     | -0.37    | -0.42    | -0.40    | -1.57  | -0.27    | -0.47   | 0.69    | 0.97     | -0.48    | -0.94   | -1.31   | -0.73     | 0.55     | -0.74    | 1.06    | 0.35    | -0.38     | -0.77   | -1.19    | -0.46    | 0.59       | -0.41   | -2.03     | -0.95   | 0.43   | 1.09   | -0.86   | 0.94    | -1.23     | -0.97   | -0.78   | -0.28    | -0.15   | -0.84   | -1.42   | -0.87   | 1.23    | 0.36   | -0.82   | 0.32   | 0.30       | 0.32   | -0.11    | -1.43   | -0.45   | 0.08   | -0.54    | -0.07    | -0.49   | -1.23   | -0.57    | -0.91   |
| r         | -0.55    | -0.28    | -0.53    | -0.68  | -0.23    | -0.35   | 0.73    | 0.80     | -0.47    | -0.49   | -0.67   | -0.56     | 0.09     | -0.62    | 0.65    | 0.07    | -0.33     | -0.64   | -0.60    | -0.47    | 0.78       | -0.32   | -0.61     | -0.62   | 0.60   | 0.55   | -0.52   | 0.14    | -0.38     | -0.79   | -0.50   | -0.52    | -0.32   | -0.60   | -0.33   | -0.58   | 0.20    | 0.08   | -0.52   | 0.82   | 0.37       | 0.26   | -0.42    | -0.68   | -0.44   | 0.07   | -0.38    | -0.23    | -0.45   | -0.66   | -0.31    | -0.81   |
| rr        | 0.30     | 0.08     | 0.28     | 0.46   | 0.05     | 0.13    | 0.54    | 0.65     | 0.22     | 0.24    | 0.44    | 0.31      | 0.01     | 0.38     | 0.42    | 0.00    | 0.11      | 0.41    | 0.36     | 0.22     | 0.61       | 0.10    | 0.37      | 0.39    | 0.36   | 0.30   | 0.27    | 0.02    | 0.14      | 0.62    | 0.25    | 0.27     | 0.10    | 0.36    | 0.11    | 0.34    | 0.04    | 0.01   | 0.27    | 0.67   | 0.14       | 0.07   | 0.18     | 0.46    | 0.19    | 0.00   | 0.14     | 0.05     | 0.21    | 0.44    | 0.09     | 0.66    |
| rmse      | 4.03     | 3.05     | 3.32     | 1.52   | 3.46     | 2.84    | 1.24    | 1.53     | 2.40     | 1.35    | 2.55    | 2.19      | 1.52     | 2.26     | 1.26    | 1.39    | 2.30      | 1.86    | 1.60     | 2.58     | 0.60       | 1.47    | 1.27      | 1.98    | 1.14   | 0.66   | 2.12    | 1.07    | 1.65      | 2.46    | 2.04    | 3.85     | 2.69    | 1.72    | 1.21    | 2.30    | 0.67    | 1.16   | 1.82    | 0.74   | 0.56       | 0.80   | 3.07     | 2.18    | 2.35    | 0.83   | 2.57     | 3.60     | 2.58    | 2.07    | 2.37     | 2.17    |
| nrmse     | 0.94     | 0.92     | 0.91     | 0.62   | 0.92     | 0.83    | 0.55    | 0.56     | 0.82     | 0.55    | 0.80    | 0.79      | 0.58     | 0.77     | 0.50    | 0.56    | 0.79      | 0.73    | 0.69     | 0.83     | 0.50       | 0.65    | 0.55      | 0.70    | 0.56   | 0.38   | 0.81    | 0.46    | 0.68      | 0.89    | 0.86    | 0.95     | 0.95    | 0.81    | 0.55    | 0.86    | 0.47    | 0.59   | 0.74    | 0.56   | 0.41       | 0.44   | 0.91     | 0.84    | 0.88    | 0.41   | 0.89     | 0.96     | 0.90    | 0.80    | 0.90     | 0.91    |
| sd_s      | 0.09     | 0.08     | 0.08     | 0.18   | 0.07     | 0.08    | 0.11    | 0.13     | 0.06     | 0.07    | 0.08    | 0.06      | 0.11     | 0.08     | 0.10    | 0.11    | 0.08      | 0.07    | 0.08     | 0.05     | 0.09       | 0.08    | 0.11      | 0.12    | 0.12   | 0.08   | 0.08    | 0.08    | 0.08      | 0.09    | 0.06    | 0.09     | 0.10    | 0.06    | 0.08    | 0.07    | 0.04    | 0.09   | 0.10    | 0.08   | 0.09       | 0.09   | 0.09     | 0.07    | 0.08    | 0.08   | 0.07     | 0.08     | 0.07    | 0.07    | 0.06     | 0.13    |
| sd_k      | 0.06     | 0.06     | 0.06     | 0.26   | 0.05     | 0.06    | 0.08    | 0.13     | 0.07     | 0.12    | 0.12    | 0.07      | 0.11     | 0.09     | 0.11    | 0.09    | 0.08      | 0.12    | 0.13     | 0.05     | 0.06       | 0.06    | 0.26      | 0.13    | 0.08   | 0.10   | 0.14    | 0.16    | 0.17      | 0.07    | 0.07    | 0.04     | 0.03    | 0.08    | 0.21    | 0.08    | 0.05    | 0.07   | 0.12    | 0.03   | 0.05       | 0.07   | 0.06     | 0.09    | 0.08    | 0.08   | 0.08     | 0.03     | 0.07    | 0.09    | 0.08     | 0.10    |
| mef       | -1674.98 | -1209.29 | -1496.06 | -43.24 | -1952.95 | -684.35 | -122.00 | -74.20   | -1287.34 | -299.68 | -915.51 | -1227.18  | -177.31  | -651.32  | -87.25  | -143.32 | -739.12   | -648.08 | -334.96  | -2066.05 | -21.22     | -303.76 | -119.38   | -234.87 | -45.55 | -57.28 | -557.76 | -90.17  | -461.12   | -714.20 | -951.79 | -1814.19 | -613.21 | -749.58 | -188.69 | -829.40 | -113.58 | -84.98 | -271.57 | -41.15 | -17.23     | -45.91 | -1066.25 | -718.82 | -555.50 | -62.87 | -1346.71 | -1453.86 | -887.90 | -741.26 | -919.01  | -262.24 |
| nae       | -0.94    | -0.92    | -0.92    | -0.58  | -0.92    | -0.83   | -0.56   | -0.55    | -0.81    | -0.55   | -0.80   | -0.80     | -0.58    | -0.77    | -0.50   | -0.57   | -0.79     | -0.73   | -0.69    | -0.83    | -0.48      | -0.65   | -0.53     | -0.70   | -0.55  | -0.39  | -0.81   | -0.45   | -0.68     | -0.90   | -0.86   | -0.95    | -0.95   | -0.82   | -0.55   | -0.86   | -0.47   | -0.58  | -0.74   | -0.56  | -0.41      | -0.44  | -0.91    | -0.83   | -0.88   | -0.41  | -0.89    | -0.96    | -0.90   | -0.80   | -0.90    | -0.92   |
| vr        | 0.37     | 0.61     | 0.45     | 2.06   | 0.54     | 0.53    | 0.57    | 1.08     | 1.34     | 2.79    | 2.19    | 1.17      | 1.16     | 1.25     | 1.29    | 0.72    | 0.93      | 2.73    | 2.66     | 1.05     | 0.44       | 0.51    | 5.19      | 1.19    | 0.42   | 1.41   | 3.06    | 3.56    | 4.90      | 0.67    | 1.30    | 0.16     | 0.10    | 1.70    | 6.19    | 1.16    | 1.46    | 0.64   | 1.32    | 0.15   | 0.27       | 0.66   | 0.48     | 1.58    | 0.93    | 0.97   | 1.47     | 0.16     | 1.01    | 1.62    | 1.97     | 0.66    |
| pbias     | 84.66    | 80.60    | 84.64    | 36.85  | 80.30    | 41.34   | 48.72   | 29.22    | 71.16    | 46.25   | 69.99   | 73.13     | 48.28    | 68.28    | 25.55   | 50.99   | 71.51     | 65.80   | 60.21    | 71.99    | 24.80      | 56.97   | 48.67     | 62.20   | 26.86  | 33.69  | 65.07   | 24.11   | 66.30     | 78.26   | 77.76   | 89.16    | 83.87   | 69.81   | 49.16   | 70.24   | 23.08   | 28.34  | 63.17   | 25.54  | 18.96      | 26.39  | 76.16    | 61.32   | 58.43   | 22.97  | 77.74    | 62.23    | 50.46   | 72.68   | 45.96    | 79.51   |
| nse       | 0.10     | 0.12     | 0.08     | 0.31   | 0.13     | 0.50    | 0.14    | 0.47     | 0.12     | 0.15    | 0.12    | 0.09      | 0.18     | 0.11     | 0.48    | 0.11    | 0.10      | 0.09    | 0.12     | 0.13     | 0.48       | 0.13    | 0.04      | 0.11    | 0.51   | 0.15   | 0.19    | 0.45    | 0.01      | 0.13    | 0.09    | 0.06     | 0.12    | 0.14    | 0.09    | 0.18    | 0.50    | 0.51   | 0.14    | 0.54   | 0.54       | 0.40   | 0.16     | 0.26    | 0.34    | 0.43   | 0.13     | 0.35     | 0.44    | 0.09    | 0.49     | 0.14    |
| rsr       | 0.95     | 0.94     | 0.96     | 0.83   | 0.93     | 0.71    | 0.93    | 0.73     | 0.94     | 0.92    | 0.94    | 0.96      | 0.91     | 0.94     | 0.72    | 0.94    | 0.95      | 0.95    | 0.94     | 0.93     | 0.72       | 0.93    | 0.98      | 0.94    | 0.70   | 0.92   | 0.90    | 0.74    | 1.00      | 0.93    | 0.95    | 0.97     | 0.94    | 0.93    | 0.95    | 0.91    | 0.71    | 0.70   | 0.93    | 0.68   | 0.68       | 0.78   | 0.92     | 0.86    | 0.81    | 0.75   | 0.93     | 0.80     | 0.75    | 0.95    | 0.71     | 0.93    |
| d         | 0.03     | 0.04     | 0.03     | 0.14   | 0.03     | 0.04    | 0.11    | 0.13     | 0.04     | 0.07    | 0.04    | 0.04      | 0.08     | 0.05     | 0.12    | 0.10    | 0.05      | 0.05    | 0.07     | 0.03     | 0.21       | 0.07    | 0.10      | 0.08    | 0.11   | 0.15   | 0.05    | 0.10    | 0.07      | 0.05    | 0.04    | 0.03     | 0.05    | 0.05    | 0.08    | 0.04    | 0.08    | 0.10   | 0.07    | 0.16   | 0.20       | 0.15   | 0.04     | 0.04    | 0.05    | 0.12   | 0.04     | 0.03     | 0.04    | 0.05    | 0.04     | 0.08    |


----
### 2. Visualization
----

> **Station visualization can be produced by Plot_TTOP_ALT and Plot_3M. The Plot_TTOP_ALT function plots two TTOP or two ALT indices in a figure for all stations or stations with permafrost. VarName has the “TTOP” and “ALT” options, whereas SID has the “permafrost” and “all” options. The Plot_3M function draws the MAAT, MAGST, and MAGT indices. The two functions only plot these stations where permafrost exists when SID = “permafrost.”**

![Alt text](https://github.com/iffylaw/PIC/blob/master/Figure/ttop_permafrost_ggplot2.png)
**Figure 3.** TTOP visualization

![Alt text](https://github.com/iffylaw/PIC/blob/master/Figure/MAAT_ggmap.gif)

**Figure 4.** MAAT animation

![Alt text](https://github.com/iffylaw/PIC/blob/master/Figure/Animation/ALT_Animation.gif)

**Figure 5.** ALT animation

![Alt text](https://github.com/iffylaw/PIC/blob/master/Figure/4inds_Slope.png)
**Figure 6.** Spatial trend of MAAT, DDTa, DDFa and ALT.

![Alt text](https://github.com/iffylaw/PIC/blob/master/Figure/ALT_allyears.png)
**Figure 7.** Region visualization of ALT.


----
### 3. Examples
----

> **Several examples of the PIC use and application were presented here.** 

```r
#
# The example is designed to help users better use the PIC package  
# Author: Lihui Luo (E-mail: luolh@lzb.ac.cn)
# Cold and Arid Regions Environmental and Engineering Research Institute, 
# Chinese Academy of Sciences
# updated: 06/08/2018
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

----
License
----

GNU-GPL 3.0 

Cold and Arid Regions Environmental and Engineering Research Institute, Chinese Academy of Sciences

Please contact to Lihui Luo (E-mail: luolh@lzb.ac.cn)

updated: 06/08/2018
