We'll start with a brief reminder: make sure that you have [Pandoc](http://johnmacfarlane.net/pandoc/installing.html) installed, and then proceed with package installation.

Starting from v.0.2 _rapport_ is hosted on [CRAN](cran.r-project.org), so you can install it by calling:

{% highlight r %}
install.packages('rapport')
{% endhighlight %}

Or you can grab the latest build from [GitHub](https://github.com/rapporter/rapport/) via nifty function from `devtools` package:

{% highlight r %}
library(devtools)
install_github('rapport', 'rapporter')
{% endhighlight %}

You can also download sources in a [zip](https://github.com/rapporter/rapport/zipball/master) or [tarball](https://github.com/rapporter/rapport/tarball/master ) archive and build package manually. To do so, please extract archive to an empty directory and run the following commands:

{% highlight bash %}
R CMD build rapport
R CMD INSTALL <path to .tar.gz file>
{% endhighlight %}

If you're running R on Windows, you need to install [Rtools](http://cran.stat.ucla.edu/bin/windows/Rtools/ ). Once you have installed it, you can either try out the `install_github()` approach or install package manually by downloading [tarball sources](https://github.com/rapporter/rapport/tarball/master ) and issuing following commands in the command prompt:

{% highlight bash %}
R CMD build --binary <path to .tar.gz file>
R CMD INSTALL <path to .zip file>
{% endhighlight %}

In order to export _rapport_ templates to  _HTML_, _ODT_, _DOCX_ or _PDF_, please install [pandoc](http://johnmacfarlane.net/pandoc/installing.html).

And an up-to-date version of `pander` (an R markdown writer) installed from [GitHub](http://rapporter.github.com/pander/) is also really advocated:

{% highlight r %}
library(devtools)
install_github('pander', 'rapporter')
{% endhighlight %}
