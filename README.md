Welcome to the Swirl Course Network. For more information please visit http://swirlstats.com/scn/.

In order to add your course to the SCN:

1. Create an .swc file for your course using the `swirlify::pack_course()` function. 
2. Fork https://github.com/swirldev/scn on GitHub.
3. Add the .swc file to your fork.
4. Add an Rmd file to your fork like this one. You can include a description of your course, authors, a course website, and how to install your course.
5. Add your course to the lists in both the `title.Rmd` and `surname.Rmd` files.
6. Run `rmarkdown::render_site()` when your current directory is set to your fork.
7. Add, commit, and push your changes to GitHub, then send us a Pull Request.
8. After adding your course to the SCN students will be able to install your course using `install_course("[Name of Your Course]")` in swirl.
