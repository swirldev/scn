local({
  sigma_hat1=0.225895;sigma_hat2=1.33062;sigma_hat3=3.36302
  weight<-rep(c(sqrt(sigma_hat1),sqrt(sigma_hat2),sqrt(sigma_hat3)),c(7,7,6))
  
  fit_w1<-lm(I(expen/weight)~I(1/weight)+I(income/weight)-1,consmp_o)
  plot(consmp_o$income,fit_w1$residuals,xlab = "income(xi)",ylab = "Residuals",pch=19)
  abline(h=0,lwd=2,col="red")
})