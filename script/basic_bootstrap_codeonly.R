library(tidyverse)
library(mosaic)
load("data/Obesity_sample.RData")
set.seed(1970)


# Plot a histogram of the sample weights, visualizing the distribution of the Weight variable
sample_weight <- ggplot(Obesity_sample) + 
  geom_histogram(aes(x = Weight), binwidth=5)
# calculate the mean weight from the sample dataset, which is around 85.94.
sample_weightm<-mean(~Weight, data=Obesity_sample) 

# Perform a single bootstrap using the resample function from the mosaic package
# This process creates a bootstrap sample by resampling the original dataset with replacement
sample_weight_bootstrap = mosaic::resample(Obesity_sample)
mean(~Weight, data=sample_weight_bootstrap)

# Now perform 1000 bootstrap iterations
# calculate the mean weight for each bootstrap sample. 
boot_weight = do(10000)*mean(~Weight, data=mosaic::resample(Obesity_sample))

# Visualize the distribution of the means from the 1000 bootstrap samples
# The histogram shows the variability in the sample means. 
ggplot(boot_weight) + 
  geom_histogram(aes(x=mean))

# standard error 
#origional sd error
n <- nrow(Obesity_sample)
std_err_weight <- sd(~Weight, data = Obesity_sample) / sqrt(n)

#boot sd error
boot_std_error <- boot_weight %>%
  summarize(std_err_weight = sd(mean)) 


#action 1 
confint(boot_weight, level = 0.95)

# action 2 : Perform the same bootstrapping process for weight, but now split by Gender
# answer:
# Calculate the mean weight for each gender in the sample dataset
mean(Weight ~ Gender, data=Obesity_sample)

# Calculate the difference in mean weight between genders
# This represents the observed difference in the dataset
diffmean(Weight ~ Gender, data=Obesity_sample)
# Perform 10,000 bootstrap iterations to find the difference in means for each bootstrap sample
boot_weight_gender = do(10000)*diffmean(Weight ~ Gender, data=mosaic::resample(Obesity_sample))
#visual 
ggplot(boot_weight_gender) + 
  geom_histogram(aes(x=diffmean))

#the 95% confidence interval represnets the range where the true difference in means is likely
confint(boot_weight_gender, level = 0.95)


