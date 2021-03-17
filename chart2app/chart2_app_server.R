library(shiny)
library(ggplot2)
library(shiny)
library(ggplot2)
library(maps)
library(mapproj)
library(patchwork)
library(dplyr)
library(ggplot2)
library(tidyverse)
library(knitr)
library(lintr)



social_media <- read.csv(file = 'whatsgoodlydata_6.csv')
library(dplyr)
library(ggplot2)
library(tidyr)


percent_answer <- social_media %>% 
  group_by(segment_type, answer) %>% 
  filter(count == max(count))

percent_segment_1 <- percent_answer %>% 
  group_by(segment_type) %>% 
  pull(segment_type)
percent_segment <- unique(percent_segment)
count_answer_facebook <- percent_answer %>% 
  filter(answer == "Facebook") %>% 
  pull(count)

count_answer_twitter <- percent_answer %>% 
  filter(answer == "Twitter") %>% 
  pull(count)


count_answer_snapchat <- percent_answer %>% 
  filter(answer == "Snapchat") %>% 
  pull(count)

count_answer_none <- percent_answer %>% 
  filter(answer == "None") %>% 
  pull(count)



percent_answer_facebook <- percent_answer %>% 
  filter(answer == "Facebook") %>% 
  pull(percentage)

percent_answer_twitter <- percent_answer %>% 
  filter(answer == "Twitter") %>% 
  pull(percentage)



percent_answer_snapchat <- percent_answer %>% 
  filter(answer == "Snapchat") %>% 
  pull(percentage)

percent_answer_none <- percent_answer %>% 
  filter(answer == "None") %>% 
  pull(percentage)


percent_segment
percent_answer_facebook
percent_answer_twitter

percent_answer_snapchat
percent_answer_none



facebook <- data.frame(percent_segment, percent_answer_facebook, count_answer_facebook)

twitter <- data.frame(percent_segment, percent_answer_twitter, count_answer_twitter)
  
snapchat <- data.frame(percent_segment, percent_answer_snapchat, count_answer_snapchat)

none <- data.frame(percent_segment, percent_answer_none, count_answer_none)

percent_total <- data.frame(percent_segment, facebook, twitter, snapchat, none)

facebook_graph <- ggplot(facebook, aes(x = percent_answer_facebook, y = count_answer_facebook)) + 
  geom_point(aes(color = factor(percent_segment))) + 
  labs(title = "Count vs. Voting Rate", y = "Count", x = "Vote Rate", color = "Segment Type")

snapchat_graph <- ggplot(snapchat, aes(x = percent_answer_snapchat, y = count_answer_snapchat)) + 
  geom_point(aes(color = factor(percent_segment))) + 
  labs(title = "Count vs. Voting Rate", y = "Count", x = "Vote Rate", color = "Segment Type")

twitter_graph <- ggplot(twitter, aes(x = percent_answer_twitter, y = count_answer_twitter)) + 
  geom_point(aes(color = factor(percent_segment))) + 
  labs(title = "Count vs. Voting Rate", y = "Count", x = "Vote Rate", color = "Segment Type")

none_graph <- ggplot(none, aes(x = percent_answer_none, y = count_answer_none)) +
  geom_point(aes(color = factor(percent_segment))) + 
  labs(title = "Count vs. Voting Rate", y = "Count", x = "Vote Rate", color = "Segment Type")




server <- function(input, output) {
  
output$graph <- renderPlotly({
#      ggplot(percent_total) + 
#      geom_point(aes_string(x = input$xaxis, y = input$yaxis, color = factor(percent_segment)),
#                 size = input$size)
      
      if (input$axiscode == "facebook_graph") {facebook_graph}
      else if (input$axiscode == "snapchat_graph") {snapchat_graph}
      else if (input$axiscode == "twitter_graph") {twitter_graph}
      else {none_graph}
})         
}
