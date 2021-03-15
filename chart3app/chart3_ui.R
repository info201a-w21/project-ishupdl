library(shiny)


# Define UI for application that draws a histogram
chart3_ui <- fluidPage(
    h2("Votes from Colleges"),
    sidebarLayout(
        sidebarPanel(
            selectInput(
                inputId = "pie_options",
                label = "University Responses",
                choices = c("University of Washington", "University of Michigan"),
            plotlyOutput("pie_charts")
            )
        )
    )
)