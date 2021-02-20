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


answers <- female_response$answer
count <- female_response$count

df_x <- data.frame(count, answers)
df_x

chart_x <- ggplot(df_x, aes(x=answers, y=count, group=answers)) + 
  geom_bar(stat = "identity")+ 
  scale_fill_manual(values=c("#55DDE0", "#33658A", "#2F4858", "#F6AE2D", "#F26419", "#999999")) + 
  labs(title = "App Votes from Female Responders")
chart_x 



