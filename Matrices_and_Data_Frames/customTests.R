 # Returns TRUE if the user has calculated a value equal to that calculated by the given expression.
 calculates_same_value <- function(expr){
   e <- get("e", parent.frame())
   # Calculate what the user should have done.
   eSnap <- cleanEnv(e$snapshot)
   val <- eval(parse(text=expr), eSnap)
   passed <- isTRUE(all.equal(val, e$val))
   if(!passed)e$delta <- list()
   return(passed)
 }

# Get the swirl state
getState <- function(){
  # Whenever swirl is running, its callback is at the top of its call stack.
  # Swirl's state, named e, is stored in the environment of the callback.
  environment(sys.function(1))$e
}

# Get the value which a user either entered directly or was computed
# by the command he or she entered.
getVal <- function(){
  getState()$val
}

# Get the last expression which the user entered at the R console.
getExpr <- function(){
  getState()$expr
}

submit_log <- function(){
  
  # Please edit the link below
  pre_fill_link <- 
    "https://docs.google.com/forms/d/e/1FAIpQLSfh9NgcrQPHAJoNNGqpneUy8IaVECBEs1bXeONI0ObhhyeXfQ/viewform?usp=pp_url&entry.92129845="
  
  sid <- readline("What is your student ID (matricula)?")
  course <- attr(getState()$les, "course_name")
  lesson <- attr(getState()$les, "lesson_name")
  skips <- if(is.null(getState()$skips)) 0 else getState()$skips
  uresults <- paste(sid, course, lesson, skips, sep=",")
  encoded_log <- base64(uresults)[[1]]
  browseURL(paste0(pre_fill_link, encoded_log))
}