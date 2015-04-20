#  Exploring text analysis by analysing manifestos of key political parties in the 2015 UK General Elections

# Analysis Set Up ---------------------------------------------------------

# Set working directory
setwd("~/Documents/GitHub/uk-general-election-2015-manifesto-analysis")

# Load relevant libraries
library(stringr)
library(data.table)
library(plyr)

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
conservatives <- readChar(conservatives, file.info(conservatives)$size, useBytes = TRUE)
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

# Remove unnecessary objects
rm(dest, myfiles)


# Count analysis of key words ---------------------------------------------

# Generate list of words to count (taken from )
health <- c("\\<health\\>", "\\<nhs\\>", "\\<doctors\\>", "\\<nurses\\>", "\\<gps\\>")
education <- c("\\<education\\>", "\\<schools\\>", "\\<universities\\>")
inequality <- c("\\<inequality\\>", "\\<poverty\\>", "\\<wage\\>", "\\<pay\\>")
spending <- c("\\<spend\\>", "\\<spends\\>", "\\<spending\\>", "\\<investment\\>", "\\<invested\\>", "\\<investing\\>", "\\<invest\\>")
taxes <- c("\\<tax\\>", "\\<taxpayers\\>", "\\<taxes\\>", "\\<vat\\>")
crime <- c("\\<crime\\>", "\\<crimes\\>", "\\<police\\>", "\\<policing\\>", "\\<prisons\\>")
jobs <- c("\\<jobs\\>", "\\<unemployment\\>", "\\<employment\\>", "\\<workers\\>")
economy <- c("\\<economy\\>")
deficit <- c("\\<deficit\\>", "\\<debt\\>", "\\<borrowing\\>", "\\<cuts\\>")
housing <- c("\\<housing\\>", "\\<buyers\\>", "\\<rent\\>", "\\<renters\\>", "\\<property\\>", "\\<house\\>", "\\<housebuilding\\>")
immigration <- c("\\<immigration\\>", "\\<immigrants\\>", "\\<migration\\>", "\\<migrants\\>")
europe <- c("\\<europe\\>", "\\<european\\>", "\\<eu\\>", "\\<foreign\\>")
issues <- c(health, education, inequality, spending, taxes, crime, jobs, economy, deficit, housing, immigration, europe)

# Get word count for keywords for key political parties
keywordcount_conservatives <- str_count(tolower(conservatives), issues)
keywordcount_labour <- str_count(tolower(labour), issues)
keywordcount_libdem <- str_count(tolower(libdem), issues)
keywordcount_greenparty <- str_count(tolower(greenparty), issues)
keywordcount_ukip <- str_count(tolower(ukip), issues)

# Get list of keywords
keywords <- c(health, education, inequality, spending, taxes, crime, jobs, economy, deficit, housing, immigration, europe)

# Generate issues column
key_issues <- c(rep("Health", length(health)), rep("Education", length(education)), rep("Inequality", length(inequality)), rep("Spending", length(spending)), rep("Taxes", length(taxes)), rep("Crime", length(crime)), rep("Jobs", length(jobs)), rep("Economy", length(economy)), rep("Deficit", length(deficit)), rep("Housing", length(housing)), rep("Immigration", length(immigration)), rep("Europe", length(europe)))     

# Combine into one final table
final <- data.frame(key_issues, keywords, keywordcount_conservatives, keywordcount_labour, keywordcount_libdem, keywordcount_greenparty, keywordcount_ukip)

final <- aggregate(final[3:7], by=list(key_issues), FUN = sum)

names(final) <- c("Issues", "Conservatives", "Labour", "Liberal Democrats", "Green Party", "UKIP")

# Remove other objects
rm(list = setdiff(ls(), "final"))

# Export as .csv file
write.csv(final, "keyword_count.csv")


# Test --------------------------------------------------------------------

# Test to see what gets counted usingf str_count
# test1 <- c("spending spend spends spend, spend. spends.")
# test2 <- c("\\<spending\\>", "\\<spend\\>", "\\<spends\\>")
# str_count(test1, test2)

