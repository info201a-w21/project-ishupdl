
library(shiny)

# Define UI for application that draws a histogram

page_two <- tabPanel( 
    "Chart 1",
    h1("Social Media Preference by Gender"),
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
    plotlyOutput("bar"),
    p("The chart above is created using the number of responses for media platform
  usage in male, female, and both gender. The bar chart is used to illustrate
  the social media preference in male, female, and both. The purppose is to
  answer the question 'What is the social media usage like among female and male
  ?'")
)
#This is the start of page three
option_box_1 <- sidebarPanel(
    selectInput(
        inputId = "axiscode",
        label = "Pick a Social Media",
        choices = list("Facebook" = "facebook_graph",
                       "Snapchat" = "snapchat_graph",
                       "Twitter" = "twitter_graph",
                      "None" = "none_graph"),
    )
) 



main_graph <- mainPanel(
   plotlyOutput("graph"),
    p("This graph represents the number of people that stated their preferred social media for 
    shopping in each segment type and compared to the overall percentage of votes the social media got in each segment type
    (eg. facebook in the university segment type earned 150 votes but only 35 percent of the total vote in the University category)")
    
)

page_three <- tabPanel(
    "Chart 2",
    h1("Social Media Preference by Segment Type"),
    sidebarLayout(
        option_box_1,
        main_graph
    )
)
#This is the start of page four 
page_four <- tabPanel( 
    "Chart 3",
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
ui <- navbarPage(
    "This is a title",
    page_two,
    page_three,
    page_four
)
