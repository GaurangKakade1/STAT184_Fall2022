library(dplyr)
data(BabyNames)
str(BabyNames)
dataTable <- BabyNames %>%
group_by(name)%>%
summarise(votesReceived=n())
Tmp <- BabyNames %>% 
  group_by(name,year,sex) %>%
  summarise(totalBirth = sum(count))
##A
library(dcData)
data(Minneapolis2013)
nrow(Minneapolis2013)

##B
Minneapolis2013 %>% 
  group_by(Second) %>%
  summarise(votesReceived = n()) %>%
  arrange(desc(votesReceived))

###C
Minneapolis2013 %>%
  summarise(sum(First=='undervote'),
  sum(Second == 'undervote'),
  sum(Third == 'undervote'))

##D
Minneapolis2013 %>% 
  group_by(First,Second) %>%
  summarise(votesReceived = n()) %>%
  arrange(desc(votesReceived))

##E
Minneapolis2013 %>% 
  group_by(Precinct) %>%
  summarise(count = n()) %>%
  arrange(desc(count))

##  Q4
BabyNames %>%
  group_by(year) %>%
  top_n(1, count)

names_selected <- BabyNames %>%
  filter(name %in% c("Jackie", "Krishna", "Tommie", "Frankie", "Anna")) %>%
  group_by(name,year) 


ggplot(names_selected, aes(x = year, y = count, color = name)) +
  geom_line(aes(linetype=sex), size=1)
  

#Improve
### The default fill makes seeing the midline impossible
### The labels could use improvement and units of measure
### Perhaps a different theme might be useful
### The code could be better organized and commented

### Improved Code ----
# Create the framework and year to horizontal, count to vertical
library(dcData)
library(ggplot2)
ggplot(
 data = BabyNames, 
  mapping = aes(x = year,y = count)
) +
  geom_line() + # Make a line plot to show the ordered structure, no fill
  theme_bw() + #  try the black and white theme
  ylab("Count") + # improve axis label
  xlab('Year')

## Polish ----
### The font size is a bit small
### A fill color would help make the visualization pop
### Add a title
### Add transparency 

names_selected <- BabyNames %>%
  filter(name %in% c("Jackie", "Krishna", "Tommie", "Frankie", "Anna")) %>%
  group_by(name,year)
ggplot(names_selected, aes(x = year, y = count, color = name)) +
    geom_line(aes(linetype=sex), size=1)+ # Make a lineplot to show the ordered structure, no fill
  theme_bw() + #  try the black and white theme
  ylab("Count") + # improve axis label
  xlab('Year') +
  theme(
    text = element_text(size = 15) # Change the base font size
  ) +
  ggtitle("Popularity of the Family's First Names Over Time") # Add title













