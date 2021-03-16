library(shiny)
library(plotly)
library(ggplot2)

social_media <- read.csv("~/Desktop/project-ishupdl/whatsgoodlydata_6.csv")

umich_response <- social_media %>%
  filter(segment_description == "University of Michigan") %>%
  mutate(prop_2 = (count / 49 * 100)) %>%
  mutate(prop = round(prop_2, 1)) %>%
  select(count, answer, prop)

uw_response <- social_media %>%
  filter(segment_description == "University of Washington") %>%
  mutate(prop_2 = (count / 49 * 100)) %>%
  mutate(prop = round(prop_2, 1)) %>%
  select(count, answer, prop)

color_palette <- c('rbg(123, 0, 123)', 'rbg(255, 277, 232)', 'rbg(255, 215, 0)', 'rbg(179, 106, 179)',
            'rbg(40, 39, 39)')

uw_plotly_chart3 <- plot_ly(uw_response, labels = ~answer, values = ~count, type = 'pie',
                         textposition = 'inside',
                         textinfo = 'label+percent',
                         insidetextfont = list(color = '#FFFFFF'),
                         hoverinfo = 'text',
                         text = ~paste(answer, prop, '%'),
                         marker = list(colors = color_palette,
                                       line = list(color = '#FFFFFF, width = 1')),
                         showlegend = TRUE) %>%
    layout(title = "University of Washington Student Votes",
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

umich_plotly_chart3 <- plot_ly(umich_response, labels = ~answer, values = ~count, type = 'pie',
                            textposition = 'inside',
                            textinfo = 'label+percent',
                            insidetextfont = list(color = '#FFFFFF'),
                            hoverinfo = 'text',
                            text = ~paste(answer, prop, '%'),
                            marker = list(colors = color_palette,
                                          line = list(color = '#FFFFFF, width = 1')),
                            showlegend = TRUE) %>%
    layout(title = "University of Michigan Student Votes",
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

# Define server logic required to draw a histogram
chart3_server <- shinyServer(function(input, output) {

    output$pie_charts <- renderPlotly({
      if (input$pie_options == "umich_plotly_chart3") {umich_plotly_chart3}
      else {uw_plotly_chart3}
      })
      })

