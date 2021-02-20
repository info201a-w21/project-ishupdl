social_influence_shopping <- read.csv("WhatsgoodlyData-6.csv")
library(tidyverse)
library(lintr)
lint("Aggregate_table.R")

#create a aggregate table that shows the social media coverage among
#universities in Segment_Type column

university_social_coverage <- social_influence_shopping %>%
  group_by(Answer) %>%
  filter(Segment.Type == "University") %>%
  mutate(total_count = sum(Count)) %>%
  summarise(total_count = max(total_count)) %>%
  rename(answer = Answer) %>%
  mutate(percentage = round(total_count / sum(total_count) * 100)) %>%
  summarise(answer, total_count, percentage)
