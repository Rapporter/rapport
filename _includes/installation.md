Currently, this package is hosted only on GitHub, but it will be submitted to [CRAN](cran.r-project.org) once in reaches v. 0.2 ([very soon, we hope]((https://github.com/aL3xa/rapport/issues?milestone=1&state=open))). Until then, you can install it via nifty function from `devtools` package:

{% highlight r %}
library(devtools)
install_github('rapport', 'aL3xa')
{% endhighlight %}

Or download the [sources in a zip file](https://github.com/aL3xa/rapport/zipball/master) and build manually. To do so, please unzip the file to an empty dir and run the following commands there:

{% highlight r %}
R CMD build rapport
R CMD INSTALL rapport_0.1.tar.gz
{% endhighlight %}

The [source code](https://github.com/aL3xa/rapport) is hosted on Github, feel free to read/use/fork the code (see: [Licence](#license) for details).

*Rapport* heavily uses the following [R](http://www.r-project.org/) packages\*:
 * [ascii](http://cran.r-project.org/web/packages/ascii/index.html) by David Hajage, 
 * [evaluate](http://cran.r-project.org/web/packages/evaluate/index.html) by Hadley Wickham,
 * [lattice](http://cran.r-project.org/web/packages/lattice/index.html) by Deepayan Sarkar,
 * [moments](http://cran.r-project.org/web/packages/moments/index.html) by Lukasz Komsta,
 * [RColorBrewer](http://cran.r-project.org/web/packages/RColorBrewer/index.html) by Erich Neuwirth,
 * [reshape](http://cran.r-project.org/web/packages/reshape/index.html) by Hadley Wickham and
 * [RJSONIO](http://cran.r-project.org/web/packages/RJSONIO/index.html) by Duncan Temple Lang.

\* The list was sorted in strict alphabetical order.

If you would like to use HTML/odt/pdf export, please install pandoc or other backend for [ascii](http://eusebe.github.com/ascii/).

[ascii](http://eusebe.github.com/ascii/) supports the following engines:
 * [asciidoc](http://www.methods.co.nz/asciidoc/),
 * [pandoc](http://johnmacfarlane.net/pandoc/),
 * [a2x](http://www.methods.co.nz/asciidoc/a2x.1.html),
 * [txt2tags](http://txt2tags.org/) and
 * [markdown2pdf](http://johnmacfarlane.net/pandoc/README.html#markdown2pdf).
 