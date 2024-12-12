library(shiny)

ui<-fluidPage(
  titlePanel("Visualizing eGRID Data"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId="geo_level",
        label="Select Geographic Level:",
        choices=c("Subregion"="SR","State"="ST")
      ),
      selectInput(
        inputId="emission_rate",
        label="Select Emission Rate:",
        choices=c("Output Emission Rates"="RTA", 
                    "Input Emission Rates"="RA", 
                    "Non-Baseload Emissions"="NB")
      ),
      selectInput(
        inputId="pollutant",
        label="Select Pollutant:",
        choices=c("CO2","NOX","SO2","CH4","N2O","CO2eq"="C2E")
      ),
      textOutput("selection_summary")
    ),
    
    mainPanel(
      h3("Map Visualization"),
      plotOutput("map_plot"),
      
      h3("Bar Chart"),
      plotOutput("bar_chart")
    )
  )
)