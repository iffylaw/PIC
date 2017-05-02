# statistics
library(hydroGOF)

Stat <- function(method, d1, d2){
  
  if(length(d1)>0) {
    
    # Intercept
    if (method=="intercept")  r_value <- tryCatch({coef(line(d1, d2),use.na=false)[1]}, 
                                                  error = function ( e ) {temp_amp <- NA}
                                                  , warning = function ( e ) {temp_amp <- NA}
    )
    
    # Slope
    if (method=="slope")  r_value <- tryCatch({coef(line(d1, d2),use.na=false)[2]}, 
                                              error = function ( e ) {temp_amp <- NA}
                                              , warning = function ( e ) {temp_amp <- NA}
    )
    
    # R
    if (method=="r")  r_value <- tryCatch({cor(d2, d1,use="na.or.complete")}, 
                                          error = function ( e ) {temp_amp <- NA}
                                          , warning = function ( e ) {temp_amp <- NA}
    )
    
    # Standard Deviation of d2
    if (method=="sd_s")  r_value <- tryCatch({sd(d1, na.rm=TRUE)}, 
                                             error = function ( e ) {temp_amp <- NA}
                                             , warning = function ( e ) {temp_amp <- NA}
    )
    
    # Standard Deviation of d1
    if (method=="sd_k")  r_value <- tryCatch({sd(d2, na.rm=TRUE)}, 
                                             error = function ( e ) {temp_amp <- NA}
                                             , warning = function ( e ) {temp_amp <- NA}
    )
    
    # Root Mean Square Error
    if (method=="rmse") r_value <- tryCatch({sqrt(mean((d1-d2)^2, na.rm=TRUE))}, 
                                            error = function ( e ) {temp_amp <- NA}
                                            , warning = function ( e ) {temp_amp <- NA}
    )
    
    # Normalized RMSE
    if (method=="nrmse") r_value <- tryCatch({(sqrt(mean((d1-d2)^2, na.rm=TRUE)))/(mean(d1, na.rm=T))}, 
                                             error = function ( e ) {temp_amp <- NA}
                                             , warning = function ( e ) {temp_amp <- NA}
    )
    
    # Coefficient of determination (R Squared)
    if (method=="rr") r_value <- tryCatch({summary(lm(d2 ~ d1, na.action=na.omit))[c("r.squared")]}, 
                                          error = function ( e ) {temp_amp <- NA}
                                          , warning = function ( e ) {temp_amp <- NA}
    )
    
    # Pearson's correlation coefficient
    if (method=="cor_test") r_value <- tryCatch({cor.test(d1, d2, na.action=na.omit )$p.value}, 
                                                error = function ( e ) {temp_amp <- NA}
                                                , warning = function ( e ) {temp_amp <- NA}
    )
    #cor.test(d1, d2, method="spearman")
    #cor.test(d1, d2, method="kendall")
    
    # Nash-Sutchliffe efficiency (NSE)
    if (method=="nse") r_value <- tryCatch({1- sum((d1 - d2)^2, na.rm=T)/sum((d1 - mean(d2,na.rm=T))^2, na.rm=T)}, 
                                           error = function ( e ) {temp_amp <- NA}
                                           , warning = function ( e ) {temp_amp <- NA}
    )
    
    # RMSE-observations standard deviation ratio (RSR)
    if (method=="rsr") r_value <- tryCatch({sqrt(sum((d1 - d2)^2, na.rm=T))/sqrt(sum((d1 - mean(d2, na.rm=T))^2, na.rm=T)) }, 
                                           error = function ( e ) {temp_amp <- NA}
                                           , warning = function ( e ) {temp_amp <- NA}
    )
    
    # Percent bias (PBIAS) 
    if (method=="pbias") r_value <- tryCatch({sum(d1 - d2, na.rm=T)*100/sum(d1, na.rm=T)}, 
                                             error = function ( e ) {temp_amp <- NA}
                                             , warning = function ( e ) {temp_amp <- NA}
    )
    
    # Modelling efficiency
    if (method=="mef") r_value <- tryCatch({(sum((d1-mean(d1, na.rm=T))^2, na.rm=T)-sum((d2-d1)^2, na.rm=T))/sum((d1-mean(d1, na.rm=T))^2, na.rm=T)}, 
                                           error = function ( e ) {temp_amp <- NA}
                                           , warning = function ( e ) {temp_amp <- NA}
    )
    
    # Normalized average error
    if (method=="nae") r_value <- tryCatch({(mean(d2, na.rm=T)-mean(d1, na.rm=T))/mean(d1, na.rm=T)}, 
                                           error = function ( e ) {temp_amp <- NA}
                                           , warning = function ( e ) {temp_amp <- NA}
    )
    
    # Variance Ratio
    if (method=="vr") r_value <- tryCatch({var(d2, na.rm=T)/var(d1, na.rm=T) }, 
                                          error = function ( e ) {temp_amp <- NA}
                                          , warning = function ( e ) {temp_amp <- NA}
    )
    
    # Index of Agreement 
    if (method=="d") r_value <- tryCatch({d(d2, d1, na.rm=TRUE) }, 
                                         error = function ( e ) {temp_amp <- NA}
                                         , warning = function ( e ) {temp_amp <- NA}
    )
    
  } else {
    r_value <- NA 
  }
  
  return(sprintf("%.2f", r_value))
}