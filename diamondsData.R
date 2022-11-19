#Diamond data set
##How does the ordered structure of carat, cut, colour, clarity, depth, table, price, x, y, and z vary by each diamond

##Plan
###Data set tidied :
###Load Packages (ggpplot, esquisse)
###Aim: Look at the price by carat
###Geometry: Bar Chart
###Mappings: Vertical (y) - carat, need to play with others (price, cut, colour, clarity, depth, table, x, y, and z)

## Code ----
### Note you only need the library calls once per session
library(ggplot2)
data(diamonds)

### Use esquisse ----
library(esquisse)
esquisse::esquisser(data = diamonds, viewer = 'browser')

#### Initial Plot
ggplot(diamonds) + 
  aes(x = price, y = carat) + 
  geom_point(shape = "circle", size = 1.5
, colour = "#112446") + 
  theme_minimal()

## Improve ---
### The default fill makes seeing the midline impossible
### The labels could use improvement and units of measure
### Perhaps a different theme might be useful
### The code could be better organized and commented

### Improved Code ----
# Create the framework and map carat hole to horizontal, price to vertical

ggplot(
  data = diamonds,
  mapping = aes(x = carat,y = price)
)+
  geom_point() + # Make a pointplot to show the ordered structure, no fill
  theme_bw() + #  try the black and white theme
  ylab("Price ($)") + # improve axis label
  xlab('Carat')
  
## Polish ----
### The font size is a bit small
### A fill color would help make the visualization pop
### Add a title
### Add transparency 

ggplot(
  data = diamonds,
  mapping = aes(x = carat,y = price)
) +
  geom_point(alpha = 0.1, color = "aquamarine2") + # Make a pointplot to show the ordered structure, no fill
  theme_bw() + #  try the black and white theme
  ylab("Price ($)") + # improve axis label
  xlab('Carat') +
  theme(
    text = element_text(size = 15) # Change the base font size
  ) +
  ggtitle("Scatter Point Plots of Price by Carrot") # Add title
