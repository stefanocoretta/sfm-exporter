# server.R

library(shiny)
library(tools)
library(gdata)

shinyServer(function(input, output) {
  output$downloadData <- downloadHandler(
    filename = function() { 
      paste("lexicon_sfm", ".txt", sep="") 
    },
    content = function(file) {
      inFile <- input$file
      
      if (input$file.ext == "Excel spreadsheet") {
          lexicon <- gdata::read.xls(inFile$datapath, stringsAsFactors=FALSE)
      } else if (input$file.ext == "tab separated") {
          lexicon <- read.delim(inFile$datapath, stringsAsFactors=FALSE)
      } else if (input$file.ext == "comma separated") {
          lexicon <- read.csv(inFile$datapath, stringsAsFactors=FALSE)
      }
      
      names(lexicon) <- sub("X.", "\\\\", names(lexicon))
      lexicon[] <- mapply(function(x, n) {
        ifelse(x == "", "xxx", paste(n, x))
      }, lexicon, names(lexicon))
      
      lexicon$n <- ""
      
      lapply(
          apply(lexicon, 1, function (x) {
              paste(c(x[x != "xxx"]))
          }),
          cat,
          sep = "\n",
          file = file,
          append = TRUE
      )
    }
  )
  
})
