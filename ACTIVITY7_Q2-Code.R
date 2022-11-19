## Plan ----
### Group the data by cut
### We need to focus on physical dimensions (x, y, z, depth, and table)
### We need to select appropriate statistics
#### count, minimum, first QUIN-tile, second QUIN-tile, median, third QUIN-tile, fourth QUIN-tile, maximum, arithmetic mean, and the arithmetic standard deviation.
data(diamonds)
library(dplyr)
## Code using dplyr ----
diamondsStats_y <- diamonds %>%
  group_by(cut) %>%
  select(cut,y) %>%
  summarize(
    across(
      .cols = where(is.numeric),
      .fns = list(
        min = ~min(.x, na.rm = TRUE),
        Q1 = ~quantile(.x, probs = 0.2, na.rm = TRUE),
        Q2 = ~quantile(.x, probs = 0.4, na.rm = TRUE),
        median = ~median(.x, na.rm = TRUE),
        Q3 = ~quantile(.x, probs = 0.6, na.rm = TRUE),
        Q4 = ~quantile(.x, probs = 0.8, na.rm = TRUE),
        max = ~max(.x, na.rm = TRUE),
        sam = ~mean(.x, na.rm = TRUE),
        sasd = ~sd(.x, na.rm = TRUE)
      )
    ),
    count = format(n(), big.mark = ','),
   
   
  )

colnames(diamondsStats_y) <- c('Cut','Min', 'Q1','Q2','Median','Q3', 'Q4', 'Max', 'Mean', 'Standard Deviation', 'Count')  

# Polishing the table 
diamondsStats_y %>%
  kable(
    caption = "Diamonds cut summary for the width Attribute",
    booktabs = TRUE,
    digits = 2,
    align = c("l", rep("c", 6)),
    # col.names = c("cUt", LETTERS[1:10])
  ) %>%
  kableExtra::kable_styling(
    bootstrap_options = c("striped", "condensed"),
    font_size = 16
  )
