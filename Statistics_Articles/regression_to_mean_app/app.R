
library(shiny)
require(HistData)
require(data.table)
galton <- read.csv("data/galton.csv")
ui <- fluidPage(# Application title
  titlePanel("Demonstration of Regression to the Mean"),
  h3("by Levi Brackman"),
  mainPanel(
    p("This app demonstrates the idea of regression to the mean using the famous Galton dataset of parent and child 
      heights put together by Francis Galton in 1885. He did a study of heights of 898 parents and children to see if 
      the idea of regression to the mean (he called it regression to mediocrity) held up for them. He found that the 
      children of taller parents were on average shorter than their parents and the children of shorter parents are on 
      average taller than their parents."),
    
    p("For an information about Francis Galton visit this",
      a("wikipedia page.", 
        href = "https://en.wikipedia.org/wiki/Francis_Galton")),
    h2("Distributions of Heights"),
    p("In these first two graphs below you will find two histograms. One is of a distribution of parents heights and the other of their children's heights. As you can see by the blue line the mean (or average) of both parents and their children are about the same. You can also see that the distribution of heights represent a Normal Distribution."),
    plotOutput("box2"),
    h2("Controls - Sliders"),
    p("Choose the heights of the parents (between any range on the sliders) to see the corresponding mean (average) height and the overall distribution of heights of the children."),
    p("Note: if you get an error that is because there is no corresponding height in the children's dataset."),
    sliderInput(inputId = "num", label = "Parent Heights (Inches) Above:", min = 61.7, max = 72.9, value = 61.7, step = .1, width="1300px"),
    sliderInput(inputId = "num1", label = "Parents Heights (Inches) Below:", min = 64.1, max = 72.9, value = 61.7, step = .1, width="1300px"),
    verbatimTextOutput(c("value", "value1")),       
    h2("Results: Tall Parents, Shorter Kids. Short Parents, Taller Kids"),
    plotOutput("box1"),
    p("Here you can see how, in practice, the parents and children's heights, on average, differ from each other. The box-plots represent quartiles. The black line in the middle represents the median
      (50% are below that line and 50% are above it) and the yellow dot and the numbers inside the box are the mean (average) of the distribution that you chose using the slider (above)."),
    
    p("Notice how when the parents are taller the children end up slightly shorter and when the parents are shorter the children are taller. This is called Regression to the Mean.")))
   

server <- function(input, output) {
  output$value <- renderText({
    paste("Parents height is now set to above", as.character(input$num), "inches and below", as.character(input$num1), "inches")
  })
  #output$value1 <-  renderText({
   # paste("Parent Height is Below", )
 # })
  output$box2<-renderPlot({
    par(mfrow=c(1,2))
    hist(galton$parent, prob=TRUE, main="Distribution and Mean of Parents Height", xlab="Parents Height (inches)")
    x<-mean(galton$parent)
    abline(v=x,col="blue")
    text(x, 18 , round(x, 2))
    lines(density(galton$parent, adjust=2), lty="dotted", col="darkgreen", lwd=2) 
    hist(galton$child, prob=TRUE, main="Distribution and Mean of Children's Height", xlab="Children's Height (inches)")
    y<-mean(galton$child)
    abline(v=y,col="blue")
    text(y, 18 , round(y, 2))
    lines(density(galton$child, adjust=2), lty="dotted", col="darkgreen", lwd=2) 
  })
  output$box1<-renderPlot({
    require(HistData)
    require(dplyr)
    require(tidyr)
    parent1<-filter(galton, parent >= input$num & parent <= input$num1)
    parent2<-mean(parent1$parent)
    parent3<-mean(parent1$child)
    means<-data.table(parent2, parent3)
    boxplot(parent1, main="Children's Height Relative to Parents Height", names=c("Parents Height (inches)", "Children's Height (inches)"))
    points(1:2, means, pch=15, cex=2, col = "yellow")
    text(1:2, means, labels = round(means, digits = 1))})
}

shinyApp(ui = ui, server = server)