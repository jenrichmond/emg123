

#this function take raw_data and makes clean_data

clean_emg <- function(data) { 
  data %>%
  remove_empty(which = "cols") %>%
  select(-4, -7, -10, -13, -16, -19, -22) %>%
  rename(bin = ...1, 
         trial1_brow = µV...2, 
         trial1_cheek = µV...3, 
         trial2_brow = Brow...6,
         trial2_cheek = Cheek...7, 
         trial3_brow = Brow...10, 
         trial3_cheek = Cheek...11, 
         trial4_brow = Brow...14, 
         trial4_cheek = Cheek...15,
         trial5_brow = Brow...18,
         trial5_cheek = Cheek...19,
         trial6_brow = Brow...22,
         trial6_cheek = Cheek...23, 
         trial7_brow = Brow...26, 
         trial7_cheek = Cheek...27,
         trial8_brow = Brow...30, 
         trial8_cheek = Cheek...31) %>%
  mutate(bin = c("bin_0", 
                 "bin_1", 
                 "bin_2", 
                 "bin_3", 
                 "bin_4", 
                 "bin_5", 
                 "bin_6", 
                 "bin_7", 
                 "bin_8", 
                 "bin_9", 
                 "bin_10")) %>%
  mutate(bin_no = 0:10) %>%
  select(file_name, bin, bin_no, contains("trial")) %>%
  pivot_longer(cols = 4:19, 
               names_to = c("trial", "muscle"), 
               names_sep = "_",
               values_to = "rms") %>%
  arrange(trial, bin_no) 
}


#this function take raw_data, makes clean_data, AND writes that clean data to csv

cleanwrite_emg <- function(data) { 
  data %>%
    remove_empty(which = "cols") %>%
    select(-4, -7, -10, -13, -16, -19, -22) %>%
    rename(bin = ...1, 
           trial1_brow = µV...2, 
           trial1_cheek = µV...3, 
           trial2_brow = Brow...6,
           trial2_cheek = Cheek...7, 
           trial3_brow = Brow...10, 
           trial3_cheek = Cheek...11, 
           trial4_brow = Brow...14, 
           trial4_cheek = Cheek...15,
           trial5_brow = Brow...18,
           trial5_cheek = Cheek...19,
           trial6_brow = Brow...22,
           trial6_cheek = Cheek...23, 
           trial7_brow = Brow...26, 
           trial7_cheek = Cheek...27,
           trial8_brow = Brow...30, 
           trial8_cheek = Cheek...31) %>%
    mutate(bin = c("bin_0", 
                   "bin_1", 
                   "bin_2", 
                   "bin_3", 
                   "bin_4", 
                   "bin_5", 
                   "bin_6", 
                   "bin_7", 
                   "bin_8", 
                   "bin_9", 
                   "bin_10")) %>%
    mutate(bin_no = 0:10) %>%
    select(file_name, bin, bin_no, contains("trial")) %>%
    pivot_longer(cols = 4:19, 
                 names_to = c("trial", "muscle"), 
                 names_sep = "_",
                 values_to = "rms") %>%
    arrange(trial, bin_no) %>%
    write_csv(here("R_cleaning","data", "clean_data", path = paste0("clean_", unique(.$file_name),".csv")))
    
}


