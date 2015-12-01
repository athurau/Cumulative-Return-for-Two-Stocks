library(quantmod)
library(dygraphs)

shinyServer(function(input, output) {
  
  # dataInput <- reactive({
    
    
    
    
  # })
  
  ### uncomment this section to see a static OHLC chart via quantmod
  ##   output$plot <- renderPlot({
  
  ##       prices <- dataInput()
  
  ## chartSeries(prices)
  
  ##       })
  ## })
  
  
  ### uncomment this to see an interactive plot via dygraphs
  output$plot <- renderDygraph({
    
    prices1 <- getSymbols(input$symb1, from = input$date[1], to = input$date[2], auto.assign = FALSE)
    prices2 <- getSymbols(input$symb2, from = input$date[1], to = input$date[2], auto.assign = FALSE)
    
   
    prices <- Ad(prices1)
    rets <- Delt(prices)[-1]
    
    

    prices2 <- Ad(prices2)
    rets2 <- Delt(prices2)[-1]
    
    cret <- cumsum(rets)
    cret2 <- cumsum(rets2)
    
    dataPlot <- merge.xts(cret, cret2, join = "outer")
    
    
    dygraph(dataPlot) %>%
      dyRangeSelector()
    

    
  })
})
