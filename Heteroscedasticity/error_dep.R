ols_model<-lm(expenditure~income,data=consump)
resid1<-ols_model$residuals
n=20
sigma_hat_square<-sum(resid1^2)/(n-2)

error_dep<-resid1/sigma_hat_square