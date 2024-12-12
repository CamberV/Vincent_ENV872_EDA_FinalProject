library(shiny)
library(sf)
library(ggplot2)
library(dplyr)
library(viridis)

server<-function(input, output, session){
  
  #dynamic text selection summary 
  output$selection_summary<-renderText({
    paste(
      "I want to visualize",input$emission_type,
      "for",input$pollutant,
      "at the",input$geo_level,"level in 2022."
    )
  })
  
  #reactive data selection based on user input
  selected_data <- reactive({
    
    #select which sf data file to visualize based on regional level
    map_data<-if(input$geo_level=="SR")map_sr_data else map_st_data
    
    #selecting the column name based on user input
    column_name<-paste0(input$geo_level,input$pollutant,input$emission_rate)
    
    #re-titling selected data as a new column "data"
    map_data<-map_data%>%
      mutate(value =.[[column_name]]) #select column based on previous line
    map_data
  })
  
  #render the map visualization
  output$map_plot <- renderPlot({
    map_data <- selected_data()
    
    ggplot(data = map_data) +
      geom_sf(aes(fill = value), color = "black") +
      scale_fill_viridis_c(option = "C", na.value = "white") +
      labs(title = "Emission Map", fill = "Value") +
      theme_minimal()
  })
  
  #render the bar chart visualization
  output$bar_chart <- renderPlot({
    map_data <- selected_data()
    
    ggplot(data = map_data) +
      geom_bar(aes(x = ifelse(input$geo_level == "SR", SUBRGN, PSTATABB), y = value),
               stat = "identity", fill = "steelblue") +
      labs(
        title = "Emission Bar Chart",
        x = ifelse(input$geo_level == "SR", "Subregion", "State"),
        y = "Value"
      ) +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
  })
}