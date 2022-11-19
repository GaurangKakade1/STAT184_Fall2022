# Calculate the volume of the box 




getVolume <- function(length = 11, width = 8.5, height) {
  length_Box <- length - (2 * height)
  width_Box <- width - (2 * height)
  Area_Box <- length_Box * width_Box
  Volume_Box <- Area_Box * height
  
  
  return (Volume_Box) 
}  
height <- seq(from = 0, to = 5, by = 0.01)
plot(
  x = height,
  y = getVolume(height),  
  type = "l"
)


i <- .001
number = 0
while (getVolume(i) > number){
  number <- getVolume(i)
  i <- i + .01
}
print (i)
return 
}
getVolume(.01)
