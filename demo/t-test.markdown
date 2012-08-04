% Rapport package team
% t-test Template
% 2011-04-26 20:25 CET

-   Description
    -   Introduction
    -   Overview
    -   Descriptives
    -   Diagnostics
        -   Normality Tests

    -   Results

-   Description
    -   Introduction
    -   Overview
    -   Descriptives
    -   Diagnostics
        -   Normality Tests

    -   Results


Description
-----------

A t-test report with table of descriptives, diagnostic tests and t-test
specific statistics.

### Introduction

In a nutshell, *t-test* is a statistical test that assesses hypothesis
of equality of two means. But in theory, any hypothesis test that yields
statistic which follows
[*t-distribution*](https://en.wikipedia.org/wiki/Student%27s_t-distribution)
can be considered a *t-test*. The most common usage of *t-test* is to:

-   compare the mean of a variable with given test mean value -
    **one-sample *t-test***
-   compare means of two variables from independent samples -
    **independent samples *t-test***
-   compare means of two variables from dependent samples -
    **paired-samples *t-test***

### Overview

Independent samples *t-test* is carried out with *Internet usage in
leisure time (hours per day)* as dependent variable, and *Gender* as
independent variable. Confidence interval is set to 95%. Equality of
variances wasn't assumed.

### Descriptives

In order to get more insight on the underlying data, a table of basic
descriptive statistics is displayed below.

  Gender    min    max    mean    sd     var    median    IQR
  --------- ------ ------ ------- ------ ------ --------- -----
  male      0      12     3.270   1.953  3.816  3         3
  female    0      12     3.064   2.355  5.544  2         3

  skewness    kurtosis
  ----------- -----------
  0.9443      0.9858
  1.3979      1.8696

### Diagnostics

Since *t-test* is a parametric technique, it sets some basic assumptions
on distribution shape: it has to be *normal* (or approximately normal).
A few normality test are to be applied, in order to screen possible
departures from normality.

#### Normality Tests

We will use *Shapiro-Wilk*, *Lilliefors* and *Anderson-Darling* tests to
screen departures from normality in the response variable (*Internet
usage in leisure time (hours per day)*).

  -----------------------------------------------
  N                            p        NA
  ---------------------------- -------- ---------
  Shapiro-Wilk normality test  0.9001   1.617e-20

  Lilliefors                   0.1680   3.000e-52
  (Kolmogorov-Smirnov)                  
  normality test                        

  Anderson-Darling normality   18.7530  7.261e-44
  test                                  
  -----------------------------------------------

As you can see, applied tests yield different results on hypotheses of
normality, so you may want to stick with one you find most appropriate
or you trust the most..

### Results

Welch Two Sample t-test was applied, and significant differences were
found.

           statistic    df     p       CI(lower)    CI(upper)
  -------- ------------ ------ ------- ------------ ------------
  **t**    1.148        457.9  0.2514  -0.1463      0.5576

Description
-----------

A t-test report with table of descriptives, diagnostic tests and t-test
specific statistics.

### Introduction

In a nutshell, *t-test* is a statistical test that assesses hypothesis
of equality of two means. But in theory, any hypothesis test that yields
statistic which follows
[*t-distribution*](https://en.wikipedia.org/wiki/Student%27s_t-distribution)
can be considered a *t-test*. The most common usage of *t-test* is to:

-   compare the mean of a variable with given test mean value -
    **one-sample *t-test***
-   compare means of two variables from independent samples -
    **independent samples *t-test***
-   compare means of two variables from dependent samples -
    **paired-samples *t-test***

### Overview

One-sample *t-test* is carried out with *Internet usage in leisure time
(hours per day)* as dependent variable. Confidence interval is set to
95%. Equality of variances wasn't assumed.

### Descriptives

In order to get more insight on the underlying data, a table of basic
descriptive statistics is displayed below.

  Variable                                        NA    NA    NA
  ----------------------------------------------- ----- ----- -----
  Internet usage in leisure time (hours per day)  0     12    3.199

  NA     NA     NA
  ------ ------ ------
  2.144  4.595  3

  NA    NA     NA
  ----- ------ ------
  2     1.185  1.533

### Diagnostics

Since *t-test* is a parametric technique, it sets some basic assumptions
on distribution shape: it has to be *normal* (or approximately normal).
A few normality test are to be applied, in order to screen possible
departures from normality.

#### Normality Tests

We will use *Shapiro-Wilk*, *Lilliefors* and *Anderson-Darling* tests to
screen departures from normality in the response variable (*Internet
usage in leisure time (hours per day)*).

  -----------------------------------------------
  N                            p        NA
  ---------------------------- -------- ---------
  Shapiro-Wilk normality test  0.9001   1.617e-20

  Lilliefors                   0.1680   3.000e-52
  (Kolmogorov-Smirnov)                  
  normality test                        

  Anderson-Darling normality   18.7530  7.261e-44
  test                                  
  -----------------------------------------------

As you can see, applied tests yield different results on hypotheses of
normality, so you may want to stick with one you find most appropriate
or you trust the most..

### Results

One Sample t-test was applied, and significant differences were found.

           statistic    df    p       CI(lower)    CI(upper)
  -------- ------------ ----- ------- ------------ ------------
  **t**    -0.007198    671   0.9943  3.037        3.362

* * * * *

This report was generated with [R](http://www.r-project.org/) (2.15.1)
and [rapport](http://rapport-package.info/) (0.4) in *1.012* sec on
x86\_64-unknown-linux-gnu platform.

![](images/logo.png)
