completeCases <- function(directory, id = 1:332){
  
  filenames <- list.files(directory, pattern="*.csv", full.names=TRUE)
  id_value <- c()
  nobs <- c()
  count <- 1
  for (i in id){
    
    mydata <- read.csv(file = filenames[i], header = TRUE)
    clean_array <- complete.cases(mydata)
    total <- length(clean_array[clean_array == TRUE])
    id_value[count] <- i
    nobs[count] <- total
    count <- count + 1
  }
  answer <- data.frame(id = id_value, nobs = nobs)
  return(answer)
}

ans <- completeCases("specdata", c(2, 4, 8, 10, 12))
ans

