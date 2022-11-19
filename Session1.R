# A function that will tell us how high the gummy bear is above
# the ground at some number of seconds after launch
# Acel. due to [Earth] gravity: -980.665 cm/sec2
# Intial Velocity: 350cm/sec
# Intial Height:200cm

getHeight <- function(time, intVel, intHeight, grav = -980.665){
  result <- 0.5*grav*time^2 + intVel*time + intHeight
  return (result)
}
times<- seq(from =0, to = 2, by = 0.1)
plot(
  x = times,
  y = getHeight(time = times),  
  type = "l"
)

