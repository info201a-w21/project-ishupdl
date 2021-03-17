
library(shiny)
library(ggplot2)
library(plotly)

# Define UI for application that draws a histogram
page_one <- tabPanel (
    
    
    
    
)
    
        
    
page_two <- tabPanel (
    
    color_input <- selectInput(
        "color",
        label = "Color",
        choices = list("Red" = "red", "Blue" = "blue", "Green" = "green")
    ),
    
    y_input <- selectInput(
        "y_var",
        label = "Select gender",
        choices = list("Female" = "female", "Male" = "male", "Both" = "both"),
        selected = "Both"
    ),
    
    h1("Social media platform preference in male and female"),
    y_input, 
    color_input,
    plotlyOutput("bar"),
    p("The chart above is created using the number of responses for media platform
  usage in male, female, and both gender. The bar chart is used to illustrate
  the social media preference in male, female, and both. The purppose is to
  answer the question 'What is the social media usage like among female and male
  ?'")
    
)

ui <- navbarPage(
    page_two
)