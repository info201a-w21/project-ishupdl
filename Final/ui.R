
library(shiny)
library(plotly)
library(shinyWidgets)

# Define UI for application that draws a histogram

page_one <- tabPanel(
  "Intro",
  h1("Introduction"),

  sidebarLayout(
    sidebarPanel(
      p("We were interested in the domain of social media consumption behaviors
      because it could help us understand what makes people follow certain
      social media pages or trends more over the others. This information could
      help future creators and marketers strategize better ideas and plans
      during the content creation process."),
      p("The dataset we chose to use for our data analysis is called “Social
      Influence on Shopping” by Adam Halper, CEO of Whatsgoodly, a social
      polling company for younger people. They surveyed 2,676 millennials and
      Gen Z members, each tied to a certain demographic. In the poll they asked
      the question: “What social platform has influenced your online shopping
      the most?”"),
    ),
    mainPanel(
      img(
        src = "https://www.disruptivestatic.com/wp-content/uploads/2019/05/social-shopping-blog.jpg",
        height = "70%", width = "70%"
      ),

      h2("Questions we hope to answer:"),

      p("1. How does social media influence on shopping vary amongst men and
      women?
    "),
      p("2. What is the distribution of shopping influence through social media
    amongst different subgroups?"),
      p("3. What social media platforms influence the shopping behaviors of
      college students at UW compared to other universities?
")
    )
  )
)
page_two <- tabPanel(
  "Gender",
  h1("Social Media Influence on Shopping by Gender"),

  sidebarLayout(
    sidebarPanel(
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
      )
    ),
    mainPanel(
      plotlyOutput("bar"),
      p("The chart above is created using the number of responses for media
    platform influence in males, females, and both. It can be used to
    illustrate the differences in social media impact on males and females.")
    )
  )
)
# This is the start of page three
option_box_1 <- sidebarPanel(
  selectInput(
    inputId = "axiscode",
    label = "Pick a Social Media",
    choices = list(
      "Facebook" = "facebook_graph",
      "Snapchat" = "snapchat_graph",
      "Twitter" = "twitter_graph",
      "None" = "none_graph"
    ),
  )
)



main_graph <- mainPanel(
  plotlyOutput("graph"),
  p("This graph represents the number of people that stated their preferred
    social media for shopping in each segment type and compared to the overall
    percentage of votes the social media got in each segment type (eg. facebook
      in the university segment type earned 150 votes but only 35 percent of the
      total vote in the University category).")
)

page_three <- tabPanel(
  "Segment Type",
  h1("Social Media Preference by Segment Type"),
  sidebarLayout(
    option_box_1,
    main_graph
  )
)
# This is the start of page four
page_four <- tabPanel(
  "Universities",
  h1("Votes from Colleges"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "pie_options",
        label = "University Responses",
        choices = c(
          "University of Washington" = "uw_plotly_chart3",
          "University of Michigan" = "umich_plotly_chart3"
        )
      )
    ),
    mainPanel(
      plotlyOutput("pie_charts"),
      p("These charts can be used to compare the responses from the
              University of Washington and the University of Michigan.
              We chose University of Michigan due to the fact that it is a
              public university of similar size, and it had a good amount of
              responses to use as comparison.")
    )
  )
)

page_five <- tabPanel(
  "Summary",
  h1("Summary Takeaways"),

  sidebarLayout(
    sidebarPanel(
      img(
        src = "https://i1.wp.com/idealog.co.nz/wp-content/uploads/media/images2015/articles/2019/07/shutterstock_1110859739-scaled.jpg?fit=2560%2C2560&ssl=1",
        height = "100%", width = "100%"
      )
    ),
    mainPanel(
      h3("Question 1 - Chart 1"),
      strong("How does social media influence on shopping vary amongst men
     and women?"),
      p("Takeaways: One of the key differences between males and females in the
  comparison chart is the large amount of males that say no
    social platform has had influence on their shopping and the few amount of
    females that say this. This may point to a behavior pattern that says males
    are less likely to be influenced through social media posts and ads.
    We can also see through that compared to males,
    Instagram has a bigger influence on the shopping behaviors of females. The
    distribution for the influence of Facebook, Snapchat, and Twitter do not
    vary significantly."),

      h3("Question 2 - Chart 2"),
      strong("What is the distribution of shopping influence through social
      media amongst different subgroups?"),
      p("Takeaways: The segment type chart shows that amongst each of the social
    media platforms, the vote rate does not vary that much. However, you can
    see that university subgroups had the highest vote rate for every platform.
    The web subgroups had the lowest vote rate for every platform. The main
    takeway from this is that university subgroups are most influenced by any
    given platform compared to people within the other segment types."),

      h3("Question 3 - Chart 3"),
      strong("What social media platforms influence the shopping behaviors of
      college students at UW compared to other universities?"),
      p("Takeaways: The social media platforms that influence students at UW and
    UMich have nearly the exact same distribution. This shows that college
    students with similar demographics and interests are likely to be equally
    influenced by the same platforms. Students at both universities are
    influenced the most by Instagram and Facebook, and have a large amount of
    students that aren't influenced by any.")
    )
  )
)
ui <- navbarPage(
  "Social Media Influence on Shopping",
  page_one,
  page_two,
  page_three,
  page_four,
  page_five,
  setBackgroundColor("AliceBlue")
)
