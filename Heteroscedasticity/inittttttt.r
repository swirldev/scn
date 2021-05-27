# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.

      .get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

#    ols_model<-lm(expenditure~income,data=consump)
#resid1<-resid(ols_model)
#sigma_hat_sq<-sum(resid1^2)/(n-2)
#error_dep<-resid1^2/sigma_hat_sq
#BP_ols<-lm(error_dep~consump$income)
#RSS=sum((fitted(BP_ols)-mean(error_dep))^2)
#Test statstic
#(chi_cal<-sum((fitted(BP_ols)-mean(error_dep))^2/2)

 dat1<- read.csv(file.path(.get_course_path(), "Econometrics", "Heteroscedasticity", "data1.csv"))
# consumption data
consmp <- read.csv(file.path(.get_course_path(),"Econometrics", "Heteroscedasticity", "Consmp.csv"))
rownames(consmp) <- NULL
#expenditure<-consump$expenditure
#income<-consump$income

           # Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.
BP_test_hetro<-function(x=as.data.frame(x)){
n=nrow(x)
#3rd variable is expenditure, 2=income
ols_model<-lm(x[,3]~x[,2],data=x)
#
resid1<-resid(ols_model)


sigma_hat_sq<-sum(resid1^2)/(n-2)
#taking residual of the OLS as dependent
error_dep<-resid1^2/sigma_hat_sq
#to combine error_dep with the data farme
x$error_dep<-error_dep
#
BP_ols<-lm(error_dep~x[,2], data=x)
#Regresion sum of square
RSS=sum((fitted(BP_ols)-mean(x$error_dep))^2)
#Test statstic
chi_cal<-RSS/2
#Chi-square tabulated value
chi_tab<-qchisq(0.05,1,lower.tail=F)
#Comapring the test statistic with critical
if(chi_cal > chi_tab)
{
print("Reject hypothesis of constant error variance")
}
else
{
print("No evidence to reject the hypothesis of constant error variance ")
}
print(chi_cal)
print(chi_tab)
}

# write to call the function which accepts "cosump" data.
# write your code here by deleting this line. f(x)
#BP_test_hetro(consump)



#swirl_options(swirl_logging = TRUE)
