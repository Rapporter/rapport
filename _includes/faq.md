#### What does "rapport" mean?

Quite a bunch of stuff! First of all, it's a name of a marvellous<a id="infinite-loop" href="#infinite-loop">R package</a>, means *["the relationship of two or more people who are in sync or on the same wavelength because they feel similar and/or relate well to each other"](http://en.wikipedia.org/wiki/Rapport)* and has some trivial resemblance to *reports*. Just ask a German! BTW in Hungarian *rapport* means interrogation in military language too.

<a id="authors"> </a>
#### Who is developing this package?

At the moment Aleksandar Blagotić and Gergely Daróczi are working on this project. Feel free to [contribute](#custom) and help [translating](#translate)! :)

#### Why should I use *rapport* instead of [Sweave](http://www.stat.uni-muenchen.de/~leisch/Sweave/), [brew](http://cran.r-project.org/web/packages/brew/index.html), [knitr](https://github.com/yihui/knitr) etc.

Short answer: you should not.

Long answer:  you should not do that in most cases. As a matter of fact *rapport* does something totally different from [Sweave](http://www.stat.uni-muenchen.de/~leisch/Sweave/), [brew](http://cran.r-project.org/web/packages/brew/index.html) or even [knitr](https://github.com/yihui/knitr). With those really great and highly honored tools you can easily embed [R](http://www.r-project.org/) code and [R](http://www.r-project.org/) output  in tex, pdf, text, html and other files, which is a really handy development environment for advanced R users. You can easily write custom reports in pure [R](http://www.r-project.org/) and export to various formats if needed with nice formatting.

*Rapport* holds some [predefined](#templates)/[custom](#custom) templates, which can be easily run against any data set and variables with a one-liner. The returned reports can be exported to various formats. By this you could say: *rapport* is for child**R**en. We would rather say: *rapport* is for those who regularly runs similar analysis and has to show up some documentation/reports AND basic use**R**s. Just do not forget: you can set up [any (complex) template](#custom)! :) 

#### Why do you write such complex templates? Why not including those in helpers like `rp.anova`?

TODO

#### Other questions:

TODO