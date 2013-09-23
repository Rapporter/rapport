After [installing](#install), load the package:

{% highlight r %}
library(rapport)
{% endhighlight %}

The most obvious goal of this package is to easily reproduce a report by providing a custom dataset.

*rapport* has some predefined templates distributed with the package. These files can be found in *templates* directory of the package with `tpl` extension. Getting a list of all available templates is easy:

{% highlight r %}
> tpl.list()
 [1] "AnalyzeWizard.tpl"      "ANOVA.tpl"           "BartlettsTest.tpl"              
 [4] "BrownForsythTest.tpl"   "Correlation.tpl"     "Crosstable.tpl"                 
 [7] "Descriptives.tpl"       "Example.tpl"         "FactorAnalysis.tpl"             
[10] "FTest.tpl"              "GenerateBeta.tpl"    "GLM.tpl"                        
[13] "HierarchicalClusterAnalysis.tpl"              "HomogeneityCrosstable.tpl"      
[15] "KMeansCluster.tpl"      "KolmogorovSmirnovTest.tpl"      
[17] "KruskalWallisTest.tpl"  "LinearRegression.tpl"           
[19] "MDS.tpl"                "Minimal.tpl"         "NormalityTest.tpl"              
[22] "OutlierTest.tpl"        "PCA.tpl"             "TTest.tpl"                      
[25] "WilcoxonTest.tpl"       
{% endhighlight %}

#### Examples

If you, find, say [`Minimal.tpl`](/functions#exampletpl) promising, you can check it out by calling [`tpl.example`](/functions#tpl.example) function which prints out the examples specified in the template, prompting you to choose one from the list:

{% highlight r %}
> tpl.example('example')
Enter example ID from the list below: 

(1)	rapport("Minimal", ius2008, var='leisure') 
(2)	rapport("Minimal", ius2008, var='leisure', desc=FALSE) 
(3)	rapport("Minimal", ius2008, var='leisure', desc=FALSE, histogram=T) 
(all)	Run all examples 


Template ID>
{% endhighlight %}

After you typed in a template ID (`1`, `2`, `3` or `all`), press `ENTER` key to see it in action. For example, running the first example of `Minimal` template returns (which can be called like `tpl.example('Minimal', 1)` too):

{% highlight r %}

# Début


Hello, world!

I have just specified a *Variable* in this template named to **leisure**. The label of this variable is "Internet usage in leisure time (hours per day)".

And wow, the mean of *leisure* is _3.199_!

By checking out the [sources of this template](https://github.com/rapporter/rapport/blob/master/inst/templates/Minimal.tpl), you could see that we used all `BRCATCODE`s above from `brew` syntax. `BRCODE` tags are useful when you want to loop through something or optionally add or remove a part of the template. A really easy example of this: if `desc` input equals to `TRUE`, then the resulting report would have that chunk, if set to `FALSE`, it would be left our.

## Descriptive statistics

--------------------------------------------------------
Min.   1st Qu.   Median   Mean   3rd Qu.   Max.   NA's  
------ --------- -------- ------ --------- ------ ------
0.000  2.000     3.000    3.199  4.000     12.000 37    
--------------------------------------------------------

The 5 highest values are: _12_, _12_, _10_, _10_ and _10_.

{% endhighlight %}

What was done here? We have executed a simple analysis on the `leisure` variable found in [`ius2008`](/functions#ius2008) (package bundled) dataset. This simple template only returned a local greeting, the name and the [label](/functions#rp.label) of the given variable, alongside a variable's `summary` and 5 highest values.

As you could see in the examples there are some other parameters of this template besides `data` and `var`, for example: `desc` and `hist`. In order to, [get some info](/functions#tpl.info) on the template, issue following command:

{% highlight r %}
> tpl.info('Minimal')

`Minimal template`

 by Gergely Daróczi

 This template demonstrates the basic features of rapport. We all hope you will like it!
 
 packages:	lattice, xtable
 
 Examples: 
 rapport("Minimal", ius2008, var='leisure') 
 rapport("Minimal", ius2008, var='leisure', desc=FALSE) 
 rapport("Minimal", ius2008, var='leisure', desc=FALSE, histogram=T) 

Input parameters 

 "var" (Variable)  *required
  A numeric variable.
   - standalone:  no
   - length:		exactly 1 vector

 "desc" (Descriptives)
 Table of the descriptive statistics
   - class:  	logical
   - standalone:	yes
   - value:		~
   
 "histogram" (Histogram)
 Histogram
   - class:    logical
   - standalone:	yes
   - value:		~
   
{% endhighlight %}

Okay, we have seen the examples before, but new information appears now too:

 * the name and the author of the template,
 * a brief description of what is the template for, what will be returned,
 * required packages to run the template and
 * some input parameters (see [`tpl.inputs`](/functions#tpl.inputs) for details).

These latter shows exactly what we were looking for which can be returned by `tpl.info('Minimal', meta = F)` command too without meta information.

There we can see that four parameters can be provided. `var` is the name of the variable we want to analyze, we can set `desc` to `FALSE` instead of the default value `TRUE` not to print descriptive statistics and we can instruct the template to return a histogram too (see: `hist` parameter).

Let's run the third example:

{% highlight r %}
> rapport("example", ius2008, var='leisure', desc=FALSE, histogram=T)

# Début


Hello, world!

I have just specified a *Variable* in this template named to **leisure**. The label of this variable is "Internet usage in leisure time (hours per day)".

And wow, the mean of *leisure* is _3.199_!

**For more detailed statistics, you should have set `desc=TRUE`!**

By checking out the [sources of this template](https://github.com/rapporter/rapport/blob/master/inst/templates/example.tpl), you could see that we used all `BRCATCODE`s above from `brew` syntax. `BRCODE` tags are useful when you want to loop through something or optionally add or remove a part of the template. A really easy example of this: if `desc` input equals to `TRUE`, then the resulting report would have that chunk, if set to `FALSE`, it would be left our.

## Histogram

For demonstartion purposes you can find a histogram below:

![A nice histogram](plots/rapport-Minimal-1-1.png)
{% endhighlight %}

Here instead of the known [`tpl.example`](/functions#tpl.example) we used directly [`rapport`](/functions#rapport) which takes the above described input parameters. As you can see the descriptive statistics table is gone, instead we got a histogram. Or at least a path to a `png` file - which holds that image. You can find that file after running the above command (not exactly on the same path - see `?tempfile` for details) on your local machine and check it out. We have attached that [here](demo/plots/rapport-Minimal-1-1.png).

Well, this is a quite rough way of checking out plots generated in a template :)

#### Export

There are a lot easier ways for that:

- run [`rapport`](/functions#rapport) with [modified global options](#rapport-options): set `graph.record` and `graph.replay` to `TRUE`. This way you will see all generated plots pop-up while `print`ing a *rapport* class object. This way you can even resize the plots and later export the report with modified image dimension (see below).
- as we can export our reports (to be more technical our `rapport` classes, see `str` function on any [`rapport`](/functions#rapport) returned object) to wide range of formats with [`tpl.export`](/functions#tpl.expport).

Please find the HTML exported versions of the examples of [`Minimal.tpl`](#Minimaltpl) [here](demo/example.html) or run on your machine:

{% highlight r %}
tpl.export(tpl.example('Minimal', 'all'))
{% endhighlight %}

Which will return the above linked HTML with all examples of `Minimal.tpl`. Well, not exactly the same :)

Were you aware of the change in the second line which holds the name of the use*R*? This is set to `rapport package team @ https://github.com/rapporter/rapport` in our deploying system and set to `undefined` by default. It might be a good idea to set this to custom strings on all users' machine, which are hold in `options()`.

<a id="username-options"> </a>
Set your name and e-mail address:

{% highlight r %}
options('tpl.user'  = 'userR')
{% endhighlight %}

And rerun the following commands to see the changes. For other settings in [`tpl.export`](/functions#tpl.export) please check out the [docs](/functions#tpl.export).

If you would like to resize/alter the dimensions of generated images in the exported reports, a nice way of doing this is like:

 - save a *rapport* class to a variable (e.g.: `report <- rapport("Minimal", ius2008, var='leisure', desc=FALSE, hist=T)`),
 - `print` it (e.g.: `report`)
 - while the plots are shown on the graphics device feel free to resize them, *rapport* will resave the images to disk with modified dimensions,
 - export the R object (e.g.: `tpl.export(report)`)

If you would export several *rapport* object at once, you can do that by combining those to a list, see [`tpl.export`](/functions#tpl.export) (especially the examples) for more details.

There are a bunch of other helper functions in *rapport* to deal with templates. As most starts with `tpl` prefix (except for the main [`rapport`](/functions#rapport) function), we can easily list them by typing `tpl.` and pressing `TAB` twice:

{% highlight r %}
> tpl.
tpl.body          tpl.example       tpl.info          tpl.list          tpl.paths         tpl.paths.remove  tpl.rerun         
tpl.check         tpl.export        tpl.inputs        tpl.meta          tpl.paths.add     tpl.paths.reset  
{% endhighlight %}

By this method you might not find all handy functions, for example [`rapport.html`](/functions#rapport.html) and [`rapport.odt`](/functions#rapport.odt) which are simple wrappers around [`rapport`](/functions#rapport) and [`tpl.export`](/functions#tpl.export). Just use these functions you would use [`rapport`](/functions#rapport) and get a nifty HTML/odt output directly. For example:

{% highlight r %}
rapport.html('example', ius2008, var = 'leisure')
{% endhighlight %}

#### Other functions

<a id="rapport-options"> </a>
As you might have seen there are several general options in *rapport* which can be as handy as the [funtions](/functions) used while *rapporting*. [Above](#username-options) we have set the username, which affects the result of all run templates. Please see the (almost) full list of available options below:

- `tpl.user`: a (user)name to show in exported report (defaults to `"Anonymous"`)
- `rp.file.name`: a general filename of generated images and exported documents without extension. Some helper pseudo-code would be replaced with handy strings while running [`rapport`](/functions#rapport) and [`tpl.export`](/functions#tpl.export):
  - `%t`: unique random character strings based on `tempfile`,
  - `%T`: template name in action,
  - `%N`: an auto-increment integer based on similar exported document's file name,
  - `%n`: an auto-increment integer based on similar (plot) file names (see: `?evalsOptions`)
- `rp.file.path`: a directory where generated images and exported documents would take place. Please note, that the path should not contain any spaces at all (exception of this rule is on Windows where `shortPathName` could handle that problem with traditional directories like `"Documents and Settings"` etc.).
- By default [`rapport`](/functions#rapport) function saves plots to image files (see the settings below) and `print` method just shows the path(s) of the generated image(s). If you would like to see the plot(s) when calling [`rapport`](/functions#rapport) function from an interactive R console, please set `evalsOptions('graph.recordplot', TRUE)` and `graph.replay` option to `TRUE` beforehand. In that case all generated plots will be displayed after printing the `rapport` object. These options are set to `FALSE` by default although we find these settings really handy, as you can resize the images on the fly and export resized images to HTML/ODT/DOCX/PDF etc.
- Above a special function was called: `evalsOptions()` which part of [pander: an R Pandoc writer](http://rapporter.github.com/pander/) besides `panderOptions()` - both holding a bunch of useful options which are documented on [pander's GH page](http://rapporter.github.com/pander/#pander-options) and worth checking out.

And after all, do not forget to check out other templates of this package too or even [write](#custom)/[translate](#translate) your own templates! :)
