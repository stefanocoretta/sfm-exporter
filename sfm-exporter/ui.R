# ui.R

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("SFM exporter (Toolbox/FLEx SIL)"),

  sidebarLayout(
    sidebarPanel(
        p("Click on", code("Browse..."), "and select a", code(".csv"), "file. Then click on", code("Download"), "to download the SFM file.")
    ),
    mainPanel(
        fileInput("file", label = "1. Choose file"),
        p(strong("2. Click on Download to download the SFM file")),
        downloadButton("downloadData", label = "Download")
        )
  )
))
