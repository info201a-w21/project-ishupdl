library(shiny)
source("chart3_server.R")


# Define UI for application that draws a histogram
chart3_ui <- fluidPage(
    h2("Votes from Colleges"),
    sidebarLayout(
        sidebarPanel(
            selectInput(
                inputId = "pie_options",
                label = "University Responses",
                choices = c("University of Washington" = "uw_plotly_chart3", 
                            "University of Michigan" = "umich_plotly_chart3"))),
        mainPanel(
            plotlyOutput("pie_charts")
            )
    )
)

shinyApp(chart3_ui, chart3_server)
