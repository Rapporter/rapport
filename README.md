# rapport

_rapport_ is an [R](http://r-project.org ) package that facilitates creation of reproducible statistical report templates. Once created, _rapport_ templates can be exported to various external formats: _HTML_, _LaTeX_, _PDF_, _ODT_, etc. Apart from _R_, all you need to know to start writing your own templates is [pandoc](http://johnmacfarlane.net/pandoc/index.html ) markup syntax, and some _rapport_ conventions that allow the reproducibility of the template.

Several [predefined templates](http://rapport-package.info#templates ) come bundled with default _rapport_ installation, and their number will increase in future releases. Of course, we strongly encourage you to [write your own templates](http://rapport-package.info#custom), and/or customise the ones that are shipped with default package installation.

## Installation

The most recent version of this package is hosted on [GitHub](https://github.com/rapporter/rapport), but we also submit stable versions to [CRAN](cran.r-project.org) from time to time (read:  once in a blue moon).

Build status:

  * Development branch: [![Build Status for Development branch](https://travis-ci.org/Rapporter/rapport.png?branch=development)](https://travis-ci.org/Rapporter/rapport)
  * Master branch: [![Build Status for Master branch](https://travis-ci.org/Rapporter/rapport.png?branch=master)](https://travis-ci.org/Rapporter/rapport)

We encourage everyone to install `rapport` via the nifty function from `devtools` package:

```
library(devtools)
install_github('rapport', 'rapporter')
```

Or download the [sources in a zip file](https://github.com/rapporter/rapport/zipball/master) and build manually. To do so, please unzip the file to an empty dir and run the following commands there:

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

For a brief introcution to _rapport_ functionality, run:

```
demo(rapport)
```

## Pages

For more info head over to [package homepage](http://rapport-package.info).

[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/daa9a09d617573cbfb02b2d3903181cf "githalytics.com")](http://githalytics.com/Rapporter/rapport)
