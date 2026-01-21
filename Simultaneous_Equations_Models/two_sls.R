# @SLS method for supply equation
local({
  
  fit2_sup<-lm(consumption~pw2sls_predicted+storage_costs,data=win)
  print(summary(fit2_sup))

})