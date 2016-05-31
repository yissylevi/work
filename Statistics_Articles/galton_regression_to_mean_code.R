require(HistData)
hist(galton)
View(galton)
require(dplyr)
require(tidyr)
parent1<-filter(galton, parent >70.0)
child1<-filter(galton, child >70.0, child < 70.9)
child2<-lm(child~parent, child1)
barplot(parent1)
parent1<-as.data.frame(parent1)
parent2<-mean(parent1$parent)
parent3<-mean(parent1$child)
means<-data.table(parent2, parent3)
boxplot(parent1)
points(1:2, means, pch=15, cex=2, col = "orange")
text(1:2, means, labels = round(means, digits = 1))


require(HistData)
par(mfrow=c(1,2))
hist(galton$parent, , prob=TRUE, main="Distribution and Mean of Parents Heights", xlab="Parents heights (inches)")
x<-mean(galton$parent)
abline(v=x,col="blue")
text(x, 18, round(x, 2))
lines(density(galton$parent, adjust=2), lty="dotted", col="darkgreen", lwd=2) 

hist(galton$child, , prob=TRUE, main="Distribution and Mean of Childrens Heights", xlab="Childrens heights (inches)")
y<-mean(galton$child)
abline(v=y,col="blue")
text(y, 18, round(y, 2))
lines(density(galton$child, adjust=2), lty="dotted", col="darkgreen", lwd=2) 


library(shiny)
ui <- fluidPage(# Application title
  titlePanel("Demonstration of Regression to the Mean"),
    mainPanel(
      p("This app demonsrates the idea of regression to the mean using the famous Galton dataset of parent and childs 
        heights put together by Francis Galton in 1885. He did a study of heights of 898 parents and children to see if the idea of regression to the mean (he called it regression to mediocraty) held up for them.
        He found that the children of taller parents were on avarage shorter than their parents and the children of shprter parents are on avarage taller than their parents.
        )"),
      
      p("For an information about Francis Galton, visit the ",
        a("wikipedia.", 
          href = "https://en.wikipedia.org/wiki/Francis_Galton"))),
  
  plotOutput("box2"),
  sliderInput(inputId = "num", label = "Parent Heights (Inches) Above:", min = 61.7, max = 72.9, value = 61.7, step = .1, width="1300px"),
  sliderInput(inputId = "num1", label = "Parents Heights (Inches) Below:", min = 64.1, max = 72.9, value = 61.7, step = .1, width="1300px"),
 verbatimTextOutput("value"),       
 verbatimTextOutput("value1"), 
 plotOutput("box1"))

server <- function(input, output) {
  output$value <- renderText({
    paste("Parent Height is Above", as.character(input$num))
  })
  
 
  output$value1 <-  renderText({
    paste("Parent Height is Below", as.character(input$num1))
  })
  output$box2<-renderPlot({
    par(mfrow=c(1,2))
    hist(galton$parent, , prob=TRUE, main="Distribution and Mean of Parents Height", xlab="Parents height (inches)")
    x<-mean(galton$parent)
    abline(v=x,col="blue")
    text(x, 18 , round(x, 2))
    lines(density(galton$parent, adjust=2), lty="dotted", col="darkgreen", lwd=2) 
    hist(galton$child, , prob=TRUE, main="Distribution and Mean of Childrens Height", xlab="Childrens height (inches)")
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
    boxplot(parent1, main="Childrens height relative to parents height", names=c("Parents height (inches)", "Childrens Height (inches)"))
            points(1:2, means, pch=15, cex=2, col = "orange")
            text(1:2, means, labels = round(means, digits = 1))})
}

shinyApp(ui = ui, server = server)

