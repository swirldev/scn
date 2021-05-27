# Put custom tests in this file.

# Uncommenting the following line of code will disable
# auto-detection of new variables and thus prevent swirl from
# executing every command twice, which can slow things down.

# AUTO_DETECT_NEWVAR <- FALSE

# However, this means that you should detect user-created
# variables when appropriate. The answer test, creates_new_var()
# can be used for for the purpose, but it also re-evaluates the
# expression which the user entered, so care must be taken.

creates_lm_model <- function(correctExpr){
   e <- get("e", parent.frame())
   # Do what the user should have done
   eSw <- cleanEnv(e$snapshot)
   mdlSw <- eval(parse(text=correctExpr), eSw)
   # Recreate what the user has done
   eUsr <- cleanEnv(e$snapshot)
   mdlUsr <- eval(e$expr, eUsr)
   # If the correct model is named:
   if(length(ls(eSw))>0){
      # Check whether the model's name is correct
      nameGood <- sum(ls(eUsr) %in% ls(eSw)) & sum(ls(eSw) %in% ls(eUsr))
      # If not, highlight the misspelling
      if(!nameGood){
         swirl_out(paste0("You seem to have misspelled the model's name. I was expecting ", ls(eSw), 
                          " but you apparently typed ", ls(eUsr), "."))
         return(FALSE)
      } else {
         # Append the result, as a list to e$delta for progress restoration
         e$delta <- c(e$delta, as.list(eUsr))
      }
   }
   # Check for effective equality of the models
   isTRUE(all.equal(sort(as.vector(mdlUsr$coefficients)), sort(as.vector(mdlSw$coefficients)))) &
      isTRUE(all.equal(mdlUsr$fitted.values, mdlSw$fitted.values))
}

# Put custom tests in this file.


# Get the swirl state
getState <- function(){
   # Whenever swirl is running, its callback is at the top of its call stack.
   # Swirl's state, named e, is stored in the environment of the callback.
   environment(sys.function(1))$e
}

# Retrieve the log from swirl's state
getLog <- function(){
   getState()$log
}

submit_log <- function(){
   
   # Please edit the link below
   pre_fill_link <- "https://docs.google.com/forms/d/e/1FAIpQLSc29yJzXrfy1qMkbAu2lN90pAYpChtP4Sw2ZYTFeSh_feM0iQ/viewform?usp=pp_url"
   
   
   # Do not edit the code below
   if(!grepl("=$", pre_fill_link)){
      pre_fill_link <- paste0(pre_fill_link, "=")
   }
   
   p <- function(x, p, f, l = length(x)){if(l < p){x <- c(x, rep(f, p - l))};x}
   
   temp <- tempfile()
   log_ <- getLog()
   nrow_ <- max(unlist(lapply(log_, length)))
   log_tbl <- data.frame(user = rep(log_$user, nrow_),
                         course_name = rep(log_$course_name, nrow_),
                         lesson_name = rep(log_$lesson_name, nrow_),
                         question_number = p(log_$question_number, nrow_, NA),
                         correct = p(log_$correct, nrow_, NA),
                         attempt = p(log_$attempt, nrow_, NA),
                         skipped = p(log_$skipped, nrow_, NA),
                         datetime = p(log_$datetime, nrow_, NA),
                         stringsAsFactors = FALSE)
   write.csv(log_tbl, file = temp, row.names = FALSE)
   encoded_log <- base64encode(temp)
   browseURL(paste0(pre_fill_link, encoded_log))
}









# Put custom tests in this file.



test_fib <- function() {
   try({
      func <- get('fib', globalenv())
      t1 <- identical(func(1), 1)
      t2 <- identical(func(20), 6765)
      t3 <- identical(sapply(1:12, func), c(1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144))
      ok <- all(t1, t2, t3)
   }, silent = TRUE)
   exists('ok') && isTRUE(ok)
}


test_func <- function() {
   # Most of this test is wrapped within `try()` so that any error in the
   # student's implementation of `my_mean` doesn't interrupt swirl.
   try({
      # The `get` function retrieves the student's definition of `my_mean` and
      # assigns it to the variable `func`.
      func <- get('my_mean', globalenv())
      
      # The behavior of `func` is then tested by comparing it to the behavior of
      # `mean`.
      t1 <- identical(func(9), mean(9))
      t2 <- identical(func(1:10), mean(1:10))
      t3 <- identical(func(c(-5, -2, 4, 10)), mean(c(-5, -2, 4, 10)))
      ok <- all(t1, t2, t3)
   }, silent = TRUE)
   
   # This value is returned at the result of the answer test.
   exists('ok') && isTRUE(ok)
}


#############
