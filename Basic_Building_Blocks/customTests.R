# Get the swirl state
getState <- function(){
  # Whenever swirl is running, its callback is at the top of its call stack.
  # Swirl's state, named e, is stored in the environment of the callback.
  environment(sys.function(1))$e
}

submit_log <- function(){
  
  # Please edit the link below
  pre_fill_link <- 
 "https://docs.google.com/forms/d/e/1FAIpQLSfh9NgcrQPHAJoNNGqpneUy8IaVECBEs1bXeONI0ObhhyeXfQ/viewform?usp=pp_url&entry.92129845="
  
  temp <- tempfile()
  user <- if(is.null(getState()$user)) "No name" else getState()$user
  course <- getState()$test_course
  lesson <- getState()$test_lesson
  nrow <- getState()$row
  iptr <- getState()$iptr
  skips <- if(is.null(getState()$skips)) 0 else getState()$skips
  uresults <- paste(user, course, lesson, nrow, iptr, skips, sep=",")
  encoded_log <- base64(uresults)[[1]]
  browseURL(paste0(pre_fill_link, encoded_log))
}