library(yaml)
library(swirlify)

course_list <- yaml.load_file("courses.yaml")

for(i in seq_along(course_list)){
  key <- course_list[[i]]
  dir.create(file.path(".", names(course_list)[i]))
  git_clone <- paste("git clone", key$git_clone_url, file.path(".", names(course_list)[i]))
  system(git_clone)
  if(!is.null(key$subdirs)){
    courses <- file.path(".", names(course_list)[i], key$subdirs)
    for(j in courses){
      lesson <- list.files(j, recursive = TRUE, 
                           pattern = "lesson", full.names = TRUE)[1]
      set_lesson(path_to_yaml = lesson, open_lesson = FALSE, silent = TRUE)
      pack_course(export_path = ".")
    }
  } else {
    lesson <- list.files(file.path(".", names(course_list)[i]), recursive = TRUE, 
                         pattern = "lesson", full.names = TRUE)[1]
    set_lesson(path_to_yaml = lesson, open_lesson = FALSE, silent = TRUE)
    swc_path <- pack_course(export_path = ".")
  }
  unlink(file.path(".", names(course_list)[i]), recursive = TRUE, force = TRUE)
}
