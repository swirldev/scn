# Checking MC for demand function
local({
  fit_dem_1<-lm(consumption~predicted_PW+price_beer+income,data=win)
  print(summary(fit_dem_1))
  cat("--------------------------------\n  Variance inflation factor(VIF)\n--------------------------------\n")
  print(vif(fit_dem_1))
})