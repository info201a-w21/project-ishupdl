social_influence_shopping <- read.csv("WhatsgoodlyData_6.csv")
library(tidyverse)
library(lintr)
lint("Aggregate_table.R")

#create a aggregate table that shows the social media coverage among
#universities in Segment_Type column

university_social_coverage <- social_influence_shopping %>%
  group_by(answer) %>%
  filter(segment_type == "University") %>%
  mutate(total_count = sum(count)) %>%
  summarise(total_count = max(total_count)) %>%
  mutate(percentage = round(total_count / sum(total_count) * 100)) %>%
  summarise(answer, total_count, percentage)
