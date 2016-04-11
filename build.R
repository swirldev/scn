library(yaml)
library(swirlify)

ctime <- as.integer(Sys.time())
clone_dir <- file.path(tempdir(), ctime)
dir.create(clone_dir, showWarnings = FALSE)
git_clone <- paste("git clone https://github.com/swirldev/swirl_courses.git", clone_dir)
system(git_clone)

courses <- file.path(clone_dir, swirl:::make_pathname(yaml.load_file("courses.yaml")))

for(i in courses){
  # Find any lesson
  lesson <- list.files(i, recursive = TRUE, 
                       pattern = "lesson", full.names = TRUE)[1]
  set_lesson(path_to_yaml = lesson, open_lesson = FALSE, silent = TRUE)
  pack_course(export_path = ".")
}

# for(i in list.files(pattern = "swc$")){unpack_course(i, ".")}
