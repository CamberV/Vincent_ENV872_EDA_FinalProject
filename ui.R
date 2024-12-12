library(shiny)

ui<-fluidPage(
  titlePanel("Visualizing eGRID Data"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId="emission_type",
        label="Select Emission Type:",
        choices=c("Output Emission Rates", "Input Emission Rates", 
                    "Non-Baseload Output Emission Rates")
      ),
      selectInput(
        inputId="pollutant",
        label="Select Pollutant:",
        choices=c("CO2", "NOX", "SO2", "CH4", "N2O", "CO2eq")
      ),
      selectInput(
        inputId="geo_level",
        label="Select Geographic Level:",
        choices=c("eGRID Subregion", "State")
      ),
      textOutput("selection_summary")
    ),
    
    mainPanel(
      h3("Visualizations"),
      plotOutput("map_plot"),
      plotOutput("bar_chart")
    )
  )
)