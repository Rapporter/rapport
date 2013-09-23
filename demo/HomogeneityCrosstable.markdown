% Rapport package team
% Homogeneity test of factor variables
% 2011-04-26 20:25 CET

-   Description
    -   Variable description
    -   Counts
    -   Chi-squared test


Description
-----------

Test of homogeneity of a given factor variable split by another factor.

### Variable description

Analysing "gender" ("Gender") with *673* valid values whether frequency
counts are distributed equally across different categories of "dwell"
("Dwelling").

"dwell" has *3* categories:

-   city
-   small town
-   village

<!-- end of list -->










### Counts

                     male    female    Missing    Sum
  ----------------- ------- --------- ---------- -----
           **city**   338      234        27      599
     **small town**   28        3         2       33
        **village**   19        9         2       30
        **Missing**   25       17         5       47
            **Sum**   410      263        36      709

  : Counted values: "dwell" and "gender"

### Chi-squared test

Our [null hypothetis](http://en.wikipedia.org/wiki/Null_hypothesis) says
that the proportion of *gender* is indentical in each categories of
*dwell*.

  -----------------------------------
   Test statistic    df     P value
  ----------------- ----- -----------
        16.18         6    *0.01282*
                              \*
  -----------------------------------

  : Pearson's Chi-squared test: `table`

The chi-squared test returned the value of *16.18* with a degree of
freedom being *6*. Based on the returned [p
value](http://en.wikipedia.org/wiki/P-value) (*0.01282*) we could state
that the null hypothesis is rejected.

* * * * *

This report was generated with [R](http://www.r-project.org/) (3.0.1)
and [rapport](http://rapport-package.info/) (0.51) in *0.298* sec on
x86\_64-unknown-linux-gnu platform.

![](images/logo.png)
