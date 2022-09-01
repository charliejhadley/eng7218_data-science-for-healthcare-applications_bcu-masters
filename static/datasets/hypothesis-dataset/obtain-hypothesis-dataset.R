library(tidyverse)



# TODO: Encode the name of the paper: A hypothesis is a liability



data_male <- mutate(read_table(here::here("static", "datasets", "hypothesis-dataset/data9b_m.txt")), gender = "male")
data_female <- mutate(read_table(here::here("static", "datasets", "hypothesis-dataset/data9b_w.txt")), gender = "female")

data_hypothesis <- data_male %>%
  bind_rows(data_female)

data_hypothesis %>%
  write_csv(here::here("static", "datasets", "hypothesis-dataset/hypothesis-data.txt"))

