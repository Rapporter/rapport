% Rapport package team
% Correlations
% 2011-04-26 20:25 CET

-   Description
    -   Variable description
        -   Correlation matrix

-   Description
    -   Variable description
        -   Correlation matrix

-   Description
    -   Variable description
        -   Correlation matrix


Description
-----------

This template will return the correlation matrix of supplied numerical
variables.

### Variable description

*2* variables provided.

There are no highly correlated (r \< -0.7 or r \> 0.7) variables.

There are no uncorrelated correlated (r \< -0.2 or r \> 0.2) variables.

#### Correlation matrix

                 age         edu
  ---------- ----------- -----------
     **age**             0.2185 ★★★
     **edu** 0.2185 ★★★  

  : Correlation matrix

Where the stars represent the [significance
levels](http://en.wikipedia.org/wiki/Statistical_significance) of the
bivariate correlation coefficients: one star for `0.05`, two for `0.01`
and three for `0.001`.

[![Scatterplot matrix (based on a sample size of
1000)](plots/correlations-1.png)](plots/correlations-1-hires.png)

Description
-----------

This template will return the correlation matrix of supplied numerical
variables.

### Variable description

*3* variables provided.

The highest correlation coefficient (*0.2273*) is between edu age and
the lowest (*-0.03377*) is between leisure age. It seems that the
strongest association (r=*0.2273*) is between edu age.

There are no highly correlated (r \< -0.7 or r \> 0.7) variables.

Uncorrelated (-0.2 \< r \< 0.2) variables:

-   *leisure* and *age* (-0.03)
-   *leisure* and *edu* (0.17)

<!-- end of list -->











#### Correlation matrix

                     age         edu       leisure
  -------------- ----------- ----------- -----------
         **age**             0.2273 ★★★    -0.0338
         **edu** 0.2273 ★★★              0.1732 ★★★
     **leisure**   -0.0338   0.1732 ★★★  

  : Correlation matrix

Where the stars represent the [significance
levels](http://en.wikipedia.org/wiki/Statistical_significance) of the
bivariate correlation coefficients: one star for `0.05`, two for `0.01`
and three for `0.001`.

[![Scatterplot matrix (based on a sample size of
1000)](plots/correlations-2.png)](plots/correlations-2-hires.png)

Description
-----------

This template will return the correlation matrix of supplied numerical
variables.

### Variable description

*11* variables provided.

The highest correlation coefficient (*0.902*) is between disp cyl and
the lowest (*-0.8677*) is between wt mpg. It seems that the strongest
association (r=*0.902*) is between disp cyl.

Highly correlated (r \< -0.7 or r \> 0.7) variables:

-   *cyl* and *mpg* (-0.85)
-   *disp* and *mpg* (-0.85)
-   *hp* and *mpg* (-0.78)
-   *wt* and *mpg* (-0.87)
-   *disp* and *cyl* (0.9)
-   *hp* and *cyl* (0.83)
-   *wt* and *cyl* (0.78)
-   *vs* and *cyl* (-0.81)
-   *hp* and *disp* (0.79)
-   *drat* and *disp* (-0.71)
-   *wt* and *disp* (0.89)
-   *vs* and *disp* (-0.71)
-   *qsec* and *hp* (-0.71)
-   *vs* and *hp* (-0.72)
-   *carb* and *hp* (0.75)
-   *wt* and *drat* (-0.71)
-   *am* and *drat* (0.71)
-   *vs* and *qsec* (0.74)
-   *gear* and *am* (0.79)

<!-- end of list -->









Uncorrelated (-0.2 \< r \< 0.2) variables:

-   *gear* and *hp* (-0.13)
-   *qsec* and *drat* (0.09)
-   *carb* and *drat* (-0.09)
-   *qsec* and *wt* (-0.17)
-   *am* and *vs* (0.17)
-   *carb* and *am* (0.06)

<!-- end of list -->











#### Correlation matrix

                       mpg          cyl         disp           hp
  ----------- ------------ ------------ ------------ ------------
      **mpg**               -0.8522 ★★★  -0.8476 ★★★  -0.7762 ★★★
      **cyl**  -0.8522 ★★★                 0.902 ★★★   0.8324 ★★★
     **disp**  -0.8476 ★★★    0.902 ★★★                0.7909 ★★★
       **hp**  -0.7762 ★★★   0.8324 ★★★   0.7909 ★★★ 
     **drat**   0.6812 ★★★  -0.6999 ★★★  -0.7102 ★★★   -0.4488 ★★
       **wt**  -0.8677 ★★★   0.7825 ★★★    0.888 ★★★   0.6587 ★★★
     **qsec**     0.4187 ★  -0.5912 ★★★    -0.4337 ★  -0.7082 ★★★
       **vs**    0.664 ★★★  -0.8108 ★★★  -0.7104 ★★★  -0.7231 ★★★
       **am**   0.5998 ★★★   -0.5226 ★★  -0.5912 ★★★      -0.2432
     **gear**    0.4803 ★★   -0.4927 ★★  -0.5556 ★★★      -0.1257
     **carb**   -0.5509 ★★     0.527 ★★      0.395 ★   0.7498 ★★★

  : Correlation matrix (continued below)

                  drat          wt          qsec          vs
  ----------- ------------ ------------ ------------ ------------
    **mpg**    0.6812 ★★★  -0.8677 ★★★    0.4187 ★    0.664 ★★★
    **cyl**   -0.6999 ★★★   0.7825 ★★★  -0.5912 ★★★  -0.8108 ★★★
   **disp**   -0.7102 ★★★   0.888 ★★★    -0.4337 ★   -0.7104 ★★★
    **hp**     -0.4488 ★★   0.6587 ★★★  -0.7082 ★★★  -0.7231 ★★★
   **drat**                -0.7124 ★★★     0.0912      0.4403 ★
    **wt**    -0.7124 ★★★                 -0.1747    -0.5549 ★★★
   **qsec**      0.0912      -0.1747                  0.7445 ★★★
    **vs**      0.4403 ★   -0.5549 ★★★   0.7445 ★★★  
    **am**     0.7127 ★★★  -0.6925 ★★★    -0.2299       0.1683
   **gear**    0.6996 ★★★  -0.5833 ★★★    -0.2127       0.206
   **carb**     -0.0908      0.4276 ★   -0.6562 ★★★  -0.5696 ★★★

                   am          gear         carb
  ----------- ------------ ------------ ------------
    **mpg**    0.5998 ★★★   0.4803 ★★    -0.5509 ★★
    **cyl**    -0.5226 ★★   -0.4927 ★★    0.527 ★★
   **disp**   -0.5912 ★★★  -0.5556 ★★★    0.395 ★
    **hp**      -0.2432      -0.1257     0.7498 ★★★
   **drat**    0.7127 ★★★   0.6996 ★★★    -0.0908
    **wt**    -0.6925 ★★★  -0.5833 ★★★    0.4276 ★
   **qsec**     -0.2299      -0.2127    -0.6562 ★★★
    **vs**       0.1683       0.206     -0.5696 ★★★
    **am**                  0.7941 ★★★     0.0575
   **gear**    0.7941 ★★★                  0.2741
   **carb**      0.0575       0.2741    

Where the stars represent the [significance
levels](http://en.wikipedia.org/wiki/Statistical_significance) of the
bivariate correlation coefficients: one star for `0.05`, two for `0.01`
and three for `0.001`.

[![Scatterplot matrix (based on a sample size of
1000)](plots/correlations-3.png)](plots/correlations-3-hires.png)

* * * * *

This report was generated with [R](http://www.r-project.org/) (2.15.1)
and [rapport](https://rapporter.github.io/rapport/) (0.4) in *2.209* sec on
x86\_64-unknown-linux-gnu platform.

![](images/logo.png)
