library(readr)
library(dplyr)
Obesity_Raw <- read_csv("data/Obesity_Raw.csv")
View(Obesity_Raw)

Obesity_sample <- Obesity_Raw %>% sample_n(500)

save(Obesity_sample, file = "data/Obesity_sample.RData")
