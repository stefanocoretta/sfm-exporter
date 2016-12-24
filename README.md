# Spreadsheet/Tab to SFM file (SIL Toolbox/FLEx) [v1.1.0]

This repository contains two scripts for converting a file with lexical data to a [Standard Format Markers](http://www-01.sil.org/computing/shoebox/MDF_2000.pdf?_ga=GA1.2.1165924973.1480287656) file (SIL Toolbox/FLEx).

The `xls_to_sfm.R` script converts from a Microsoft Excel `.xlsx` file, while `tab_to_sfm.R` from a tab delimited file (`txt`, `.csv`, `.tsv`).

Thanks to Hong Ooi and David Arenburg for providing the implementation of a mapply function in [stackoverflow.com](http://stackoverflow.com/questions/25666170/r-subsetting-dataframe-in-for-loop-with-double-and-single-brackets).

**Input**:
- a prompt let you choose the lexicon file
- the lexicon file is a Microsoft Excel `.xlsx` file or a tab delimited file
- the name of the columns in the file will be the markers (so, the lexeme column should be called `\lx`, the gloss column `\ge` and so on)

**Output**:
- the output file is a `.txt` file named "lexicon-sfm" with SF markers

**Process**:
The script reads the lexicon file and appends the marker to each cell according to the name of the column. Empty cells are skipped. This avoids the presence of unecessary markers.
