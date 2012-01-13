Writing a custom template or cloning/modifying an existing `tpl` file is not trickier then writing a statistical report of given database with some minimal [R](http://www.r-project.org/) skills. Of course sophisticated and complex reports would require more depth of knowledge in [R](http://www.r-project.org/).

In our opinion the easiest way learning how to write a template is checking out [existing code](#custom) - just like in formal languages. Here, for demonstrating purposes, we will go through the source of [`example.tpl`](#exampletpl) for which usage and return see the ["Usage"](#usage) section above.

First, let us check out the source code of [`example.tpl`](#exampletpl):

 * check out in [R](http://www.r-project.org/) console with [`tpl.find`](#tpl.find): `tpl.find('example')`
 * search in installed package directory: `system.file("templates", 'example.tpl', package = "rapport")`
 * take a look at [sources on Github](https://github.com/aL3xa/rapport/) #TODO: find exact URL
 * see the sources tab of [`example.tpl`](#exampletpl) below



Contribute!

#### FAQ

##### Can I use custom file extensions (`!= 'tpl'`) in custom path (`!=system.file("templates", package = "rapport")`')?

Sure! [`tpl.find`](#tpl.find) (which is called from [`rapport`](#rapport) too) will be able to deal with that, but bear in mind the fact that you will have to specify the full path of your custom template with extension while calling [`rapport`](#rapport) or any other [template related funtion](#Template-related-functions).

#### Why do you write such complex templates? Why not including those in [helpers](#functions) like `rp.anova`?

It is based on the theory of *rapport*: you can define a function at any part of your template and use those or just load any library which is installed on your system - even you own, local packages. You might even include a `source` command in your local template, but bear in mind that this template will not be able to run on other computers!

#### Okay, I understand, but I have a really handy function which should be added to *rapport*!

We are open to happily check out your idea, please [file an issue about your idea on Github](https://github.com/aL3xa/rapport/issues) tagged as `feature`. Or write your own package submitted to [CRAN](cran.r-project.org) and please attract our attention to add that package to our [required or suggested package list](https://github.com/aL3xa/rapport/blob/master/R/DESCRIPTION).
 
