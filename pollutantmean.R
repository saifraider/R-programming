pollutantmean <- function(directory, pollutant, id = 1:332){
  
  filenames <- list.files(directory, pattern="*.csv", full.names=TRUE)
  z <- c()
  count <- 1
  for (i in id){
    
    mydata <- read.csv(file = filenames[i], header = TRUE)

    if(pollutant == "nitrate"){
      nitrate_values <- mydata[,"nitrate"]
      a <- is.na(nitrate_values)
      values <-nitrate_values[!a]
      
    }
    else{
      sulfate_values <- mydata[,"sulfate"]
      a <- is.na(sulfate_values)
      values <- sulfate_values[!a]
      
    }
    ans <- c(z,values)
    z <- ans
    
  }
  return(z)
}

ans <- pollutantmean("specdata","sulfate", 1:10)
mean(ans)
