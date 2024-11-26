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
#描述图

sample_weightm<-mean(~Weight, data=Obesity_sample) 
#85.34 

#single bootstrap
sample_weight_bootstrap = mosaic::resample(Obesity_sample)
mean(~Weight, data=sample_weight_bootstrap)
#85.79 

#1000 bootstrap 
boot_weight = do(10000)*mean(~Weight, data=mosaic::resample(Obesity_sample))

ggplot(boot_weight) + 
  geom_histogram(aes(x=mean))
#This histogram represents our bootstrap sampling distribution, 
#which is designed to approximate the true sampling distribution we talked about in the previous lesson.

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
#True or false: this histogram, and the associated confidence interval, 
# tell us that about 95% of all individuals weight between 83.48 and 87.2? 

# action 2 : try to do the same bootstrapping process for weight based on Gender 
mean(Weight ~ Gender, data=Obesity_sample)

diffmean(Weight ~ Gender, data=Obesity_sample)
# Male weight about 6.83 more than female            ? ????????????????????????????
# bootstrap 
boot_weight_gender = do(10000)*diffmean(Weight ~ Gender, data=mosaic::resample(Obesity_sample))
#visual 
ggplot(boot_weight_gender) + 
  geom_histogram(aes(x=diffmean))

confint(boot_weight_gender, level = 0.95)
# with a difference in means of somewhere between 3.11-10.57


