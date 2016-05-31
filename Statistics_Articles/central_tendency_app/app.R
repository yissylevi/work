library(shiny)
require(ggplot2)
ui <- fluidPage(# Application title
  titlePanel("App Demonstrating Measures of Central Tendency"),
  sidebarLayout(
    sidebarPanel(
      p("Below choose the income of ten people and find the mean, median and mode of all ten people. Numbers are in thousands--the max is 5000k (5 million), increase in increments of 5k."),
      numericInput(inputId = "num", label = "Person 1:", min = 0, max = 5000000, value = 25, step = 5, width="130px"),
      numericInput(inputId = "num1", label = "Person 2:", min = 0, max = 5000000, value = 35, step = 5, width="130px"),
      numericInput(inputId = "num2", label = "Person 3:", min = 0, max = 5000000, value = 45, step = 5, width="130px"),
      numericInput(inputId = "num3", label = "Person 4:", min = 0, max = 5000000, value = 55, step = 5, width="130px"),
      numericInput(inputId = "num4", label = "Person 5:", min = 0, max = 5000000, value = 55, step = 5, width="130px"),
      numericInput(inputId = "num5", label = "Person 6:", min = 0, max = 5000000, value = 60, step = 5, width="130px"),
      numericInput(inputId = "num6", label = "Person 7:", min = 0, max = 5000000, value = 70, step = 5, width="130px"),
      numericInput(inputId = "num7", label = "Person 8:", min = 0, max = 5000000, value = 80, step = 5, width="130px"),
      numericInput(inputId = "num8", label = "Person 9:", min = 0, max = 5000000, value = 90, step = 5, width="130px"),
      numericInput(inputId = "num9", label = "Person 10:", min = 0, max = 5000000, value = 1000, step = 5, width="130px"),
      p("The incomes chosen in thousands are:"),
      verbatimTextOutput("value"),  
      h5("Created by Levi Brackman, see more at", 
         a("my website.",
           href = "https://www.levibrackman.com"))),
mainPanel(
      p("This app demonstrates the measure of central tendency in an intuitive manner without need for the math."),
      p("The example we are using here is incomes. Imagine you are at a function with ten strangers and you want to know what everyone earns. You have access to all ten incomes (but you don't know which income belongs to which person). If the mean income was $300k, would that indicate a well healed group? Well not necessarily. Read on."),
      p("Measures of central tendency tell us about a distribution. Most people know the average also known as the mean. This is calculated by adding up all the numbers in the set and dividing it by the number of observations in the set." ),
      p("The Median is the number that measures the middle point of the distribution where 50% of observations are lower than that point and 50% are higher than it."),
      p("The Mode is the point that is found most often in the set."),
      h4("Is Warren Buffet in the Room?"),
      p("Back to our group of people and their income. If Warren Buffet is amongst the group, and the rest of the group earn much less than him, the average (mean) income would not be a good indicator of the income of the group as a whole. In that case the median and the mode will help us."),
      p("Yet with only the median and the mode we would not know that Warren Buffet is in the room."),
      h4("Bad Players Try to Fool Us By This"),
      p("This should illustrate why just knowing the mean, or just the median, can really mislead us about a set of data. Unfortunately our ignorance about this is used by companies, public officials and politicians to mislead us. Always ask for other indicators of central tendency, such as the median or the mode, as well."),
      p("Play around with this app to see how the mean, the median and the mode changes as the inputs into the set of incomes changes."),
      p("I have placed results both in terms of numbers and a plot so that you can visualize what the numbers are doing to get a more intuitive feel of what all three measures of central tendency offer."),
      h4("Results in Numbers (in thousands)"),
      textOutput("mean"),
      textOutput("median"),
      textOutput("mode"),
      h4("Results in a Plot"),
      plotOutput("box1"),
      p("Notice how the mean will change dramatically if one individual has an out-sized income (either big or small) relative to the rest. The median and mode are not effected by that as much, which also is problematic because it does not tell us when we have a very rich or poor person amongst the group.")
      ))
)

server <- function(input, output) {
output$value <- renderText({
        paste("", as.character(c(input$num, input$num1,input$num2,input$num3,input$num4,input$num5,input$num6,input$num7,input$num8,input$num9)))
        })
        output$box1<-renderPlot({
        data <- c(input$num, input$num1,input$num2,input$num3,input$num4,input$num5,input$num6,input$num7,input$num8,input$num9)
        
        ## Plot the results
        y<-as.data.frame(data)
        require(dplyr)
        y<-rename(y, y=data)
        G = ggplot(y, aes(x=y)) +
        geom_histogram(binwidth=10, colour="black", fill=cm.colors(n=1)) +
        ggtitle("Measures of Central Tendency \n Red Line = Mean, Purple Line = Median, Highest Blue Column = Mode") +
        xlab("Income Values Entered in Thousands of Dollars") +
        ylab("Number of Times an Income Level Exists in the Distribution") +
        geom_vline(aes(xintercept=mean(y, na.rm=F)),
        color="red", linetype="dashed", size=.5)+
        geom_vline(aes(xintercept=median(y, na.rm=F)),
        color="purple", linetype="dashed", size=.5)
        G
        })
        output$mean<-renderText({
        data <- c(input$num, input$num1,input$num2,input$num3,input$num4,input$num5,input$num6,input$num7,input$num8,input$num9)
        paste("The Mean (also know as the average): $",
        # Find Mean.
        mean(data)
        )
        
        })
        
        output$median<-renderText({
        data <- c(input$num, input$num1,input$num2,input$num3,input$num4,input$num5,input$num6,input$num7,input$num8,input$num9)
        paste("The Median (50% are less than this number and 50% are higher): $",
        # Find the median.
        median(data)
        )
        })
        
        
        MODE <- function(dataframe){
          DF <- as.data.frame(dataframe)
          
          MODE2 <- function(x){      
            if (is.numeric(x) == FALSE){
              df <- as.data.frame(table(x))  
              df <- df[order(df$Freq), ]         
              m <- max(df$Freq)        
              MODE1 <- as.vector(as.character(subset(df, Freq == m)[, 1]))
              
              if (sum(df$Freq)/length(df$Freq)==1){
                warning("No Mode because all incomes in the set are unique and appear only once", call. = FALSE)
              }else{
                return(MODE1)
              }
              
            }else{ 
              df <- as.data.frame(table(x))  
              df <- df[order(df$Freq), ]         
              m <- max(df$Freq)        
              MODE1 <- as.vector(as.numeric(as.character(subset(df, Freq == m)[, 1])))
              
              if (sum(df$Freq)/length(df$Freq)==1){
                warning("No Mode because all incomes in the set are unique and appear only once", call. = FALSE)
              }else{
                return(MODE1)
              }
            }
          }
          
          return(as.vector(lapply(DF, MODE2)))
        }
        
        output$mode<-renderText({
        data <- c(input$num, input$num1,input$num2,input$num3,input$num4,input$num5,input$num6,input$num7,input$num8,input$num9)
        paste("The Mode (the value that appears most often): $",
        #Mode function
        
        #Calculate the mode using the user function
        MODE(data)
        )
        })  
        
        
        }
        
        shinyApp(ui = ui, server = server)
       
       