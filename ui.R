library(shiny)

ui<-fluidPage(
  titlePanel("Visualizing eGRID Data"),
  h4("ENV872 Final Project by Camber Vincent"), #add subtitle
  
  sidebarLayout(
    sidebarPanel(
      helpText(HTML(
        "This dashboard visualizes the US EPA's Emissions & Generation Resource Integrated Database 
        for different geographic levels, pollutants, and emission rate types. Use the dropdowns below
        to explore subregion or state-level emissions for 2022. See the associated information about this 
        project at 
        <a href='https://github.com/CamberV/Vincent_ENV872_EDA_FinalProject'>
        the following GitHub repository</a>.")
      ),
      
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
      selectInput(
        inputId="sort_order",
        label="Bar Chart Sort Order:",
        choices=c("Alphabetical", "Descending by Value")
      ),
    ),
    
    mainPanel(
      h3("Map Visualization"),
      plotOutput("map_plot",height="500px"),
      
      h3("Bar Chart"),
      plotOutput("bar_chart",height="400px")
    )
  )
)