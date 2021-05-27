local({
  fit_no_ac<-lm(y_transf~x_transf)
  plot(auto$year[-1],fit_no_ac$residuals,xlab = "Year",ylab = "Unstandardized Residuals",pch=19)
  abline(h=0,lwd=2,col="red")
  s<-seq(length(auto$year[-1])-1)
  arrows(auto$year[-1][s], fit_no_ac$residuals[s], auto$year[-1][s+1], fit_no_ac$residuals[s+1], col = 1:3,lwd = 1)
  
})