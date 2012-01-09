# rapport

_rapport_ is an engine for easily creating automated, mass statistical reports in R  with the option to export those (to markdown format/HTML/pdf/odt etc.). Template syntax is practically a pandoc markdown syntax with some extra features, such as dynamic expressions, input definition, etc.

## Installation

Currently, this package is hosted only on GitHub, but it will be submitted to CRAN once in reaches v. 0.2 (very soon, we hope). Until then, you can install it via nifty function from `devtools` package: `install_github('rapport', 'aL3xa')`.

## Usage

_rapport_ comes bundled with several report templates, and we hope that their number will increase in succeeding releases. To list all available templates, issue following command: `tpl.list()`. Each template has two key elements:

 - *data* that will be used with template (a `data.frame` in R parlance), and if data is provided,
 - *inputs* that usually correspond to column names in provided dataset, but with some additional functionality (boolean types and CSV inputs).

In order to see a template description alongside input requirements you can use `tpl.info()` function. You need to provide either a full path to the template file (usually ending in `.tpl`), a file name, or a file name sans extension (if the template is located in system directory).

```
tpl.header('example.tpl')
```

You can get separate info on package metadata and inputs by using `tpl.meta` and `tpl.inputs` functions, respectively. See official documentation for more details.

For more info on how to use pre-built templates, or even write your own, head over to our [homepage](http://rapport-package.info).

