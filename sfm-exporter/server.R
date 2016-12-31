# server.R

library(shiny)

shinyServer(function(input, output) {
  output$downloadData <- downloadHandler(
    filename = function() { 
      paste("lexicon_sfm", ".txt", sep="") 
    },
    content = function(file) {
      inFile <- input$file
      lexicon <- read.delim(inFile$datapath)
      names(lexicon) <- sub("X.", "\\\\", names(lexicon))
      lexicon[] <- mapply(function(x, n) {
        ifelse(x == "", "", paste(n, x))
      }, lexicon, names(lexicon))
       cat(do.call(paste, c(lexicon, sep="\r\n")), file = file, sep="\r\n")
    }
  )
  
})
