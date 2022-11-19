### The above visualization shows visualization of Total Rushing Yards by PSU player weight and position. 
###In this visualization the x-axis is labelled as player wight in punds(lbs) where as the y axis is labelled as the Total rushing yards 
### The positions are categorized by QB (red circle), RB(green triangle), WR(blue square)
### Week 12 (Data Scraping)
library(rvest)
library(dplyr)
library(readr)
library(ggplot2)
library(tidyr)

## Web Scraping
espnPSUTables <- read_html(
  x = "https://www.espn.com/college-football/team/stats/_/id/213/penn-state-nittany-lions"
)%>%
  html_elements(css = 'table')
  html_table()

psuFBRosterTable <- read_html(
  x = "https://gopsusports.com/sports/football/roster"
) %>%
  html_element(css = 'table')%>%
  html_table()
View(psuFBRosterTable)

## Data Wrangling 