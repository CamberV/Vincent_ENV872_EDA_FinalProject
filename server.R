library(shiny)
library(ggplot2)

server<-function(input, output, session){
  
  #dynamic text selection summary 
  output$selection_summary<-renderText({
    paste(
      "I want to visualize",input$emission_type,
      "for",input$pollutant,
      "at the",input$geo_level,"level in 2022."
    )
  })
  
  #map visualization
  output$map_plot<-renderPlot({
    ggplot()
  })
  
  #bar chart visualization
  output$bar_chart<-renderPlot({
    ggplot()
  })
}