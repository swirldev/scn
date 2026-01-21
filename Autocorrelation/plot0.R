local({
  fit0<-lm(invest~vsh,data=auto)
  plot(auto$year,fit0$residuals,xlab = "Year",ylab = "Unstandardized Residuals",pch=19)
  abline(h=0,lwd=2,col="red")
  s<-seq(length(auto$year)-1)
  arrows(auto$year[s], fit0$residuals[s], auto$year[s+1], fit0$residuals[s+1], col = 1:3,lwd = 1)
})