#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

social_media <- read.csv("WhatsgoodlyData-6.csv"
                         , stringsAsFactors = FALSE)
View(social_media)
library(shiny)
library(plotly)
library(ggplot2)
library(tidyverse)
library(lintr)
library(dplyr)

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
# THis is the start of page 3
percent_answer <- social_media %>%
  group_by(Segment.Type, Answer) %>%
  filter(Count == max(Count))

percent_segment_1 <- percent_answer %>%
  group_by(Segment.Type) %>%
  pull(Segment.Type)

percent_segment <- unique(percent_segment_1)
count_answer_facebook <- percent_answer %>%
  filter(Answer == "Facebook") %>%
  pull(Count)

count_answer_twitter <- percent_answer %>%
  filter(Answer == "Twitter") %>%
  pull(Count)


count_answer_snapchat <- percent_answer %>%
  filter(Answer == "Snapchat") %>%
  pull(Count)

count_answer_none <- percent_answer %>%
  filter(Answer == "None") %>%
  pull(Count)



percent_answer_facebook <- percent_answer %>%
  filter(Answer == "Facebook") %>%
  pull(Percentage)

percent_answer_twitter <- percent_answer %>%
  filter(Answer == "Twitter") %>%
  pull(Percentage)



percent_answer_snapchat <- percent_answer %>%
  filter(Answer == "Snapchat") %>%
  pull(Percentage)

percent_answer_none <- percent_answer %>%
  filter(Answer == "None") %>%
  pull(Percentage)


percent_segment
percent_answer_facebook
percent_answer_twitter

percent_answer_snapchat
percent_answer_none



facebook <- data.frame(
  percent_segment, percent_answer_facebook,
  count_answer_facebook
)

twitter <- data.frame(
  percent_segment, percent_answer_twitter,
  count_answer_twitter
)

snapchat <- data.frame(
  percent_segment, percent_answer_snapchat,
  count_answer_snapchat
)

none <- data.frame(
  percent_segment, percent_answer_none,
  count_answer_none
)

percent_total <- data.frame(percent_segment, facebook, twitter, snapchat, none)

facebook_graph <- ggplot(facebook, aes(
  x = percent_answer_facebook,
  y = count_answer_facebook
)) +
  geom_point(aes(color = factor(percent_segment))) +
  labs(
    title = "Count vs. Voting Rate", y = "Count", x = "Vote Rate",
    color = "Segment Type"
  )

snapchat_graph <- ggplot(snapchat, aes(
  x = percent_answer_snapchat, y =
    count_answer_snapchat
)) +
  geom_point(aes(color = factor(percent_segment))) +
  labs(
    title = "Count vs. Voting Rate", y = "Count", x = "Vote Rate",
    color = "Segment Type"
  )

twitter_graph <- ggplot(twitter, aes(
  x = percent_answer_twitter, y =
    count_answer_twitter
)) +
  geom_point(aes(color = factor(percent_segment))) +
  labs(
    title = "Count vs. Voting Rate", y = "Count", x = "Vote Rate",
    color = "Segment Type"
  )

none_graph <- ggplot(none, aes(x = percent_answer_none,
                               y = count_answer_none)) +
  geom_point(aes(color = factor(percent_segment))) +
  labs(
    title = "Count vs. Voting Rate", y = "Count", x = "Vote Rate",
    color = "Segment Type"
  )


# This is the start of page four

umich_response <- social_media %>%
  filter(Segment.Description == "University of Michigan") %>%
  mutate(prop_2 = (Count / 49 * 100)) %>%
  mutate(prop = round(prop_2, 1)) %>%
  select(Count, Answer, prop)

uw_response <- social_media %>%
  filter(Segment.Description == "University of Washington") %>%
  mutate(prop_2 = (Count / 49 * 100)) %>%
  mutate(prop = round(prop_2, 1)) %>%
  select(Count, Answer, prop)

color_palette <- c(
  "rbg(123, 0, 123)", "rbg(255, 277, 232)", "rbg(255, 215, 0)",
  "rbg(179, 106, 179)", "rbg(40, 39, 39)"
)

uw_plotly_chart3 <- plot_ly(uw_response,
  labels = ~Answer, values = ~Count,
  type = "pie",
  textposition = "inside",
  textinfo = "label+percent",
  insidetextfont = list(color = "#FFFFFF"),
  hoverinfo = "text",
  text = ~ paste(Answer, prop, "%"),
  marker = list(
    colors = color_palette,
    line = list(color = "#FFFFFF,
                                                      width = 1")
  ),
  showlegend = TRUE
) %>%
  layout(
    title = "University of Washington Student Votes",
    xaxis = list(
      showgrid = FALSE, zeroline = FALSE,
      showticklabels = FALSE
    ),
    yaxis = list(
      showgrid = FALSE, zeroline = FALSE,
      showticklabels = FALSE
    )
  )

umich_plotly_chart3 <- plot_ly(umich_response,
  labels = ~Answer,
  values = ~Count, type = "pie",
  textposition = "inside",
  textinfo = "label+percent",
  insidetextfont = list(color = "#FFFFFF"),
  hoverinfo = "text",
  text = ~ paste(Answer, prop, "%"),
  marker = list(
    colors = color_palette,
    line = list(color = "#FFFFFF,
                                                         width = 1")
  ),
  showlegend = TRUE
) %>%
  layout(
    title = "University of Michigan Student Votes",
    xaxis = list(
      showgrid = FALSE, zeroline = FALSE,
      showticklabels = FALSE
    ),
    yaxis = list(
      showgrid = FALSE, zeroline = FALSE,
      showticklabels = FALSE
    )
  )

server <- function(input, output) {
  output$bar <- renderPlotly({
    title <- paste0("Social Media Platform Influence")
    p <- ggplot(df_x) +
      geom_col(
        mapping = aes_string(
          x = "answers",
          y = input$y_var
        ),
        fill = input$color
      ) +
      labs(
        x = "Social media platorm",
        y = "Number of responses",
        title = title
      )
  })
  output$pie_charts <- renderPlotly({
    if (input$pie_options == "umich_plotly_chart3") {
      umich_plotly_chart3
    }
    else {
      uw_plotly_chart3
    }
  })
  output$graph <- renderPlotly({
    if (input$axiscode == "facebook_graph") {
      facebook_graph
    }
    else if (input$axiscode == "snapchat_graph") {
      snapchat_graph
    }
    else if (input$axiscode == "twitter_graph") {
      twitter_graph
    }
    else {
      none_graph
    }
  })
}
