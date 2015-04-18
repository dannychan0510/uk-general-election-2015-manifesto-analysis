#  Exploring text analysis by analysing manifestos of key political parties in the 2015 UK General Elections

# Analysis Set Up ---------------------------------------------------------

# Set working directory
setwd("~/Documents/GitHub/uk-general-election-2015-manifesto-analysis")

# Set file paths of the manifestos
conservatives <- 'Manifestos/Conservatives Manifesto 2015 (text only).txt'
labour <- 'Manifestos/Labour Manifesto 2015 (text only).txt'
libdem <- 'Manifestos/Lib Dem Manifesto 2015 (text only).txt'
greenparty <- 'Manifestos/Green Party Manifesto 2015 (text only).txt'
ukip <- 'Manifestos/UKIP Manifesto 2015 (text only).txt'

# Reading in manifesto text
conservatives <- readChar(conservatives, file.info(libdem)$size)
labour <- readChar(labour, file.info(labour)$size)
libdem <- readChar(libdem, file.info(libdem)$size)
greenparty <- readChar(greenparty, file.info(greenparty)$size)
ukip <- readChar(ukip, file.info(ukip)$size)

# Convert text to UTF8 form
conservatives <- iconv(enc2utf8(conservatives), sub="byte")
labour <- iconv(enc2utf8(labour), sub="byte")
libdem <- iconv(enc2utf8(libdem), sub="byte")
greenparty <- iconv(enc2utf8(greenparty), sub="byte")
ukip <- iconv(enc2utf8(ukip), sub="byte")


# Loading in strcount function
strcount <- function(x, pattern, split){
  unlist(lapply(strsplit(x, split),function(z) na.omit(length(grep(pattern, z)))))
}

strcount(tolower(libdem), "nhs", " ")
strcount(tolower(conservatives), "nhs", " ")



# Sources Used ------------------------------------------------------------


# https://aurelienmadouasse.wordpress.com/2012/05/24/r-code-how-the-to-count-the-number-of-occurrences-of-a-substring-within-a-string/
# http://johnvictoranderson.org/?p=115

docs <- Corpus(DirSource("~/Documents/GitHub/uk-general-election-2015-manifesto-analysis/Manifestos"), readerControl = list(reader=readPDF))
