#find the highest in each category
lint("chart_2.R")
social_media <- read.csv(file = "whatsgoodlydata_6.csv")
library(dplyr)
library(ggplot2)
library(tidyr)
library(lintr)

percent_answer <- social_media %>%
  group_by(segment_type, answer) %>%
  filter(count == max(count)) %>%
  select(count, answer, percentage)


chart_y <- ggplot(percent_answer, aes(x = percentage, y = count)) +
  geom_point(aes(color = factor(answer))) +
  labs(title = "Percentage vs. Count for Response Categories")

chart_y