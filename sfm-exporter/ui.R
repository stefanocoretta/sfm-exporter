# ui.R

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("SFM exporter (Toolbox/FLEx SIL)"),

  sidebarLayout(
    sidebarPanel(
      
      fileInput("file", label = "1. Choose file:")
      
    ),
    
    mainPanel(
        p("2. Click on", strong("Download"), "to download the SFM file."),
      downloadButton("downloadData", label = "Download")
    )
  )
))
