######################################
# sfm_exporter.R v2.1.0
######################################
# MIT Licence
# Copyright 2016-2017 Stefano Coretta
# stefanocoretta.altervista.org
######################################
# This script converts a tab delimited file or a Microsoft Excel spreadsheet
# with lexical data to a file with Standard Format Markers (Toolbox/FLEx SIL).
#
# Thanks to Hong Ooi and David Arenburg for providing the mapply function
# in stackoverflow.com (http://stackoverflow.com/questions/25666170/
# r-subsetting-dataframe-in-for-loop-with-double-and-single-brackets)
#
# Input: - a prompt let you choose the lexicon file
#        - the lexicon file is a tab delimited file (.txt or .tsv), a .csv file, or a .xls/.xlsx (Microsoft Office Excel) file
#        - the name of the columns in the file will be the markers (so, the lexeme
#          column should be called "\lx", the gloss column "\ge" and so on)
# Output: - the output file is .txt files named "lexicon-sfm" with SF markers
#
# Process: The script reads the lexicon file and appends the marker to each cell
# according to the name of the column. Empty cells are skipped. This avoids
# the presence of unecessary markers.
#####################################

library(tools)
library(gdata)

# Read the file into a data.frame
lexicon.file <- file.choose()
file.ext <- file_ext(lexicon.file)

if (file.ext %in% c("xlsx", "xls")) {
    lexicon <- gdata::read.xls(lexicon.file, stringsAsFactors=FALSE)
} else if (file.ext %in% c("txt", "tsv")) {
    lexicon <- read.delim(lexicon.file, stringsAsFactors=FALSE)
} else if (file.ext == csv) {
    lexicon <- read.csv(lexicon.file, stringsAsFactors=FALSE)
}

# Substitute X. prefix in col names with \
names(lexicon) <- sub("X.", "\\\\", names(lexicon))

# Propagate markers, avoid empty cells
lexicon[] <- mapply(function(x, n) {
  ifelse(x == "", "", paste(n, x))
}, lexicon, names(lexicon))

lapply(
    apply(lexicon, 1, function (x) {
        paste(c(x[x != ""]))
    }),
    cat,
    sep = "\n",
    file="lexicon-sfm.txt",
    append = TRUE
)

rm(lexicon,lexicon.file,file.ext)
