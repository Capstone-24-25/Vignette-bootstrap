library(readr)
library(dplyr)
Obesity_Raw <- read_csv("data/Obesity_Raw.csv")
View(Obesity_Raw)

# Preprocessing
# Making variables into their desired type

Obesity_Raw<-Obesity_Raw %>% 
  mutate(Gender = as.factor(Gender)) %>% 
  mutate(family_history_with_overweight = as.factor(family_history_with_overweight)) %>% 
  mutate(FAVC = as.factor(FAVC)) %>% 
  mutate(SMOKE = as.factor(SMOKE)) %>% 
  mutate(SCC = as.factor(SCC)) %>% 
  mutate(CAEC = as.factor(CAEC)) %>% 
  mutate(CALC = as.factor(CALC)) %>% 
  mutate(MTRANS = as.factor(MTRANS)) %>% 
  mutate(NObeyesdad = as.factor(NObeyesdad))

Obesity_sample <- Obesity_Raw %>% sample_n(700)



save(Obesity_sample, file = "data/Obesity_sample.RData")
