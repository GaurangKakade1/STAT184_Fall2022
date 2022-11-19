## ACTIVITY 7 
## Army Data Frequency Table 
library(janitor)
library(dplyr)
##Filter only marital status to Single with children
ArmyTable <- rawArmyData %>% filter(maritalStatus == 'Single with Children')

##Code the frequency table ----
ArmyRelTable <- ArmyTable %>%
  tabyl(sex,payGrade) %>% # Creates the tabyl object
  adorn_totals(where = c("row", "col") ) %>% # Adds the margins
  adorn_percentages(denominator = "all") %>% # Uses the grand total to get rel. freq
  adorn_pct_formatting(digits = 2) %>% # rounds percentages
  adorn_title(placement = "combined", row_name = "Sex", col_name = "PayGrade") # titles

## Improve the frequency table ----
### Add the numbers, with commas; make the percents inside the parentheses
### Sets the formatting of numbers ----
ArmyAbsTable <- attr(ArmyRelTable, "core") %>%
  adorn_totals(where = c("row", "col")) %>% # Extracts the counts
  mutate(
    across(where(is.numeric), format, big.mark = ",") # Formats (base R)
  )
    
### Adds the absolute frequencies to our table ----
ArmyFreqTab <- ArmyRelTable %>%
  adorn_ns(position = "front", ns = ArmyAbsTable)
# Position dictates which number comes first
  
  
## Polishing the frequency table ----
### Add a caption, add lines, bold headers, add row stripes, set text alignment
ArmyFreqTab %>%
  kable(
    caption = "Sex and PayGrade of Marital Status (Single with children)",
    booktabs = TRUE,
    align = c("l", rep("c", 6))
  ) %>%
  kableExtra::kable_styling(
    bootstrap_options = c("striped", "condensed"),
    font_size = 16
  )
  