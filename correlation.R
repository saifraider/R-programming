correlation <- function(directory, threshold = 100, id = 1:332){
  
  filenames <- list.files(directory, pattern="*.csv", full.names=TRUE)

  count <- 1
  corr_vector <- c()
  for (i in id){
    
    mydata <- read.csv(file = filenames[i], header = TRUE)
    clean_array <- complete.cases(mydata)
    total <- length(clean_array[clean_array == TRUE])
    if(total > threshold){
      
      nitrate_values <- mydata[,"nitrate"]
      clean_nitrate <- nitrate_values[clean_array]
      
      sulfate_values <- mydata[,"sulfate"]
      clean_sulfate <- sulfate_values[clean_array]
     
      corr_vector <- c(corr_vector,cor(clean_sulfate,clean_nitrate))
      }
    }
    return(corr_vector)
    
  }

ans <- correlation("specdata", 2000)
n <- length(ans)                
cr <- correlation("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))

