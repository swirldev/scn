plot(residuals(ols_model)~consump$income,pch=19,col="blue",xlab="Income",ylab="Residuals")
abline(h=mean(residuals(ols_model)),col="red",lwd=3)