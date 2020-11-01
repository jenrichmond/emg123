library(tidyverse)
library(here)
library(janitor)


clean_emg <- function(data) {
  data %>%
    remove_empty(which = "cols") %>%
    clean_names() %>%
    rename(bin = cmt_text,
           trial1_brow = rms_2,
           trial1_cheek = rms_3,
           trial2_brow = brow_6,
           trial2_cheek = cheek_7,
           trial3_brow = brow_10,
           trial3_cheek = cheek_11,
           trial4_brow = brow_14,
           trial4_cheek = cheek_15,
           trial5_brow = brow_18,
           trial5_cheek = cheek_19,
           trial6_brow = brow_22,
           trial6_cheek = cheek_23,
           trial7_brow = brow_26,
           trial7_cheek = cheek_27,
           trial8_brow = brow_30,
           trial8_cheek = cheek_31) %>%
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
                 names_sep = "_", values_to = "rms") %>%
    arrange(trial)

}
cleanwrite_emg <- function(data) {
  data %>%
    remove_empty(which = "cols") %>%
    clean_names() %>%
    rename(bin = cmt_text,
           trial1_brow = rms_2,
           trial1_cheek = rms_3,
           trial2_brow = brow_6,
           trial2_cheek = cheek_7,
           trial3_brow = brow_10,
           trial3_cheek = cheek_11,
           trial4_brow = brow_14,
           trial4_cheek = cheek_15,
           trial5_brow = brow_18,
           trial5_cheek = cheek_19,
           trial6_brow = brow_22,
           trial6_cheek = cheek_23,
           trial7_brow = brow_26,
           trial7_cheek = cheek_27,
           trial8_brow = brow_30,
           trial8_cheek = cheek_31) %>%
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
                 names_sep = "_", values_to = "rms") %>%
    arrange(trial) %>%
    write_csv(here("data", "clean_data", path = paste0("clean_", unique(.$file_name),".csv")))


}

