local({
  fit_2<-lm(x2~x3+x4)
  cat("VIF(B_hat_2)=",1/(1-summary(fit_2)$r.squared))
})