# Vignette-bootstrap

Contributors: Jiaxin Su, Sumeng Xu, Ziqian Zhao

## Vignette abstract:

This is the repository for Vignette project for Group 7 focusing on **bootstrapping**. We are going to introduce the resampling method -- bootstrapping-- in the following aspects:

-   the bootstrap sampling distribution.

-   bootstrap standard errors and confidence intervals.

-   how the bootstrap usually, but not always, works well.

Further, we will develop a model with bootstrap step by step to build better intuition on this method. Our data is from: [*https://www.kaggle.com/datasets/fatemehmehrparvar/obesity-levels*](https://www.kaggle.com/datasets/fatemehmehrparvar/obesity-levels){.uri} and we aim to *predict obesity levels*

## Repository contents:

-   `data` contains

    -   `Obesity_Raw.csv` is the original obesity dataset sourced from Kaggle, containing 2,111 observations and 17 variables. This dataset contains information used to estimate obesity levels in individuals from Mexico, Peru, and Colombia, based on their eating habits and physical conditions.
    -   `Obesity_sample.csv` is the dataset conting a smaller subset of the data set with 700 observations, through random sampling.
    -   `Clean_Data.R` is responsible for data preprocessing, ensuring that variables are transformed into their appropriate types for analysis.

-   `scripts` contains

    -   `Jiaxin_intro.qmd` provides an introduction to the basics of bootstrapping and explains its main concepts. It explains the key concepts of bootstrapping, including how it works, its purpose, and its applications.

    -   `basic_bootstrap.Rmd` explores the method for basic bootstrap, providing a step-by-step exploration of this statistical technique. It compares the mean of the original sample to that of single and 1,000 bootstrap samples, and examines the standard error derived from the original sample versus the standard error estimated from 1,000 bootstrap samples, highlighting the variability captured through resampling. There are two action items for you to practice.

    -   `Report_decision_tree.Rmd` presents the application of bootstrapping using decision trees, focusing on performance in classification prediction tasks and its impact.

-   `results` contains the result in tuned decision tree created using bootstrapping.

-   `Report` contains the written report with a step-by-step explanation of bootstrapping, including all files generated from `Jiaxin_intro.qmd`, `basic_bootstrap.Rmd`, and `Report_decision_tree.Rmd`.

## Step-by step instruction

Using the provided report file, you can follow a clear and structured guide to grasp the concept of bootstrapping and its practical applications. Each section is designed to build your understanding gradually, from the fundamentals of bootstrapping to advanced applications. The two action items provide an opportunity for you to practice performing bootstrapping on your own! By the end, you’ll feel confident in both understanding and implementing this powerful statistical method.

## Reference list:

[UCLA Intro to Bootstrapping](https://stats.oarc.ucla.edu/r/library/r-library-introduction-to-bootstrapping/)

<https://bookdown.org/jgscott/DSGI/the-bootstrap.html>

Continue reading: [Bootstrapping in Time Series Models](https://www.tandfonline.com/doi/epdf/10.1080/07474939608800344?needAccess=true)
