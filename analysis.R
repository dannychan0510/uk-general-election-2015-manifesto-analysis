# WORK IN PROGRESS

setwd("~/GitHub/uk-general-election-2015-manifesto-analysis")

libdem <- 'C:/Users/895284/Documents/GitHub/uk-general-election-2015-manifesto-analysis/Manifestos/Lib Dem Manifesto 2015 (text only).txt'

conservatives <- 'C:/Users/895284/Documents/GitHub/uk-general-election-2015-manifesto-analysis/Manifestos/Conservatives Manifesto 2015 (text only).txt'

libdem <- readChar(libdem, file.info(libdem)$size)
conservatives <- readChar(conservatives, file.info(conservatives)$size)


strcount <- function(x, pattern, split){
  
  unlist(lapply(
    strsplit(x, split),
    function(z) na.omit(length(grep(pattern, z)))
  ))
  
}

strcount(tolower(libdem), "nhs", " ")
strcount(tolower(conservatives), "nhs", " ")

# https://aurelienmadouasse.wordpress.com/2012/05/24/r-code-how-the-to-count-the-number-of-occurrences-of-a-substring-within-a-string/
# http://johnvictoranderson.org/?p=115