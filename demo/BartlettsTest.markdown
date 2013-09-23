% Rapport package team
% Bartlett's test
% 2011-04-26 20:25 CET

-   Description
    -   Introduction
    -   Normality assumption
    -   Test results

-   Description
    -   Introduction
    -   Normality assumption
    -   Test results

-   Description
    -   Introduction
    -   Normality assumption
    -   Test results


Description
-----------

This template will run the Bartlett's test to check the equality of
variances between groups.

### Introduction

Bartlett's test is used to test the homogeneity of the variances, in
other words the equality of the tested variable's variances across the
groups. With checking that we want to find if the two groups are coming
from the same population.

Homogeneity is useful to being tested, because that is an assumption of
the One-Way ANOVA.

#### References

-   Snedecor, George W. and Cochran, William G. (1989). *Statistical
    Methods*. Iowa State University Press

### Normality assumption

The Bartlett's test has an assumption of normality, thus one should
obtain the information if the distribution of the tested variable had a
normal distribution.

We will use *Shapiro-Wilk*, *Lilliefors* and *Anderson-Darling* tests to
screen departures from normality in the response variable.

  ---------------------------------------------------
             Method             Statistic    p-value
  ---------------------------- ------------ ---------
           Lilliefors              0.17     6.193e-54
      (Kolmogorov-Smirnov)                  
         normality test                     

   Anderson-Darling normality     32.16     1.26e-71
              test                          

  Shapiro-Wilk normality test     0.8216    9.445e-27
  ---------------------------------------------------

So, the conclusions we can draw with the help of test statistics:

-   based on *Lilliefors test*, distribution of *Age* is not normal

-   *Anderson-Darling test* confirms violation of normality assumption

-   according to *Shapiro-Wilk test*, the distribution of *Age* is not
    normal

As you can see, the applied tests confirm departures from normality.

### Test results

After checking the assumptions let's see what the test shows us!

  ----------------------------------------------------
             Method              Statistic    p-value
  ----------------------------- ------------ ---------
  Bartlett test of homogeneity     0.233      0.6293
          of variances                       
  ----------------------------------------------------

According to the *Bartlett's test*, the variance of the *Age* across the
groups of *Gender* does not differs significantly.

We can conclude that, because the p-value is higher than 0.05.

Description
-----------

This template will run the Bartlett's test to check the equality of
variances between groups.

### Introduction

Bartlett's test is used to test the homogeneity of the variances, in
other words the equality of the tested variable's variances across the
groups. With checking that we want to find if the two groups are coming
from the same population.

Homogeneity is useful to being tested, because that is an assumption of
the One-Way ANOVA.

#### References

-   Snedecor, George W. and Cochran, William G. (1989). *Statistical
    Methods*. Iowa State University Press

### Normality assumption

The Bartlett's test has an assumption of normality, thus one should
obtain the information if the distribution of the tested variable had a
normal distribution.

We will use *Shapiro-Wilk*, *Lilliefors* and *Anderson-Darling* tests to
screen departures from normality in the response variable.

  ---------------------------------------------------
             Method             Statistic    p-value
  ---------------------------- ------------ ---------
           Lilliefors             0.2223    2.243e-92
      (Kolmogorov-Smirnov)                  
         normality test                     

   Anderson-Darling normality     42.04     3.31e-90
              test                          

  Shapiro-Wilk normality test     0.7985    6.366e-28
  ---------------------------------------------------

So, the conclusions we can draw with the help of test statistics:

-   based on *Lilliefors test*, distribution of *Internet usage for
    educational purposes (hours per day)* is not normal

-   *Anderson-Darling test* confirms violation of normality assumption

-   according to *Shapiro-Wilk test*, the distribution of *Internet
    usage for educational purposes (hours per day)* is not normal

As you can see, the applied tests confirm departures from normality.

### Test results

After checking the assumptions let's see what the test shows us!

  ----------------------------------------------------
             Method              Statistic    p-value
  ----------------------------- ------------ ---------
  Bartlett test of homogeneity     36.11     1.863e-09
          of variances                       
  ----------------------------------------------------

According to the *Bartlett's test*, the variance of the *Internet usage
for educational purposes (hours per day)* across the groups of *Student*
significantly differs.

We can conclude that, because the p-value is smaller than 0.05.

Description
-----------

This template will run the Bartlett's test to check the equality of
variances between groups.

### Introduction

Bartlett's test is used to test the homogeneity of the variances, in
other words the equality of the tested variable's variances across the
groups. With checking that we want to find if the two groups are coming
from the same population.

Homogeneity is useful to being tested, because that is an assumption of
the One-Way ANOVA.

#### References

-   Snedecor, George W. and Cochran, William G. (1989). *Statistical
    Methods*. Iowa State University Press

### Normality assumption

The Bartlett's test has an assumption of normality, thus one should
obtain the information if the distribution of the tested variable had a
normal distribution.

We will use *Shapiro-Wilk*, *Lilliefors* and *Anderson-Darling* tests to
screen departures from normality in the response variable.

  ---------------------------------------------------
             Method             Statistic    p-value
  ---------------------------- ------------ ---------
           Lilliefors              0.17     6.193e-54
      (Kolmogorov-Smirnov)                  
         normality test                     

   Anderson-Darling normality     32.16     1.26e-71
              test                          

  Shapiro-Wilk normality test     0.8216    9.445e-27
  ---------------------------------------------------

So, the conclusions we can draw with the help of test statistics:

-   based on *Lilliefors test*, distribution of *Age* is not normal

-   *Anderson-Darling test* confirms violation of normality assumption

-   according to *Shapiro-Wilk test*, the distribution of *Age* is not
    normal

As you can see, the applied tests confirm departures from normality.

### Test results

After checking the assumptions let's see what the test shows us!

  ----------------------------------------------------
             Method              Statistic    p-value
  ----------------------------- ------------ ---------
  Bartlett test of homogeneity     23.26     0.0001123
          of variances                       
  ----------------------------------------------------

According to the *Bartlett's test*, the variance of the *Age* across the
groups of *How often does your profession require Internet access?*
significantly differs.

We can conclude that, because the p-value is smaller than 0.05.

* * * * *

This report was generated with [R](http://www.r-project.org/) (3.0.1)
and [rapport](http://rapport-package.info/) (0.51) in *0.917* sec on
x86\_64-unknown-linux-gnu platform.

![](images/logo.png)
