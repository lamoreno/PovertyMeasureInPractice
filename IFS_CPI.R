###CPI database
##First time using this code, install packages nedded
#install.packages("imfr")
##First step: call packages
library(imfr)
##Read the database_id inventory
imf_ids()
##Results:  CPI  :Consumer Price Index
##Results:  CPIH :Consumer Price Index Harmonized (CPIH) for collection
##Read the code list in each data
imf_codelist(database_id= 'IFS')
imf_codelist(database_id= 'CPI')
#show code in each list
imf_codes(codelist= 'CL_INDICATOR_CPI')
##Results:
##codes            description
##PCPI_IX   Consumer Price Index, All items
##PCPIF_IX    Food and non-alcoholic beverages
imf_codes(codelist= 'CL_UNIT_MULT')
imf_codes(codelist= 'CL_FREQ')
##codes description
##1     A      Annual
##2     B   Bi-annual
##3     Q   Quarterly
##4     M     Monthly
##5     D       Daily
##6     W      Weekly
imf_codes(codelist= 'CL_AREA_CPI')
##ISO2Code
imf_codes(codelist= 'CL_TIME_FORMAT')
## Download a data from the IMF
ifsMonthly<-imf_data(database_id= 'CPI', indicator= 'PCPI_IX', country = "all", start = 2000, end = current_year(), freq = "M", return_raw = FALSE ,print_url = FALSE, times = 3)
ifsQuarterly<-imf_data(database_id= 'CPI', indicator= 'PCPI_IX', country = "all", start = 2000, end = current_year(), freq = "Q", return_raw = FALSE,print_url = FALSE, times = 3)
ifsAnnual<-imf_data(database_id= 'CPI', indicator= 'PCPI_IX', country = "all", start = 2000, end = current_year(), freq = "A", return_raw = FALSE,print_url = FALSE, times = 3)
##Saving STATA
require(foreign)
write.dta(ifsMonthly,"ifsMonthly.dta")
write.dta(ifsQuarterly, "ifsQuarterly.dta")
write.dta(ifsAnnual, "ifsAnnual.dta")
