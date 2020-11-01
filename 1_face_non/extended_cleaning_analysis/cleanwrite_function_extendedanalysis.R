#this function take raw_data and makes clean_data

clean_emg_extended <- function(data) {
  data %>%
    remove_empty(which = "cols") %>%
    rename(bin = ...1,
           trial1_brow = µV...2,
           trial1_cheek = µV...3,
           trial2_brow = ...7,
           trial2_cheek = ...8,
           trial3_brow = ...12,
           trial3_cheek = ...13,
           trial4_brow = ...17,
           trial4_cheek = ...18,
           trial5_brow = ...22,
           trial5_cheek = ...23,
           trial6_brow = ...27,
           trial6_cheek = ...28,
           trial7_brow = ...32,
           trial7_cheek = ...33,
           trial8_brow = ...37,
           trial8_cheek = ...38) %>%
    mutate(bin = c("bin_0", "bin_1", "bin_2", "bin_3", "bin_4", "bin_5", "bin_6", "bin_7", "bin_8", "bin_9", "bin_10", "bin_11", "bin_12", "bin_13","bin_14", "bin_15", "bin_16", "bin_17", "bin_18", "bin_19", "bin_20")) %>%
    mutate(bin_no = 0:20) %>%
    select(file_name, bin, bin_no, contains("trial")) %>%
    pivot_longer(cols = 4:19,
                 names_to = c("trial", "muscle"),
                 names_sep = "_",
                 values_to = "rms") %>%
    arrange(muscle, trial, bin_no)
}


#this function take raw_data, makes clean_data, AND writes that clean data to csv

cleanwrite_emg_extended <- function(data) {
  data %>%
    remove_empty(which = "cols") %>%
    rename(bin = ...1,
           trial1_brow = µV...2,
           trial1_cheek = µV...3,
           trial2_brow = ...7,
           trial2_cheek = ...8,
           trial3_brow = ...12,
           trial3_cheek = ...13,
           trial4_brow = ...17,
           trial4_cheek = ...18,
           trial5_brow = ...22,
           trial5_cheek = ...23,
           trial6_brow = ...27,
           trial6_cheek = ...28,
           trial7_brow = ...32,
           trial7_cheek = ...33,
           trial8_brow = ...37,
           trial8_cheek = ...38) %>%
    mutate(bin = c("bin_0", "bin_1", "bin_2", "bin_3", "bin_4", "bin_5", "bin_6", "bin_7", "bin_8", "bin_9", "bin_10", "bin_11", "bin_12", "bin_13","bin_14", "bin_15", "bin_16", "bin_17", "bin_18", "bin_19", "bin_20")) %>%
    mutate(bin_no = 0:20) %>%
    select(file_name, bin, bin_no, contains("trial")) %>%
    pivot_longer(cols = 4:19,
                 names_to = c("trial", "muscle"),
                 names_sep = "_",
                 values_to = "rms") %>%
    arrange(muscle, trial, bin_no) %>%
    write_csv(here("extended_cleaning_analysis","data", "clean_data", path = paste0("clean_", unique(.$file_name),".csv")))

}

