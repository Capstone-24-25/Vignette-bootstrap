library(tidyverse)
library(mosaic)
load("data/Obesity_sample.RData")

#intro data 

head(Obesity_sample)
#sample mean
sample_weight <- ggplot(Obesity_sample) + 
  geom_histogram(aes(x = Weight), binwidth=5)

sample_age <- ggplot(Obesity_sample) + 
  geom_histogram(aes(x = Age), binwidth=5)

sample_weightm<-mean(~Weight, data=Obesity_sample) 
#single bootstrap
sample_weight_bootstrap = mosaic::resample(Obesity_sample)
mean(~Weight, data=sample_weight_bootstrap)

#1000 bootstrap 
boot_weight = do(10000)*mean(~Weight, data=mosaic::resample(Obesity_sample))

ggplot(boot_weight) + 
  geom_histogram(aes(x=mean))

# standard error 
#origional sd error
Obesity_sample%>%summarize(std_err_weight = sd(mean))
sd<-sd(~Weight, data=Obesity_sample)
sd/sqrt(700) #0.9455
#boot sd error
boot_weight %>%
  summarize(std_err_weight = sd(mean))  #0.9329 
# they are supposed to be similar 


#action 1 
confint(boot_weight, level = 0.95)

# action 2 : try to do the same bootstrapping process for weight based on Gender 
mean(Weight ~ Gender, data=Obesity_sample)

diffmean(Weight ~ Gender, data=Obesity_sample)


boot_weight_gender = do(10000)*diffmean(Weight ~ Gender, data=mosaic::resample(Obesity_sample))
#visual 
ggplot(boot_weight_gender) + 
  geom_histogram(aes(x=diffmean))

confint(boot_weight_gender, level = 0.95)


