# Get the stopping time for the number of times we recursively need to invoke the function to get to 1
counter <<- 0
getStoppingtime <- function(n) {
  
  if(n %% 2 == 0){
    total<- n/2
    counter <<-counter+1
    
    return (getStoppingtime(total))
    
  }else if (n == 1){
    count2 <- counter
    counter <<- 0
    return (count2)
    
    
    return (getStoppingtime(total))
    
  }else {
    total <- (3*n) + 1
    counter <<- counter + 1
    return (getStoppingtime(total))
  }
  
  
}
getStoppingtime(4918)

histogram1 <- Vectorize(FUN = getStoppingtime)
out <- histogram1(c(10,20,30,40,50,60,70,80,90,100))
hist(out)