# Exploring text analysis by analysing manifestos of key political parties in the 2015 UK General Elections

## Introduction
A simple text analysis on the manifestos of the key political parties in UK's 2015 General Elections.

## Methodology
This piece of analysis follows closely The Guardian's Data Blog's manifesto analysis methodology.

We take the PDF files of the five key political parties that we have chosen (Conservatives, Labour, Liberal Democrats, Green Party and UKIP), and we use `R`, with the help of `xpdf` to help us get a text only version of the manifestos.

We then do a count of the words that The Guardian Data Blog has chosen as keywords that represents the key issues covered in each party's manifesto (listed in the table below).

Key Issue          | Keywords
:----------------- | :-----------------
Health             | health/NHS/doctors/nurses/GPS      
Education          | education/schools/universities        
Inequality         | inequality/poverty/wage/pay
Spending           | spend/spends/spending/investment/invested/investing/invest
Taxes              | tax/taxpayers/taxes/VAT
Crime and policing | crime/crimes/police/policing/prisons
Jobs/employment    | unemployment/jobs/employment/workers
Economy            | economy
Deficit/debt       | deficit/debt/borrowing/cuts
Housing            | housing/buyers/rent/renters/property/house/housebuilding
Immigration        | immigration/immigrants/migration/migrants
Europe             | Europe/European/EU/Foreign

Given the complexity of language, this could mean that some issues have been missed out or overrepresented.

However, by comparing the three main parties across the week we will be able to get a picture of how much importance they have placed on the issues of most concern to the electorate.

## Methodology
Files in this repo:
- `Manifestos` folder: contains the PDFs of the manifestos used in this analysis
- `xpdfbin-mac-3.04` & `xpdfbin-win-3.04`: contains the `xpdf.exe` that is used by the R script to strip the text out of the PDF files. One folder is for Mac computers, whilst the other folder is for Windows computers.
- `analysis.R`: contains the R script for this manifesto analysis
- `keyword_count.csv`: contains the output file of this analysis, which is a .csv file of the number of times a key issue has been mentioned in each party's manifestos.
