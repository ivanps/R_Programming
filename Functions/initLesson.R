# Put initialization code in this file.

rm(list=ls())
suppressMessages(library(RCurl))

# Path to installed lesson
.lessonpath <- file.path(path.package("swirl"), "Courses", "R_Programming",
                         "Functions")
