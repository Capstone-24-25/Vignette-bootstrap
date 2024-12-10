# Vignette-bootstrap

Contributors: Jiaxin Su, Sumeng Xu, Ziqian Zhao

## Vignette abstract:

This is the template repository for Vignette project for Group 7 focusing on **bootstrapping**. We are going to introduce the resampling method -- bootstrapping-- in the following aspects:

-   the bootstrap sampling distribution.

-   bootstrap standard errors and confidence intervals.

-   how the bootstrap usually, but not always, works well.

Further, we will develop a model with bootstrap step by step to build better intuition on this method. Our data is from: [*https://www.kaggle.com/datasets/fatemehmehrparvar/obesity-levels*](https://www.kaggle.com/datasets/fatemehmehrparvar/obesity-levels){.uri} and we aim to *predict obesity levels*

## Repository contents:

-   `data` contains the original raw obesity data and a random sample, which is a smaller subset of the data set with 700 observations.

-   `scripts` contains

    -   `Jiaxin_intro.qmd` provides an introduction to the basics of bootstrapping and explains its main concepts. It explains the key concepts of bootstrapping, including how it works, its purpose, and its applications.

    -   `basic_bootstrap.Rmd` explores the method for basic bootstrap, providing a step-by-step exploration of this statistical technique. It compares the mean of the original sample to that of single and 1,000 bootstrap samples, and examines the standard error derived from the original sample versus the standard error estimated from 1,000 bootstrap samples, highlighting the variability captured through resampling. There are two action items for you to practice.

    -   `Report_decision_tree.Rmd` presents the application of bootstrapping using decision trees, focusing on performance in classification prediction tasks and its impact.

-   `results` contains the result in tuned decision tree created using bootstrapping.

-   `Report` contains the written report with a step-by-step explanation of bootstrapping, including all files generated from `Jiaxin_intro.qmd`, `basic_bootstrap.Rmd`, and `Report_decision_tree.Rmd`.

## Step-by step instruction

Using the report file, you can follow along to understand the concept of bootstrapping and its application. The two action items provide an opportunity for you to practice performing bootstrapping on your own!

## Reference list:

[UCLA Intro to Bootstrapping](https://stats.oarc.ucla.edu/r/library/r-library-introduction-to-bootstrapping/)

<https://bookdown.org/jgscott/DSGI/the-bootstrap.html>

Continue reading: [Bootstrapping in Time Series Models](https://www.tandfonline.com/doi/epdf/10.1080/07474939608800344?needAccess=true)
