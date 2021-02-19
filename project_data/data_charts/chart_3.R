social_media <- read.csv(file = 'whatsgoodlydata_6.csv')
View(social_media)
library(dplyr)
library(ggplot2)
library(tidyr)

uw_response <- social_media %>% 
  filter(segment_description == "University of Washington") %>% 
  select(count, answer)
View(uw_response)


pie = ggplot(uw_response, aes(x="", y=count, fill=answer)) + geom_bar(stat="identity", width=1)

pie = pie + coord_polar("y", start=0) + geom_text(aes(label = paste0(round(count), "%")), position = position_stack(vjust = 0.5))


pie = pie + scale_fill_manual(values=c("#55DDE0", "#33658A", "#2F4858", "#F6AE2D", "#F26419", "#999999")) 


pie = pie + labs(x = NULL, y = NULL, fill = NULL, title = "University of Washington Social Media Usage")


pie = pie + theme_classic() + theme(axis.line = element_blank(),
                                    axis.text = element_blank(),
                                    axis.ticks = element_blank(),
                                    plot.title = element_text(hjust = 0.7, color = "#666666"))
chart_z <- pie
chart_z
