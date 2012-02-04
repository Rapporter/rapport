Starting from v.0.2 _rapport_ is hosted on [CRAN](cran.r-project.org), so you can install it by calling:

{% highlight r %}
install.packages('rapport')
{% endhighlight %}

Or you can grab the latest build from [GitHub](https://github.com/aL3xa/rapport/) via nifty function from `devtools` package:

{% highlight r %}
library(devtools)
install_github('rapport', 'aL3xa')
{% endhighlight %}

You can also download sources in a [zip](https://github.com/aL3xa/rapport/zipball/master) or [tarball](https://github.com/aL3xa/rapport/tarball/master ) archive and build package manually. To do so, please extract archive to an empty directory and run the following commands:

{% highlight bash %}
R CMD build rapport
R CMD INSTALL <path to .tar.gz file>
{% endhighlight %}

If you're running R on Windows, you need to install [Rtools](http://cran.stat.ucla.edu/bin/windows/Rtools/ ). Once you have installed it, download [tarball sources](https://github.com/aL3xa/rapport/tarball/master ) and issue following commands in command prompt:

{% highlight bash %}
R CMD build --binary <path to .tar.gz file>
R CMD INSTALL <path to .zip file>
{% endhighlight %}

In order to export _rapport_ templates to  _HTML_, _ODT_, or _PDF_ export, please install [pandoc](http://johnmacfarlane.net/pandoc/installing.html ) or other backend for [ascii](http://eusebe.github.com/ascii/) processing.

[ascii](http://eusebe.github.com/ascii/) package supports following engines:
 * [asciidoc](http://www.methods.co.nz/asciidoc/),
 * [pandoc](http://johnmacfarlane.net/pandoc/),
 * [a2x](http://www.methods.co.nz/asciidoc/a2x.1.html),
 * [txt2tags](http://txt2tags.org/) and
 * [markdown2pdf](http://johnmacfarlane.net/pandoc/README.html#markdown2pdf).

We recommend using [pandoc](http://johnmacfarlane.net/pandoc/), especially the [devel version](https://github.com/jgm/pandoc/wiki/Installing-the-development-version-of-pandoc-1.9), as it has some really neat updates (DOCX writer, ODT image size fix etc.)!
