# ui.R

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("SFM exporter (Toolbox/FLEx SIL)"),

  sidebarLayout(
    sidebarPanel(
        p("1. Click on", code("Browse..."), "and select a file."),
        p("2. Select a file type."),
        p("3. Click on", code("Download"), "to download the SFM file."),
        p("Report issues", a("here.", href = "https://github.com/stefanocoretta/sfm-exporter/issues"))
    ),
    mainPanel(
        fileInput("file", label = "1. Choose file"),
        selectInput(
            "file.ext",
            "2. Select file type:",
            list("tab separated", "comma separated", "Excel spreadsheet")
        ),
        p(strong("3. Click on Download to download the SFM file")),
        downloadButton("downloadData", label = "Download")
        )
  )
))
