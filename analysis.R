# WORK IN PROGRESS


install.packages("tm")
library(tm)
setwd("~/GitHub/uk-general-election-2015-manifesto-analysis")

fileName <- 'C:/Users/895284/Documents/GitHub/uk-general-election-2015-manifesto-analysis/Manifestos/Lib Dem Manifesto 2015 (text version from web).txt'
test <- readChar(fileName, file.info(fileName)$size)

strcount <- function(x, pattern, split){
  
  unlist(lapply(
    strsplit(x, split),
    function(z) na.omit(length(grep(pattern, z)))
  ))
  
}


class(test)
strcount(tolower(test), "nhs", " ")
test

https://aurelienmadouasse.wordpress.com/2012/05/24/r-code-how-the-to-count-the-number-of-occurrences-of-a-substring-within-a-string/


length(grep("a", test))


http://johnvictoranderson.org/?p=115