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
  select(count, answer)
View(female_response)

answers <- female_response$answer
count <- female_response$count

df_x <- data.frame(count, answers)
df_x

chart_x <- ggplot(df_x, aes(x=answers, y=count, group=answers)) + 
  geom_bar(stat = "identity")+ 
  scale_color_manual(values = c("red", "grey"))
chart_x 


