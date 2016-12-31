######################################
# tab_to_sfm.R
######################################
# Copyright 2016 Stefano Coretta
#
# stefanocoretta.altervista.org
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
######################################
# This script converts a tab delimited file (exported from a spreadsheet)
# with lexical data to a file with Standard Format Markers (Toolbox/FLEx SIL).
#
# Thanks to Hong Ooi and David Arenburg for providing the mapply function
# in stackoverflow.com (http://stackoverflow.com/questions/25666170/
# r-subsetting-dataframe-in-for-loop-with-double-and-single-brackets)
#
# Input: - a prompt let you choose the lexicon file
#        - the lexicon file is a tab delimited .txt file
#        - the name of the columns in the file will be the markers (so, the lexeme
#          column should be called "\lx", the gloss column "\ge" and so on)
# Output: - the output file is .txt files named "lexicon-sfm" with SF markers
#
# Process: The script reads the lexicon file and appends the marker to each cell
# according to the name of the column. Empty cells are skipped. This avoids
# the presence of unecessary markers.
#####################################

# Read the tab file into a data.frame
lexicon <- read.delim(file.choose(),stringsAsFactors=FALSE)

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

rm(lexicon)
