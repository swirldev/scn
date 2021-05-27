# coefficent of determination for d/t IV
local({
  cat("    IV_pb_for_prcwine=",summary(fit_supply)$r.squared
,"  IV_ad_for_prcwine=",summary(fit_supply_ad)$r.squared,"  IV_inc_for_prcwine=",summary(fit_supply_inc)$r.squared)
})