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
      lexicon <- read.csv(inFile$datapath)
      names(lexicon) <- sub("X.", "\\\\", names(lexicon))
      lexicon[] <- mapply(function(x, n) {
        ifelse(x == "", "", paste(n, x))
      }, lexicon, names(lexicon))
      lapply(
          apply(lexicon, 1, function (x) {
              paste(c(x[x != ""]))
          }),
          cat,
          sep = "\n",
          file = file,
          append = TRUE
      )
    }
  )
  
})
