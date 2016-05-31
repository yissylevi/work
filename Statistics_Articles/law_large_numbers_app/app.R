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
    numericInput(inputId = "num", label = "Coin flips:", min = 1, max = 50000000000, value = 5, step = 1, width="130px"),
    verbatimTextOutput("value"),       
    h1("Results"),
    plotOutput("box1"),
    p("Notice how as the number of coin flips increase the results get closer and closer to 50/50. The red line is the average amount of heads and tails the coin landed on. Notice how as the amount of coin flips increase the closer that line is to the dead center."),
    p("This slider controls ."),
    h1("Controls - Slider for flipping an Unfair Coin (70/30 chance of getting heads or tails)"),
    p("Choose the number of flips you would like to try."),
    numericInput(inputId = "num1", label = "Coin flips:", min = 1, max = 50000000000, value = 5, step = 1, width="130px"),
    verbatimTextOutput("value1"),       
    h1("Results"),
    plotOutput("box2"),
    p("Notice how as the number of coin flips increase the results get closer and closer to 70/30. The red line is the average amount of heads and tails the coin landed on. Notice how as the amount of coin flips increase the closer that line moves away from the center.")
  ))
)

server <- function(input, output) {
  output$value <- renderText({
    paste("The number of coin flips you have chosen is", as.character(input$num))
  })
  output$box1<-renderPlot({
    flips <- sample(c(0,1), input$num, replace = TRUE, prob = c(0.5, 0.5))
    flips<-as.data.frame(flips)
    flips$flips[flips$flips==1] <- 2
    flips$flips[flips$flips==0] <- 1
    ## Plot the results
    
    G =  ggplot(flips, aes(x=flips)) +
      geom_bar(colour="black", fill=cm.colors(n=2)) +
      ggtitle("Law of Large Numbers Demonstration Histogram") +
      xlab("Coin Flip Outcomes") +
      ylab("Number of Times the Coin was Flipped") +
      scale_x_discrete(limits=c("Heads", "Tails")) +
      geom_vline(aes(xintercept=mean(flips, na.rm=F)),
                 color="red", linetype="dashed", size=.5)
    G
    
  })  
  
  output$value1 <- renderText({
    paste("The number of coin flips you have chosen is", as.character(input$num1))
  })
  output$box2<-renderPlot({
    flips1 <- sample(c(0,1), input$num1, replace = TRUE, prob = c(0.7, 0.3))
    flips1<-as.data.frame(flips1)
    flips1$flips1[flips1$flips1==1] <- 2
    flips1$flips1[flips1$flips1==0] <- 1
    ## Plot the results
    
    G =  ggplot(flips1, aes(x=flips1)) +
      geom_bar(colour="black", fill=heat.colors(n=2)) +
      ggtitle("Law of Large Numbers Demonstration Histogram") +
      xlab("Coin Flip Outcomes") +
      ylab("Number of Times the Coin was Flipped") +
      scale_x_discrete(limits=c("Heads", "Tails")) +
      geom_vline(aes(xintercept=mean(flips1, na.rm=F)),
                 color="red", linetype="dashed", size=.5)
    G
    
  })  
}

shinyApp(ui = ui, server = server)