library(readr)

# Code from Coursera course

census <- read_csv('https://raw.githubusercontent.com/opencasestudies/ocs-police-shootings-firearm-legislation/master/data/sc-est2017-alldata6.csv',
                   n_max = 236900)
census

counted15 <- read_csv("https://raw.githubusercontent.com/opencasestudies/ocs-police-shootings-firearm-legislation/master/data/the-counted-2015.csv")
counted15

suicide_all <- read_csv("https://raw.githubusercontent.com/opencasestudies/ocs-police-shootings-firearm-legislation/master/data/suicide_all.csv")
suicide_all

suicide_firearm <- read_csv("https://raw.githubusercontent.com/opencasestudies/ocs-police-shootings-firearm-legislation/master/data/suicide_firearm.csv")
suicide_firearm

library(readxl)
library(httr)

url = "https://github.com/opencasestudies/ocs-police-shootings-firearm-legislation/blob/master/data/Brady-State-Scorecard-2015.xlsx?raw=true"
GET(url, write_disk(tf <- tempfile(fileext = ".xlsx")))
brady <- read_excel(tf, sheet = 1)
brady

url = "https://github.com/opencasestudies/ocs-police-shootings-firearm-legislation/blob/master/data/table_5_crime_in_the_united_states_by_state_2015.xls?raw=true"
GET(url, write_disk(tf <- tempfile(fileext = ".xls")))
crime <- read_excel(tf, sheet = 1, skip = 3)
crime

url = "https://github.com/opencasestudies/ocs-police-shootings-firearm-legislation/blob/master/data/LND01.xls?raw=true"
GET(url, write_disk(tf <- tempfile(fileext = ".xls")))
land <- read_excel(tf, sheet = 1)
land

library(rvest)
library(tibble)

url <- read_html("https://web.archive.org/web/20210205040250/https://www.bls.gov/lau/lastrk15.htm")
out <- html_nodes(url, "table") %>%
  .[2] %>%
  html_table(fill = TRUE) 
unemployment <- as_tibble(out[[1]]) 
unemployment

library(here)
save(census, counted15, suicide_all, suicide_firearm, brady, crime, land, unemployment , file = here::here("data", "raw_data", "case_study_2.rda"))
