library(shiny)
require(ggplot2)
ui <- fluidPage(# Application title
  titlePanel("App Demonstrating The Law of Large Numbers"),
  sidebarLayout(
    sidebarPanel(
      h2("Code for this App demonstrating the Law of Large Numbers can be found at",
         a("my GitHub", 
           href = "https://github.com/yissylevi/Stats_2016/blob/master/Statistics_Articles/law_large_numbers_app/app.R"),"as part of his series of articles on statistics from a intuitive perspective."), 
      p("Created by Levi Brackman, see more at", 
        a("my website.",
          href = "https://www.levibrackman.com"))),
    mainPanel(
      p("This app demonstrates the Law of Large Numbers which says that when something is done over and over again the results will be what is expected. The easiest example of this is a coin flip. When the coin is fair (meaning that the distributions of its weight is equal and has not been doctored so that it will land on one side more than the other) than it has a fifty percent chance of landing on heads and a fifty percent chance of landing on tails."),
      p("There are times when a person may flip 2 or more heads (or tails) in a row. In fact there are times when by chance a person can flip ten or more tails in a row. However the law of Large Numbers tells us that as the number of flips increases the results will converge on what is expected and overall fifty percent of the flips will land on heads and fifty percent will land on tails."),
      p("This app will demonstrate this law. The app will simulate coin flips and using the slider you can choose how many flips you want. You will notice that as the flips reach about 1000 the results will be 50/50. When you have very few coin flips (under 100 or so) you can get a disproportionate amount of either heads or tails."),
      p("There are two coins you can flip. The first one is fair and has a 50/50 chance of geting heads or tails. The seond one (below the first) has been doctored so you have a 70/30 chance of getting heads or tails."),
      p("Go ahead play around with it."),
      h1("Controls - Slider for flipping a Fair Coin (50/50 chance of getting heads or tails)"),
      p("Choose the number of flips you would like to try."),
      numericInput(inputId = "num", label = "Income Level Person 1:", min = 30000, max = 50000000, value = 30000, step = 5000, width="130px"),
      numericInput(inputId = "num1", label = "Income Level Person 2:", min = 30000, max = 50000000, value = 30000, step = 5000, width="130px"),
      numericInput(inputId = "num2", label = "Income Level Person 3:", min = 30000, max = 50000000, value = 30000, step = 5000, width="130px"),
      numericInput(inputId = "num3", label = "Income Level Person 4:", min = 30000, max = 50000000, value = 30000, step = 5000, width="130px"),
      numericInput(inputId = "num4", label = "Income Level Person 5:", min = 30000, max = 50000000, value = 30000, step = 5000, width="130px"),
      numericInput(inputId = "num5", label = "Income Level Person 6:", min = 30000, max = 50000000, value = 30000, step = 5000, width="130px"),
      numericInput(inputId = "num6", label = "Income Level Person 7:", min = 30000, max = 50000000, value = 30000, step = 5000, width="130px"),
      numericInput(inputId = "num7", label = "Income Level Person 8:", min = 30000, max = 50000000, value = 30000, step = 5000, width="130px"),
      numericInput(inputId = "num8", label = "Income Level Person 9:", min = 30000, max = 50000000, value = 30000, step = 5000, width="130px"),
      numericInput(inputId = "num9", label = "Income Level Person 10:", min = 30000, max = 50000000, value = 30000, step = 5000, width="130px"),
      verbatimTextOutput("value"),       
      h1("Results"),
      plotOutput("box1"),
      p("Notice how as the number of coin flips increase the results get closer and closer to 50/50. The red line is the average amount of heads and tails the coin landed on. Notice how as the amount of coin flips increase the closer that line is to the dead center."),
    ))
)

server <- function(input, output) {
  output$value <- renderText({
    paste("The range of income levels you have chosen", as.character(c(input$num, input$num1,input$num2,input$num3,input$num4,input$num5,input$num6,input$num7,input$num8,input$num9)))
  })
  output$box1<-renderPlot({
    x <- c(input$num, input$num1,input$num2,input$num3,input$num4,input$num5,input$num6,input$num7,input$num8,input$num9)
    ## Plot the results
    
    G =  ggplot(x, aes(x=x)) +
      geom_histogram(binwidth=2, colour="black", fill=cm.colors(n=1)) +
      ggtitle("Measures of Central Tendency - Mean, Median and Mode") +
      xlab("Income Values Entered (Red Line = Mean, Purple Line = Median, Highest Blue Column = Mode)") +
      ylab("Number of Times the Income Level Exists in the Distribution") +
      geom_vline(aes(xintercept=mean(x, na.rm=F)),
                 color="red", linetype="dashed", size=.5)+
      geom_vline(aes(xintercept=median(x, na.rm=F)),
                 color="purple", linetype="dashed", size=.5)
    G
    
  })  
  
}

shinyApp(ui = ui, server = server)