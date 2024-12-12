library(shiny)

ui<-fluidPage(
  titlePanel("Visualizing eGrid Data"),
  sidebarLayout(
    sidebarPanel(
      p("Selections")
    ),
    mainPanel(
      p("Visualization")
    )
  )
)