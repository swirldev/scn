# RSS
local({
  
  RSS<-sum((fitted(fit)-mean(elcty$Y))^2)
  print(RSS)
})