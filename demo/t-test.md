% t-test Template
% Rapport package team @ https://github.com/aL3xa/rapport
% 2011-04-26 20:25 CET

Description
-----------

A t-test report with table of descriptives, diagnostic tests and t-test
specific statistics.

Introduction
------------

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

Overview
--------

Independent samples *t-test* is carried out with *Internet usage in
leisure time (hours per day)* as dependent variable, and *Gender* as
independent variable. Confidence interval is set to 95%. Equality of
variances wasn't assumed.

Descriptives
------------

In order to get more insight on the underlying data, a table of basic
descriptive statistics is displayed below.

  **Gender**   **min**   **max**   **mean**   **sd**   **var**   **median**   **IQR**   **skewness**   **kurtosis**
  ------------ --------- --------- ---------- -------- --------- ------------ --------- -------------- --------------
  male         0         12        3.2699     1.9535   3.8161    3            3         0.9443         0.9858
  female       0         12        3.0643     2.3546   5.5442    2            3         1.3979         1.8696

Diagnostics
-----------

Since *t-test* is a parametric technique, it sets some basic assumptions
on distribution shape: it has to be *normal* (or approximately normal).
A few normality test are to be applied, in order to screen possible
departures from normality.

### Normality Tests

We will use *Shapiro-Wilk*, *Lilliefors* and *Anderson-Darling* tests to
screen departures from normality in the response variable (*Internet
usage in leisure time (hours per day)*).

<!-- endlist -->

                                                   **N**    **p**
  ------------------------------------------------ -------- -------
  Shapiro-Wilk normality test                      0.9001   0
  Lilliefors (Kolmogorov-Smirnov) normality test   0.168    0
  Anderson-Darling normality test                  18.753   0

As you can see, applied tests confirm departures from normality.

Results
-------

Welch Two Sample t-test was applied, and significant differences were
found.

<!-- endlist -->

      **statistic**   **df**     **p**    **CI(lower)**   **CI(upper)**
  --- --------------- ---------- -------- --------------- ---------------
  t   1.1483          457.8625   0.2514   -0.1463         0.5576

Description
-----------

A t-test report with table of descriptives, diagnostic tests and t-test
specific statistics.

Introduction
------------

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

Overview
--------

One-sample *t-test* is carried out with *Internet usage in leisure time
(hours per day)* as dependent variable. Confidence interval is set to
95%. Equality of variances wasn't assumed.

Descriptives
------------

In order to get more insight on the underlying data, a table of basic
descriptive statistics is displayed below.

  **Variable**                                     **NA**   **NA**   **NA**   **NA**   **NA**   **NA**   **NA**   **NA**   **NA**
  ------------------------------------------------ -------- -------- -------- -------- -------- -------- -------- -------- --------
  Internet usage in leisure time (hours per day)   0        12       3.1994   2.1436   4.5951   3        2        1.1847   1.5334

Diagnostics
-----------

Since *t-test* is a parametric technique, it sets some basic assumptions
on distribution shape: it has to be *normal* (or approximately normal).
A few normality test are to be applied, in order to screen possible
departures from normality.

### Normality Tests

We will use *Shapiro-Wilk*, *Lilliefors* and *Anderson-Darling* tests to
screen departures from normality in the response variable (*Internet
usage in leisure time (hours per day)*).

<!-- endlist -->

                                                   **N**    **p**
  ------------------------------------------------ -------- -------
  Shapiro-Wilk normality test                      0.9001   0
  Lilliefors (Kolmogorov-Smirnov) normality test   0.168    0
  Anderson-Darling normality test                  18.753   0

As you can see, applied tests confirm departures from normality.

Results
-------

One Sample t-test was applied, and significant differences were found.

<!-- endlist -->

      **statistic**   **df**   **p**    **CI(lower)**   **CI(upper)**
  --- --------------- -------- -------- --------------- ---------------
  t   -0.0072         671      0.9943   3.037           3.3618

* * * * *

This report was generated with [R](http://www.r-project.org/) (2.14.0)
and [rapport](http://al3xa.github.com/rapport/) (0.2) in 0.695 sec on
x86\_64-unknown-linux-gnu platform.

![image](images/logo.png)
