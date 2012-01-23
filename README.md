# rapport

_rapport_ is an [R](http://r-project.org ) package that facilitates creation of reproducible statistical report templates. Once created, _rapport_ templates can be exported to various external formats: _HTML_, _LaTeX_, _PDF_, _ODT_, etc. Apart from _R_, all you need to know to start writing your own templates is [pandoc](http://johnmacfarlane.net/pandoc/index.html ) markup syntax, and some _rapport_ conventions that allow the reproducibility of the template.

Several [predefined templates](#templates ) come bundled with default _rapport_ installation, and their number will increase in future releases. Of course, we strongly encourage you to [write your own templates](#custom), and/or customise the ones that are shipped with default package installation.

For a brief introcution to _rapport_ functionality, run:

{% highlight r %}
demo(rapport)
{% endhighlight %}


## Installation

Currently, this package is hosted only on [GitHub](https://github.com/aL3xa/rapport/), but it will be submitted to [CRAN](cran.r-project.org) once in reaches v. 0.2 (hopefully soon, meanwhile you can check [our progress](https://github.com/aL3xa/rapport/issues?milestone=1&state=open)). Until then, you can install it via nifty function from `devtools` package:

```
library(devtools)
install_github('rapport', 'aL3xa')
```

Or download the [sources in a zip file](https://github.com/aL3xa/rapport/zipball/master) and build manually. To do so, please unzip the file to an empty dir and run the following commands there:

```
R CMD build rapport
R CMD INSTALL rapport_0.1.tar.gz
```

If you're running R on Windows, you need to install [Rtools](http://cran.stat.ucla.edu/bin/windows/Rtools/ ). Once you have installed `Rtools`, issue following command in command prompt:

```
R CMD build --binary <path to .tar.gz file>
R CMD INSTALL <path to .zip file>
```

## Usage

After [installing](#install) `rapport`, please try out the package demo:

```
library(rapport)
```

## Pages

For more info head over to [package homepage](http://rapport-package.info).
