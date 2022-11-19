# How does the ordered structure of the heigth data vary by the family
# role of the person?

#Plan----
## Data Set,
## Load packages (ggplot2, esquisse)
## Aim: rank of height by family role
## Geometry: box plot
## Mappings: family role, height

# Code ----
library(readxl)
galtonData <- read_excel("galtonData.xlsx")
library(ggplot2)
library(esquisse)

esquisse::esquisser(data = galtonData, viewer = 'browser')

ggplot(galtonData) +
  aes(x = role, y = adjustHeight) +
  geom_boxplot(fill = "cyan3") +
  theme_grey()




ggplot(
  data = galtonData,
  mapping = aes(x = role, y = adjustHeight)
) +
  geom_boxplot(fill = '#FF8C00') +
  theme_minimal() + 
  ylab("Difference in Height from 60 inches")
