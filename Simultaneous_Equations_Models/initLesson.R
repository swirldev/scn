# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.

.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}


win<- read.csv(file.path(.get_course_path(), "Econometrics", "Simultaneous_Equations_Models", "win.csv"))
names(win)=c("year","consumption","storage_costs","price_wine","price_beer","advertising","income")
# To take log
year<-win$year
win=win[,-1]
win=log(win)
win<-cbind(year,win)

#






swirl_options(swirl_logging = TRUE)
