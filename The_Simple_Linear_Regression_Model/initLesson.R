# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.

.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}


# Electricity consumption data
electricity_consumption<- read.csv(file.path(.get_course_path(), "Econometrics", "The_Simple_Linear_Regression_Model", "electricity consumption.csv"))

rownames(electricity_consumption) <- NULL

# To reduce spelling error
elcty<-electricity_consumption

# To increse freedom instead of data frame
attach(electricity_consumption)
y_dev<-Y-mean(Y)
x_dev<-X-mean(X)

#############
# For local rss
fit<-lm(Y~X,data=elcty)
TSS<-sum(elcty$Y-mean(elcty$Y))^2
RSS<-sum((fitted(fit)-mean(elcty$Y))^2)
ESS<-TSS-RSS

# F-tab and cal
F_stat<-(RSS/(2-1))/(ESS/(nrow(elcty)-2))









swirl_options(swirl_logging = TRUE)
