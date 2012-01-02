Installing *rapport* [until it gets to CRAN](https://github.com/aL3xa/rapport/issues?milestone=1&state=open), please use `devtools`:

{% highlight r %}
library(devtools)
install_github('rapport', 'aL3xa')
{% endhighlight %}

*Rapport* heavily uses the following [R](http://www.r-project.org/) packages:
 * ascii,
 * evaluate,
 * lattice,
 * moments,
 * RColorBrewer,
 * reshape,
 * RJSONIO.

If you would like to use HTML/odt/pdf export, please install pandoc or other backend for [ascii](http://eusebe.github.com/ascii/).

*ascii* supports the following engines:
 * [asciidoc](http://www.methods.co.nz/asciidoc/)
 * [pandoc](http://johnmacfarlane.net/pandoc/)
 * [a2x](http://www.methods.co.nz/asciidoc/a2x.1.html)
 * [txt2tags](http://txt2tags.org/)
 * [markdown2pdf](http://johnmacfarlane.net/pandoc/README.html#markdown2pdf)
 