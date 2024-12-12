#space to load libraries and manage data
library(shiny)
library(readxl)
library(dplyr)
library(here)
library(sf)
library(ggplot2)
library(rmapshaper)
library(tigris)

#read in datasets
subgrid_data<-read_excel(here("Data/Raw/SubgridData.xlsx"))
state_data<-read_excel(here("Data/Raw/StateData.xlsx"))

#clean subgrid data
subgrid_cleaned<-subgrid_data%>%
  setNames(as.character(subgrid_data[1,]))%>% #rename columns by abbreviated code
  slice(-1)%>% #remove the first row containing abbreviated codes
  
  #converts all columns except first three to numeric, year/code/name
  mutate(
    across(4:ncol(.),as.numeric) 
  )%>%
  
  #keep only columns of relevance to data (18 columns 6 x 3 selection)
  select( 
    "SUBRGN","SRNAME","SRNOXRTA","SRSO2RTA","SRCO2RTA","SRCH4RTA", 
    "SRN2ORTA","SRC2ERTA","SRNOXRA","SRSO2RA","SRCO2RA","SRCH4RA", 
    "SRN2ORA","SRC2ERA","SRNBNOX","SRNBSO2","SRNBCO2","SRNBCH4", 
    "SRNBN2O","SRNBC2E"
  )%>%
  
  #columns renamed in order to follow same logic
  rename(c( 
    "SRNOXNB"="SRNBNOX",
    "SRSO2NB"="SRNBSO2",
    "SRCO2NB"="SRNBCO2",
    "SRCH4NB"="SRNBCH4",
    "SRN2ONB"="SRNBN2O",
    "SRC2ENB"="SRNBC2E")
  )

#clean state data
state_cleaned<-state_data%>%
  setNames(as.character(state_data[1,]))%>% #rename columns by abbreviated code
  slice(-1)%>% #remove the first row containing abbreviated codes
  
  #converts all columns except first three to numeric, year/code/code
  mutate(
    across(4:ncol(.),as.numeric) 
  )%>%
  
  #keep only columns of relevance to data (18 columns 6 x 3 selection)
  select( 
    "PSTATABB","STNOXRTA","STSO2RTA","STCO2RTA","STCH4RTA", 
    "STN2ORTA","STC2ERTA", "STNOXRA", "STSO2RA","STCO2RA","STCH4RA", 
    "STN2ORA","STC2ERA","STNBNOX","STNBSO2","STNBCO2","STNBCH4", 
    "STNBN2O","STNBC2E"
  )%>%
  
  #columns renamed in order to follow same logic
  rename(c(
    "STNOXNB"="STNBNOX",
    "STSO2NB"="STNBSO2",
    "STCO2NB"="STNBCO2",
    "STCH4NB"="STNBCH4",
    "STN2ONB"="STNBN2O",
    "STC2ENB"="STNBC2E")
  )

#pulling in region shape files
subregions<-st_read("Data/Raw/egrid_subregions/eGRID2022_Subregions.shp")
subregions<-st_make_valid(subregions) #fix presence of invalid subregions
subregions_simplified<-rmapshaper::ms_simplify(subregions,keep=0.01) #simplify regions, datafile too large

#joining shapefile to data file
map_sr_data<-subgrid_cleaned%>%
  left_join(subregions_simplified,by=c("SUBRGN"="ZipSubregi")) #join by SUBRGN and ZipSubregi

#pull in state shape file from Tigris
us_states<-tigris::states(cb=TRUE,resolution="20m")

#joining shapefile to data
map_st_data<-state_cleaned%>%
  left_join(us_states,by=c("PSTATABB"="STUSPS")) # STUSPS is the state abbreviation
