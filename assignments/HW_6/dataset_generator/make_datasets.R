make_datasets <- function() { 
  require(tsibble)
  
  ## you can look into this function, if you like, but we've built it
  ## so that it picks one of a random dataset and assigns it to a 
  ## labeled dataset that is returned back into the global namespace. 
  
  model_a <- tsibble(
    date = as.Date(Sys.Date()) - 99:0,
    y    = arima.sim(model=list(order=c(0,0,0)), n=100)
  )
  model_b <- tsibble(
    date = as.Date(Sys.Date()) - 99:0,
    y    =  arima.sim(model=list(ma=1), n=100)
  )
  model_c <- tsibble(
    date = as.Date(Sys.Date()) - 99:0,
    y    = arima.sim(model=list(ar=0.9, ma=0), n=100)
  )
  model_d <- tsibble(
    date = as.Date(Sys.Date()) - 99:0,
    y    = arima.sim(model=list(ar=0, ma=2), n=100)
  )
  model_e <- tsibble(
    date = as.Date(Sys.Date()) - 99:0,
    y    = arima.sim(model=list(ar=0.9, ma=3), n=100)
  )

  model_list <- list(model_a, model_b, model_c, model_d, model_e)

  set.seed(2915) # to keep this from driving you mad.

  model_list <- sample(model_list)

  ## here we are using the <<- assignment to assign to the global scope
  ## this means that `dataset_*` will exist in the global namespace
  ## after you run the function.

  dataset_1 <<- model_list[[1]]
  dataset_2 <<- model_list[[2]]
  dataset_3 <<- model_list[[3]]
  dataset_4 <<- model_list[[4]]
  dataset_5 <<- model_list[[5]]
  }
