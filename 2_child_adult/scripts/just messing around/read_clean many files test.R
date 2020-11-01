# load packages
library(tidyverse)
library(readxl)
library(here)

# call the functions

source(here("riley_cleaning_functions.R"))


# define a path where the testdata lives

file_path <- here("testdata")

# get a list of files at that file_path
file_list <- list.files(path = file_path, pattern='*.xlsx')

# use map to read_excel all of those files, adding a file_name variable to each one

rawemg_list <- file_list %>% 
  map(~ read_excel(path = here("testdata", .x), range = "A2:AE13")  %>%
        mutate("file_name" = .x))

# checks that it has read teh raw data by pulling the 1st item of the list
emgtest1 <- rawemg_list[[1]]

# uses map to cleanwrite_emg on all items in teh rawemg list
cleanemg_list <- rawemg_list %>%
  map(~ cleanwrite_emg(.x))

# checking that the cleanemg_list contains cleaned data by pulling teh 3rd item of the list
cleantest3<- cleanemg_list[[3]]
