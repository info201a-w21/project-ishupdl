library(shiny)
library(plotly)
library(ggplot2)
library(tidyverse)
library(lintr)
library(dplyr)

social_media <-
  read.csv("https://query.data.world/s/i344nffn6szjcalidkb6zaw76zkjvx",
               header = TRUE, stringsAsFactors = FALSE)

female_response <- social_media %>%
  filter(Segment.Description == "Female voters") %>%
  select(Count, Answer)
male_response <- social_media %>%
  filter(Segment.Description == "Male voters") %>%
  select(Count, Answer)

answers_f <- female_response$Answer
female <- female_response$Count
answers_m <- male_response$Answer
male <- male_response$Count

df_1 <- data.frame(female, answers = answers_f)
df_2 <- data.frame(male, answers = answers_m)
df_x <- left_join(df_1, df_2, by = "answers")
df_x <- df_x %>%
  mutate(both = female + male)
colnames(df_x)


#Building server

server <- function(input, output) {
  output$bar <- renderPlotly({
        title <- paste0("Social media platform preference")
        p <- ggplot(df_x) +
      geom_col(mapping = aes_string(x = "answers",
                                    y = input$y_var),
                                    fill = input$color) +
      labs(x = "Social media platorm",
           y = "Number of response",
           title = title)
    p
  })
}
