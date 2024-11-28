library(dplyr)
library(tidymodels)
library(tidyverse)
library(recipes)
library(ggplot2)
library(mosaic)

load("data/Obesity_sample.RData")

# summary(Obesity_sample)

# Without Bootstrap

# Parition training and testing 
set.seed(1234)
partitions <- Obesity_sample %>%
  initial_split(prop = 0.8, strata = NObeyesdad)
Obesity_train <- training(partitions)
Obesity_test <- testing(partitions)

Obesity_folds <- vfold_cv(Obesity_train , v = 5, strata = NObeyesdad)

# See Distribution of response variable
without_bootstrap<-ggplot(Obesity_train, aes(x = NObeyesdad )) +
  geom_bar(fill = "steelblue", color = "black", alpha = 0.7) +
  labs(x = "Obesity Status", 
       y = "Frequency",
       title = "Obesity Status without Bootstrap")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Creating Receipe using all varaibles
Obesity_recipe <-recipe(NObeyesdad ~ ., data = Obesity_train)%>% 
  step_dummy(all_nominal_predictors()) %>%
  step_center(all_predictors()) %>% 
  step_scale(all_predictors())

# Creating Decision Tree Model
# Tuning cost_complexity
Obesity_tree <- decision_tree(cost_complexity = tune()) %>%
  set_engine("rpart") %>% 
  set_mode("classification")

# Creating Decision Tree Workflow
Obesity_workflow <- workflow() %>% 
  add_model(Obesity_tree) %>% 
  add_recipe(Obesity_recipe)

param_grid <- grid_regular(cost_complexity(range = c(-3, -1)), levels = 10)


# Tune the model
Obesity_tune_tree <- tune_grid(
  Obesity_workflow,
  resamples = Obesity_folds,
  grid = param_grid,
  metrics = metric_set(roc_auc)
)

# save(Obesity_tune_tree, file = "results/Obesity_tune_tree.RData")

autoplot(Obesity_tune_tree)

# Decision Tree with Bootstrap

Boot_Obesity_train <- resample(Obesity_train,times = 1000)

Boot_Obesity_train<-Boot_Obesity_train %>% select(-orig.id)

# See Distribution of response variable
with_bootsrap <- ggplot(Boot_Obesity_train, aes(x = NObeyesdad )) +
  geom_bar(fill = "steelblue", color = "black", alpha = 0.7) +
  labs(x = "Obesity Status", 
       y = "Frequency",
       title = "Obesity Status with Bootstrap")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

par(mfrow = c(1, 2))
without_bootstrap
with_bootsrap


# Creating Receipe using all varaibles
Obesity_recipe_bt <-recipe(NObeyesdad ~ ., data = Boot_Obesity_train)%>% 
  step_dummy(all_nominal_predictors()) %>%
  step_center(all_predictors()) %>% 
  step_scale(all_predictors())

# Creating Decision Tree Model

# Creating Decision Tree Workflow for bootstrapping sample
Obesity_workflow_bt <- workflow() %>% 
  add_model(Obesity_tree) %>% 
  add_recipe(Obesity_recipe_bt)

# Tune the model
Obesity_tune_tree_bt <- tune_grid(
  Obesity_workflow_bt,
  resamples = Obesity_folds,
  grid = param_grid,
  metrics = metric_set(roc_auc)
)

# save(Obesity_tune_tree_bt, file = "results/Obesity_tune_tree_bt.RData")

autoplot(Obesity_tune_tree_bt)

show_best(Obesity_tune_tree, metric = "roc_auc", n=1)
show_best(Obesity_tune_tree_bt, metric = "roc_auc", n=1)
