library(shiny)
library(dygraphs)

shinyUI(fluidPage(
  titlePanel("Cumulative Return for 2 Stocks"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Input a ticker and see the stock's chart."),
      
      textInput("symb1", label = h3("Input a Valid Stock Ticker"), value = "GE"),
      textInput("symb2", label = h3("Input a Valid Stock Ticker"), value = "RTN"),
      dateRangeInput("date", label = h3("Input Date Range for Returns"), start = '2010-01-01', end = as.character(Sys.Date())),
      helpText("Date Format: [YYYY/MM/DD]")
    ),
    
    ### uncomment for static chart    
    ## mainPanel(plotOutput("plot"))
    
    ### uncomment for dygraphs chart
    mainPanel(dygraphOutput("plot"))
  )
))