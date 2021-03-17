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


option_box_1 <- sidebarPanel(
selectInput(
  inputId = "axiscode",
  label = "Pick a Count",
  choices = list("Facebook Count" = "facebook_graph",
                 "Snapchat Count" = "snapchat_graph",
                 "Twitter Count" = "twitter_graph",
                 "None Count" = "none_graph"),
)
) 



main_graph <- mainPanel(
  plotlyOutput("graph"),
  p("This graph represents the number of people that stated their preferred social media for 
    shopping in each segment type and compared to the overall percentage of votes the social media got in each segment type
    (eg. facebook in the university segment type earned 150 votes but only 35 percent of the total vote in the University category)")
  
)

page_1 <- tabPanel(
  "Chart 2",
  titlePanel("Student Answers"),
  sidebarLayout(
    option_box_1,
    main_graph
  )
)

ui <- navbarPage(
  "Count vs.Percentage",
  page_1
)
