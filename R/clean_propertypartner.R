#install.packages("readxl")
library(readxl)
#install.packages("tidyverse")
library(tidyverse)

#install.packages("broom")
library(broom)
## read in propertypartner data downloaded from: https://www.propertypartner.co/s#/data-view
property_partner <- read_excel("data/dirty_property_partner.xlsx",
                               skip = 1)


##look at property_partner
glimpse(property_partner)
property_partner


##clean: rename ID variable, seperate location into multiple variables, rename link
property_partner <- property_partner %>% 
rename(id = X__1,
       link = X__2) %>% 
  separate(Location, c("Town", "County", "Postcode"), sep = ", ") %>% 
  select(-Location__1)


write_csv(property_partner, path = "data/clean_property_partner.csv")

  