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
import<- read.csv(file.path(.get_course_path(), "Econometrics", "Multicollinearity", "import.csv"))

rownames(import) <- NULL

# attach
attach(import)
y<-imports;x2<-GDP;x3<-stock.formation;x4<-consumption





swirl_options(swirl_logging = TRUE)
