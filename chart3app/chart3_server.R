library(shiny)
library(plotly)
library(ggplot2)

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
shinyServer(function(input, output) {

    

    })

})
