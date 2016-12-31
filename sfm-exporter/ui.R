# ui.R

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("SFM exporter (Toolbox/FLEx SIL)"),

  sidebarLayout(
    sidebarPanel(
      
      fileInput("file", label = "Choose file:")
      
    ),
    
    mainPanel(
      downloadButton("downloadData", label = "Download")
    )
  )
))
