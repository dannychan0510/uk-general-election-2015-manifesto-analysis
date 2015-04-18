#  Exploring text analysis by analysing manifestos of key political parties in the 2015 UK General Elections

# Analysis Set Up ---------------------------------------------------------

# Set working directory
setwd("~/Documents/GitHub/uk-general-election-2015-manifesto-analysis")

# Convert PDF files to TXT files (requires XPDF to be installed - see README.md for more details
dest <- "~/Documents/GitHub/uk-general-election-2015-manifesto-analysis/Manifestos"
myfiles <- list.files(path = dest, pattern = "pdf",  full.names = TRUE)
lapply(myfiles, function(i) system(paste('"/Users/dannychan0510/Documents/GitHub/uk-general-election-2015-manifesto-analysis/xpdfbin-mac-3.04/bin64/pdftotext"', paste0('"', i, '"')), wait = FALSE))

# Set file paths of the manifestos
conservatives <- 'Manifestos/Conservatives Manifesto 2015.txt'
labour <- 'Manifestos/Labour Manifesto 2015.txt'
libdem <- 'Manifestos/Lib Dem Manifesto 2015.txt'
greenparty <- 'Manifestos/Green Party Manifesto 2015.txt'
ukip <- 'Manifestos/UKIP Manifesto 2015.txt'

# Reading in manifesto text
conservatives <- readChar(conservatives, file.info(libdem)$size, useBytes = TRUE)
labour <- readChar(labour, file.info(labour)$size, useBytes = TRUE)
libdem <- readChar(libdem, file.info(libdem)$size, useBytes = TRUE)
greenparty <- readChar(greenparty, file.info(greenparty)$size, useBytes = TRUE)
ukip <- readChar(ukip, file.info(ukip)$size, useBytes = TRUE)

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
