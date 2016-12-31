# ui.R

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("SFM (Toolbox/FLEx) Document exporter"),

  sidebarLayout(
    sidebarPanel(
      
      fileInput("file", label = "Choose file:")
      
    ),
    
    mainPanel(
      downloadButton("downloadData", label = "Download")
    )
  )
))
