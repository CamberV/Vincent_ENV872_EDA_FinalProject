library(shiny)
library(sf)
library(ggplot2)
library(dplyr)
library(viridis)
library(patchwork)

server<-function(input, output, session){
  
  #reactive data selection based on user input
  selected_data<-reactive({
    
    #select which sf data file to visualize based on regional level
    map_data<-if(input$geo_level=="SR")map_sr_data else map_st_data
    
    #selecting the column name based on user input
    column_name<-paste0(input$geo_level,input$pollutant,input$emission_rate)
    
    #re-titling selected data as a new column "data"
    map_data<-map_data%>%
      mutate(value=.[[column_name]]) #select column based on previous line
    map_data
  })
  
  #render the map visualization
  output$map_plot<-renderPlot({
    map_data<-selected_data()
    unit<-ifelse(input$emission_rate=="RA","lb/MMBtu","lb/MWh") #define unit based on input

    ggplot(data=map_data)+
      geom_sf(aes(fill=value),color="black")+ #map data
      geom_sf_label( #add labels
        aes(label=if(input$geo_level=="SR") SUBRGN else PSTATABB), #select label based on input
        size=3,
        fill="white",
        label.size=0.3
        )+ 
      coord_sf(xlim=c(-130,-65),ylim=c(25,50))+ #restricting to contiguous US for visual clarity
      scale_fill_viridis_c(option="C",name=unit)+ #setting color scale
      labs(x=NULL,y=NULL)+ #removing unnecessary axis titles
      theme_minimal()
  })
  
  #render the bar chart visualization
  output$bar_chart<-renderPlot({
    map_data<-selected_data()
    unit<-ifelse(input$emission_rate=="RA","lb/MMBtu","lb/MWh") #define unit based on input
    
    map_data<-map_data%>%
      arrange( #arranging data if user selects
        if(input$sort_order=="Descending by Value") desc(value)
      )
    
    #error fix to maintain sort order by setting x_axis as manual factor
    map_data<-map_data%>%
      mutate(x_axis=factor(
                    if (input$geo_level=="SR") SUBRGN else PSTATABB,
                    levels=unique(
                        if (input$geo_level=="SR") SUBRGN else PSTATABB)
      ))
    
    ggplot(data=map_data)+ #map data
      geom_bar(aes(x=x_axis,
                   y=value,
                   fill=value),
               stat="identity")+
      geom_text(
        aes(x=x_axis,
            y=value,
            label=round(value,2)),
        vjust=-0.5,size=3 #labeling bars
      )+
      labs(
        x=ifelse(input$geo_level=="SR","Subregion","State"),
        y=unit,
        fill=unit
      )+
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
  })
}