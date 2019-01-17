# Put initialization code in this file. The variables you create
# here will show up in the user's workspace when he or she begins
# the lesson.

rm(list=ls())
suppressMessages(library(RCurl))

# Path to installed lesson
.lessonpath <- file.path(path.package("swirl"), "Courses", "R_Programming",
                         "Matrices_and_Data_Frames")
