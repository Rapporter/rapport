Currently, this package is hosted only on [GitHub](https://github.com/aL3xa/rapport/), but it will be submitted to [CRAN](cran.r-project.org) once in reaches v.0.2 (hopefully soon). Until then, you can install _rapport_ via nifty function from `devtools` package:

{% highlight r %}
library(devtools)
install_github('rapport', 'aL3xa')
{% endhighlight %}

You can also download sources in a [zip](https://github.com/aL3xa/rapport/zipball/master) or [tarball](https://github.com/aL3xa/rapport/tarball/master ) archive and build package manually. To do so, please extract archive to an empty dir and run the following commands:

{% highlight r %}
R CMD build rapport
R CMD INSTALL rapport_0.1.tar.gz
{% endhighlight %}

If you're running R on Windows, you need to install [Rtools](http://cran.stat.ucla.edu/bin/windows/Rtools/ ). Once you have installed it, download [tarball sources](https://github.com/aL3xa/rapport/tarball/master ) and issue following commands in command prompt:

```
R CMD build --binary <path to .tar.gz file>
R CMD INSTALL <path to .zip file>
```

In order to export _rapport_ templates to  _HTML_, _ODT_, or _PDF_ export, please install [pandoc](http://johnmacfarlane.net/pandoc/installing.html ) or other backend for [ascii](http://eusebe.github.com/ascii/) processing.

[ascii](http://eusebe.github.com/ascii/) package supports following engines:
 * [asciidoc](http://www.methods.co.nz/asciidoc/),
 * [pandoc](http://johnmacfarlane.net/pandoc/),
 * [a2x](http://www.methods.co.nz/asciidoc/a2x.1.html),
 * [txt2tags](http://txt2tags.org/) and
 * [markdown2pdf](http://johnmacfarlane.net/pandoc/README.html#markdown2pdf).
 
We recommend using [pandoc](http://johnmacfarlane.net/pandoc/), especially the [devel version](https://github.com/jgm/pandoc/wiki/Installing-the-development-version-of-pandoc-1.9), as it has some really neat updates (docx writer, odt image size fix etc.)! 