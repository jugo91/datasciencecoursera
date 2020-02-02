### Plots for exploratory data analysis

  setwd("D:/R/Exploratory_Data_Ana/exdata_data_household_power_consumption")
  
## load libraries
  library(dplyr)
  library(lubridate)
  
## set locale
  
  
  Sys.setlocale("LC_TIME", "English")
  
  weekdays(Sys.Date()+0:6)

## read in the data and filter for the desired dates
  household_power_consumption <- read_delim("household_power_consumption.txt",  ";", escape_double = FALSE, trim_ws = TRUE, na = c("", "NA","?"))
  names(household_power_consumption)
  household_power_consumption <- household_power_consumption %>%
                                        mutate(Date = as.Date(Date,format = "%d/%m/%Y")) %>%
                                        filter(Date >= as.Date("01.02.2007",format = "%d.%m.%Y") & Date <= as.Date("02.02.2007",format = "%d.%m.%Y"))%>%
                                        mutate(Datetime = paste0(Date," ",Time)) %>%
                                          mutate(Datetime= as_datetime(Datetime))
                                        
  

# create the desired plots
  source("./plot1.R")
  source("./plot2.R")
  source("./plot3.R")
  