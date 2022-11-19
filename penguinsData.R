#Penguin data set
##How does the ordered structure of species, island,bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g, sex, year by each penguin

##Plan
###Data set tidied :
###Load Packages (ggpplot, esquisse)
###Aim: Look at the bill length by body mass
###Geometry: Bar Chart
###Mappings: Vertical (y) - body mass (g), bill length (mm)

## Code ----
### Note you only need the library calls once per session
library(ggplot2)
data(penguins)

### Use esquisse ----
library(esquisse)
esquisse::esquisser(data = penguins, viewer = 'browser')

#### Initial Plot
ggplot(penguins) +
  aes(x = bill_length_mm, y = body_mass_g) +
  geom_point(shape = "circle", size = 1.5, colour = "#112446") +
  theme_minimal()

## Improve ---
### The default fill makes seeing the midline impossible
### The labels could use improvement and units of measure
### Perhaps a different theme might be useful
### The code could be better organized and commented

### Improved Code ----
# Create the framework and map bill length (mm) to horizontal, body mass (g) to vertical
ggplot(
  data = penguins, 
  mapping = aes(x = bill_length_mm,y = body_mass_g)
) +
  geom_point() + # Make a pointplot to show the ordered structure, no fill
  theme_bw() + #  try the black and white theme
  ylab("body mass (g)") + # improve axis label
  xlab('bill length (mm)')

## Polish ----
### The font size is a bit small
### A fill color would help make the visualization pop
### Add a title
### Add transparency 

ggplot(
  data = penguins,
  mapping = aes(x = bill_length_mm,y = body_mass_g)
) +
  geom_point(alpha = 1, color = "red") + # Make a pointplot to show the ordered structure, no fill
  theme_bw() + #  try the black and white theme
  ylab("body mass (g)") + # improve axis label
  xlab('bill length (mm)') +
  theme(
    text = element_text(size = 15) # Change the base font size
  ) +
  ggtitle("Scatter Point Plots of body mass by bill length") # Add title











