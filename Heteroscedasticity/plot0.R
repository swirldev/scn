local({
  fit_l<-lm(expen~income,data=consmp)
  plot(consmp$expen,fit_l$residuals,xlab = "income(xi)",ylab = "Residuals",pch=19)
  abline(h=0,lwd=2,col="red")
})