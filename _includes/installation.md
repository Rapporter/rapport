Currently, this package is hosted only on GitHub, but it will be submitted to CRAN once in reaches v. 0.2 ([very soon, we hope]((https://github.com/aL3xa/rapport/issues?milestone=1&state=open))). Until then, you can install it via nifty function from `devtools` package:

{% highlight r %}
library(devtools)
install_github('rapport', 'aL3xa')
{% endhighlight %}

*Rapport* heavily uses the following [R](http://www.r-project.org/) packages\*:
 * [ascii](http://cran.r-project.org/web/packages/ascii/index.html) by David Hajage, 
 * [evaluate](http://cran.r-project.org/web/packages/evaluate/index.html) by Hadley Wickham,
 * [lattice](http://cran.r-project.org/web/packages/lattice/index.html) by Deepayan Sarkar,
 * [moments](http://cran.r-project.org/web/packages/moments/index.html) by Lukasz Komsta,
 * [RColorBrewer](http://cran.r-project.org/web/packages/RColorBrewer/index.html) by Erich Neuwirth,
 * [reshape](http://cran.r-project.org/web/packages/reshape/index.html) by Hadley Wickham and
 * [RJSONIO](http://cran.r-project.org/web/packages/RJSONIO/index.html) by Duncan Temple Lang.

\*: list was sorted in strict alphabetical order

If you would like to use HTML/odt/pdf export, please install pandoc or other backend for [ascii](http://eusebe.github.com/ascii/).

*ascii* supports the following engines:
 * [asciidoc](http://www.methods.co.nz/asciidoc/)
 * [pandoc](http://johnmacfarlane.net/pandoc/)
 * [a2x](http://www.methods.co.nz/asciidoc/a2x.1.html)
 * [txt2tags](http://txt2tags.org/)
 * [markdown2pdf](http://johnmacfarlane.net/pandoc/README.html#markdown2pdf)
 