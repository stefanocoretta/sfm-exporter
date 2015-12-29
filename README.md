# Spreadsheet to SFM file (Toolbox/FLEx SIL)

This script converts a Microsoft Excel .xlsx file with lexical data to a file with Standard Format Markers (Toolbox/FLEx SIL).

Thanks to Hong Ooi and David Arenburg for providing the mapply function in stackoverflow.com (http://stackoverflow.com/questions/25666170/r-subsetting-dataframe-in-for-loop-with-double-and-single-brackets)

Input:
- a prompt let you choose the lexicon file
- the lexicon file is a Microsoft Excel .xlsx file
- the name of the columns in the file will be the markers (so, the lexeme column should be called "\lx", the gloss column "\ge" and so on)

Output:
- the output file is .txt files named "lexicon-sfm" with SF markers
 
Process: The script reads the lexicon file and appends the marker to each cell according to the name of the column. Empty cells are skipped. This avoids the presence of unecessary markers.
