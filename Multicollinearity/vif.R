local({
  fit_2<-lm(x2~x3+x4)
  cat("R_2 square=",summary(fit_2)$r.squared)
})