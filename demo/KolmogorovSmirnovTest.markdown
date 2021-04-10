% Rapport package team
% Kolmogorov-Smirnov-test
% 2011-04-26 20:25 CET

-   Description
    -   Introduction
    -   Distributions
    -   Test results

-   Description
    -   Introduction
    -   Distributions
    -   Test results


Description
-----------

This template will run a Kolmogorov-Smirnov-test

#### Introduction

[Kolmogorov-Smirnov
test](http://en.wikipedia.org/wiki/Kolmogorov%E2%80%93Smirnov_test) is
one of the most widely used [nonparametric
tests](http://en.wikipedia.org/wiki/Non-parametric_statistics). With the
help of that in this case we use to check if two continuous variables
had the same distribution. We do not test that here, but there is a
possibility to use that in the way to check if a sample/variable
followed an expected distribution.

#### Distributions

Before we use the K-S test to look at the possible statistical
differences, it could be useful to see visually the distributions we
want to observe. Below lie the [Cumulative Distribution
Functions](http://en.wikipedia.org/wiki/Cumulative_distribution_function)
of the variables we compared:

[![](plots/KolmogorovSmirnovTest-1.png)](plots/KolmogorovSmirnovTest-1-hires.png)

[![](plots/KolmogorovSmirnovTest-2.png)](plots/KolmogorovSmirnovTest-2-hires.png)

#### Test results

Now we will test if the Internet usage for educational purposes (hours
per day) and the Age had statistically the same distribution.

  -----------------------------------------------------
   Test statistic    P value    Alternative hypothesis
  ----------------- ---------- ------------------------
          1         *0* \* \*         two-sided
                        \*     
  -----------------------------------------------------

  : Two-sample Kolmogorov-Smirnov test on Internet usage for educational
  purposes (hours per day) and Age

The requirements of the Kolmogorov-Smirnov Test test was not met, the
approximation may be incorrect.

So the variables do not follow the same distribution, according to the
Kolmogorov-Smirnov test statistic.

Description
-----------

This template will run a Kolmogorov-Smirnov-test

#### Introduction

[Kolmogorov-Smirnov
test](http://en.wikipedia.org/wiki/Kolmogorov%E2%80%93Smirnov_test) is
one of the most widely used [nonparametric
tests](http://en.wikipedia.org/wiki/Non-parametric_statistics). With the
help of that in this case we use to check if two continuous variables
had the same distribution. We do not test that here, but there is a
possibility to use that in the way to check if a sample/variable
followed an expected distribution.

#### Distributions

Before we use the K-S test to look at the possible statistical
differences, it could be useful to see visually the distributions we
want to observe. Below lie the [Cumulative Distribution
Functions](http://en.wikipedia.org/wiki/Cumulative_distribution_function)
of the variables we compared:

[![](plots/KolmogorovSmirnovTest-3.png)](plots/KolmogorovSmirnovTest-3-hires.png)

[![](plots/KolmogorovSmirnovTest-4.png)](plots/KolmogorovSmirnovTest-4-hires.png)

#### Test results

Now we will test if the cyl and the carb had statistically the same
distribution.

  -------------------------------------------------------------
   Test statistic        P value        Alternative hypothesis
  ----------------- ------------------ ------------------------
        0.625       *7.453e-06* \* \*         two-sided
                            \*         
  -------------------------------------------------------------

  : Two-sample Kolmogorov-Smirnov test on cyl and carb

The requirements of the Kolmogorov-Smirnov Test test was not met, the
approximation may be incorrect.

So the variables do not follow the same distribution, according to the
Kolmogorov-Smirnov test statistic.

* * * * *

This report was generated with [R](http://www.r-project.org/) (3.0.1)
and [rapport](https://rapporter.github.io/rapport/) (0.51) in *0.729* sec on
x86\_64-unknown-linux-gnu platform.

![](images/logo.png)
