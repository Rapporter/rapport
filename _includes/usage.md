After [installing](#install), load the package:

{% highlight r %}
library(rapport)
{% endhighlight %}

The most obvious goal of this package is to easily reproduce a report by providing a custom dataset.

*rapport* has some predefined templates distributed with the package. These files can be found in *templates* directory of the package with `tpl` extension. Getting a list of all available templates is easy:

{% highlight r %}
> tpl.list()
[1] "anova.tpl"                "correlations.tpl"         "crosstable.tpl"
[4] "example.tpl"              "multivar-descriptive.tpl" "outlier-test.tpl"
[7] "type_demo.tpl"            "univar-descriptive.tpl"
{% endhighlight %}

If you, find, say [`example.tpl`](/functions#exampletpl) promising, you can check it out by calling [`tpl.example`](/functions#tpl.example) function which prints out the examples specified in the template, prompting you to choose one from the list:

{% highlight r %}
> tpl.example('example')
Enter example ID from the list below:

(1) rapport("example", ius2009, var='leisure')
(2) rapport("example", ius2009, var='leisure', desc=FALSE)
(3) rapport("example", ius2009, var='leisure', desc=FALSE, hist=T)
(4) rapport("example", ius2009, var='leisure', desc=FALSE, hist=T, theme='Set2')
(all)   Run all examples

Template ID>
{% endhighlight %}

After you choose the template ID, press `ENTER` key to see it in action. For example, running the first example of `example` template returns:

{% highlight r %}

 == Début

Hello, world!

I have just specified a *Variable* in this template named to **leisure**. The label of this variable is "Internet usage in leisure time (hours per day)".

And wow, the mean of *leisure* is 3.1994!

 === Descriptive statistics


    **Min.**   **1st Qu.**   **Median**   **Mean**   **3rd Qu.**   **Max.**   **NA's**
--- ---------- ------------- ------------ ---------- ------------- ---------- ----------
1   0.0        2.0           3.0          3.2        4.0           12.0       37.0
--- ---------- ------------- ------------ ---------- ------------- ---------- ----------


The 5 highest values are: _12_, _12_, _10_, _10_ and _10_.

{% endhighlight %}

What was done here? We have executed a simple analysis on the `leisure` variable found in [`ius2008`](/functions#ius2008) (package bundled) dataset. This simple template only returned a local greeting, the name and the [label](/functions#rp.label) of the given variable, alongside a variable's `summary` and 5 highest values.

As you could see in the examples there are some other parameters of this template besides `data` and `var`, for example: `desc`, `hist` and `theme`. In order to, [get some info](/functions#tpl.info) on the template, issue following command:

{% highlight r %}
> tpl.info('example')

`Example template`

 by Gergely Daróczi

 This template demonstrates the basic features of rapport. We all hope you will like it!

 packages:  lattice
 dataRequired:  NA

 Examples:
 rapport("example", ius2008, var='leisure')
 rapport("example", ius2008, var='leisure', desc=FALSE)
 rapport("example", ius2008, var='leisure', desc=FALSE, hist=T)
 rapport("example", ius2008, var='leisure', desc=FALSE, hist=T, theme='Set2')

Input parameters

`var` (Variable)
   A numeric variable.
     - type:    numeric
     - limits:  exactly 1 variable


`desc` (Boolean)
   Show descriptive statistics of specified variable?
     - type:    boolean
     - limits:  exactly 1 variable
     - default value:   TRUE

`hist` (Boolean)
   Show histogram of specified variable?
     - type:    boolean
     - limits:  exactly 1 variable
     - default value:   FALSE

`theme` (Color theme)
   Color theme of the diagram
     - type:    option
     - limits:  exactly 1 variable
     - default value:   Set1, Set2, Set3
{% endhighlight %}

Okay, we have seen the examples before, but new information appears now too:

 * the name and the author of the template,
 * a brief description of what is the template for, what will be returned,
 * required packages to run the template and
 * some input parameters.

These latter shows exactly what we were looking for which can be returned by [`tpl.info`](/functions#tpl.info)`('example', meta=F)` command too without meta information.

There we can see that four parameters can be provided. `var` is the name of the variable we want to analyze, we can set `desc` to `FALSE` instead of the default value `TRUE` not to print descriptive statistics and we can instruct the template to return a histogram too (see: `hist` parameter) with given color `theme`.

Let's run the forth example:

{% highlight r %}
> rapport("example", ius2008, var='leisure', desc=FALSE, hist=T, theme='Set2')

 == Début

Hello, world!

I have just specified a *Variable* in this template named to **leisure**. The label of this variable is "Internet usage in leisure time (hours per day)".

And wow, the mean of *leisure* is 3.1994!

**For more detailed statistics, you should have set `desc=TRUE`!**

 === Histogram

/tmp/RtmpyEDSZb/file12c8cb13.png
{% endhighlight %}

Here instead of the known [`tpl.example`](/functions#tpl.example) we used directly [`rapport`](/functions#rapport) which takes the above described input parameters. As you can see the descriptive statistics table is gone, instead we got a histogram. Or at least a path to a png - which holds that image. You can find that file after running the above command with a modified path (based on `tempfile()`) on your local machine and check it out, we have attached that [here](demo/3f5075e30419f077ee974a022dd89e33.png).

Well, this is a quite rough way of checking out plots generated in a template :)

There are a lot easier ways for that, as we can export our reports (to be more technical our `rapport` classes, see `str()` on any [`rapport`](/functions#rapport) returned object) to wide range of formats with [`tpl.export`](/functions#tpl.expport).

Please find the HTML exported versions of the examples of [`example.tpl`](#exampletpl) [here](demo/example.html) or run on your machine:

{% highlight r %}
tpl.export(tpl.example('example', 'all'))
{% endhighlight %}

Which will return the above linked HTML with all examples of `example.tpl`. Well, not exactly the same :)

Were you aware of the change in the second line which holds the name and e-mail address of the use*R*? This is set to `rapport package team @ https://github.com/aL3xa/rapport` in our deploying system and set to `undefined` by default. It might be a good idea to set this to custom strings on all users' machine, which are hold in `options()`.

<a id="username-options"> </a>
Set your name and e-mail address:

{% highlight r %}
options('rp.user'  = 'userR')
options('rp.email' = 'userR@example.com')
{% endhighlight %}

And rerun the following commands to see the changes. For other settings in [`tpl.export`](/functions#tpl.export) please check out the [docs](/functions#tpl.export).

There are a bunch of other helper functions in *rapport* to deal with templates. As most starts with `tpl` prefix (except for the main [`rapport`](/functions#rapport) function), we can easily list them by typing `tpl.` and pressing `TAB` twice:

{% highlight r %}
> tpl.
tpl.body     tpl.example  tpl.export   tpl.find     tpl.info     tpl.inputs   tpl.list     tpl.meta     tpl.rerun
{% endhighlight %}

By this method you might not find all handy functions, for example [`rapport.html`](/functions#rapport.html) and [`rapport.odt`](/functions#rapport.odt) which are simple wrappers around [`rapport`](/functions#rapport) and [`tpl.export`](/functions#tpl.export). Just use these functions you would use [`rapport`](/functions#rapport) and get a nifty HTML/odt output directly. For example:

{% highlight r %}
rapport.html('example', ius2008, var = 'leisure')
{% endhighlight %}

As you might have seen there are several general options in *rapport* which can be as handy as the [funtions](/functions) used while *rapporting*. [Above](#username-options) we have set the username and e-mail address of the user, which affects the result of all run templates. Please see the (almost) full list of available options below:

- `rapport.mode` definies the mode how [`rapport`](/functions#rapport) evaluates templates - by default it is set to `normal`. In *normal* mode [`rapport`](/functions#rapport) would check all non-[strict templates](#strict.templates) line-by-line which can have quite much overhead, while `performance` mode would not deal with cautious checks and evaluate all commands at once. That is not a problem if you use/[write](#custom) [strict templates](#strict.templates), which is really advised. `debug` mode is for developpers which will result in immediate `stop` of the run while hitting any "small error".
- By default [`rapport`](/functions#rapport) saves plots to image files (see the settings below) and `print` method just shows a textual representation of the generated report with links to the files. If you would like to see the generated images in R console too, please modify `graph.record` and `graph.replay` options to `TRUE` before running `rapport` which would show all generated images after printing out a `rapport` object one by one. (These options are set to `FALSE` by default not to bother everyone with popups and the boring job of pressing `ENTER` after each plot.) If you would even like to save the actual environment of each generated plot (variables, data sets etc.) as an `RData` file, please set `graph.save.env` to `TRUE`.
- _rapport_ also has some options of course to set formatting stlye of numbers, characters and eg. date. The decimals needed for automtic rounding is defined by `rp.decimal` and `rp.decimal.short` which are by default set to `4` and `2`. Inline texts regularly use the short, while tables tend to use long form for rounded values. The decimal mark can be set easily to eg. `,` by `rp.decimal.mark`. The format of date can be specified in `rp.date.format` option (POSIX format).
- the exported graphs can be customized by several options too:
   - The most basic option is `style.theme` which points to a `lattice`/`trellis` theme, by default to _rapport_ custom theme: [`theme.rapport`](functions#theme.rapport). If you do not like this minimalistic, a bit bluish them, you might consider using eg. `standard.theme()` from lattice, `ggplot2like()` or `theEconomist.theme()` from latticeExtra package or either `custom.theme.black()` from latticist package. Of course custom theme might be provided also, check out `?custom.theme` from latticeExtra package or head directly to: `?trellis.par.get()`.
  - `theme.rapport` can deal with a great number of color palettes. By default it uses `default` theme specified in `style.color.palette` option, which is a [print- and blind-friendly colorset](http://jfly.iam.u-tokyo.ac.jp/color/). Of course other palettes can be specified there, for a start check out `brewer.pal.info`. If you would like to get really colorful plots, you might consider setting `style.colorize` option to `TRUE` as it will choose random colors from given palette for each plot.
  - While most [graph functions](functions#Generic-graph-functions) in _rapport_ can decide if showing a grid in the background is a good idea or not, there is a global option for all other graph functions: `graph.grid`.  It is possible to render a grid for `'both'`, only for `'x'` or solely to `'y'` axis. `'none'` results in a blank background.
  - The plots are saved to disk by [`rapport`](/functions#rapport), which files can be customized with several options: `graph.format` sets the file type (_png_, _jpg_, _bmp_, _tiff_, _svg_ or _pdf_), `graph.width` and `graph.height` set the required dimesions with `graph.res` nominal resolution in ppi. If you would export images to high resolution files too besides the above specified dimesion, set `graph.hi.res` to `TRUE`. That is really handy in HTML exports as the images get zoomable by click. Note: generating hi-res images have some overhead as plots are run twice.

- [`p`](/functions#p) function which concatenates vector values to a nicely formatted string have some handy global options too, which are to be modified in a localised environment. The separator between multiple items can be set by `p.sep` from which the last would be `p.copula`. Based on that I would eg. set `p.copula` to `és` for Hungarian templates.
- Developpers might be interested in the list of options in `rp.tags` which let users specify custom tags for [`rapport`](/functions#rapport). By changing the default values you may create and use your own syntax for writing and using templates.

And after all, do not forget to check out other templates of this package too or even [write](#custom)/[translate](#translate) your own templates! :)
