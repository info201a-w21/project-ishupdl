setwd("~/INFO_201/project-ishupdl/project_data/data_charts")
social_media <- read.csv(file = 'whatsgoodlydata_6.csv')
View(social_media)
library(dplyr)
install.packages("ggplot2")
install.packages(reshape2)
install.packages(lintr)
library(ggplot2)

#I want to compare which social media app influences 
#shopping the most among female respondents 

female_response <- social_media %>% 
  filter(segment_description == "Female voters") %>% 
  select(segment_description, answer)
View(female_response)

chart_x <- data.frame(x = social_media)