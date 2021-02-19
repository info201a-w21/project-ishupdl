#find the highest in each category 
social_media <- read.csv(file = 'whatsgoodlydata_6.csv')
View(social_media)
library(dplyr)
library(ggplot2)
library(tidyr)


percent_answer <- social_media %>% 
  group_by(segment_type, answer) %>%
  filter(count == max(count)) %>%
  select(count, answer, percentage)
View(percent_answer)

chart_y <- ggplot(percent_answer, aes(x = percentage, y = count)) +
  geom_point(aes(color = factor(answer))) + 
  labs(title = "Percentage vs. Count for Response Categories")

chart_y

