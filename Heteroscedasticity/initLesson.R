# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.

      .get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}


# consumption data
consmp <- read.csv(file.path(.get_course_path(),"Econometrics", "Heteroscedasticity", "Consmp.csv"))
rownames(consmp) <- NULL
fit0 <-lm(expen ~ income, consmp)
# Sorted data based on income(x)
consmp_o<-consmp[order(consmp$income),] 

fit_gfq_n1<-lm(expen~income,consmp_o[1:8,])
fit_gfq_n2<-lm(expen~income,consmp_o[13:20,])
s1=sum(resid(fit_gfq_n1)^2)/(8-2)
s2=sum(resid(fit_gfq_n2)^2)/(8-2)

F_cal<-s2/s1
F_tab<-qf(0.05,8-2,8-2, lower.tail=FALSE)
# BP-test
res_bp<-resid(fit0)^2/(deviance(fit0)/(20-2))
fit_bp<-lm(res_bp~consmp$income)
rss=sum((fitted(fit_bp)-mean(res_bp))^2)





#=====================================
#White test
res_wt<-resid(fit0)

fit_wt<-lm(I(res_wt^2)~consmp$income+I(consmp$income^2))

Rw_2<-summary(fit_wt)$r.squared







swirl_options(swirl_logging = TRUE)
