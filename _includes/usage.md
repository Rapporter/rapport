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
options('tpl.user'  = 'userR')
options('tpl.email' = 'userR@example.com')
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

- `tpl.user`: a (user)name to show in exported report (defaults to `"Anonymous"`)
- `tpl.email`: a user's e-mail address to show in exported report (defaults to an empty string).
- `rapport.mode` defines the manner in which [`rapport`](/functions#rapport) evaluates the templates - by default it is set to `normal`. In `normal` mode [`rapport`](/functions#rapport) would check all non-strict templates (see: [`tpl.check`](/functions#tpl.check)) "linewise", and that can cause huge overhead, while `performance` mode would not perform cautious checks and evaluate all commands at once. That is not a problem if you write `strict` templates, which is really advised. `debug` mode is  appropriate for developers, as it will interrupt the execution if template contains any errors.
- By default [`rapport`](/functions#rapport) function saves plots to image files (see the settings below) and `print` method just shows the path(s) of the generated image(s). If you would like to see the plot(s) when calling [`rapport`](/functions#rapport) function from an interactive R console, please set `graph.record` and `graph.replay` options to `TRUE` beforehand. In that case all generated plots will be displayed after printing the `rapport` object. These options are set to `FALSE` by default although we find these settings really handy, as you can resize the images on the fly and export resized images to HTML/ODT/DOCX/PDF etc. If you would even like to save the actual environment of each generated plot (variables, data sets etc.) as an `RData` file, please set `graph.save.env` to `TRUE`.
- [`rapport`](/functions#rapport) also has some options to set formatting style of numbers, characters and dates. The decimals needed for automatic rounding is defined in `rp.decimal` and `rp.decimal.short` options which are by default set to `4` and `2`, respectively. Inline numeric values are presented in a short form, while the tables use the long form. The decimal mark can be set easily to e.g. `","` in `rp.decimal.mark` option, and the date format can be specified in POSIX format via `rp.date.format` option.
- the exported graphs can be customised via following options:
  - The most basic option is `style.theme` which points to a `lattice`/`trellis` theme, and uses default `rapport` theme: [`rapport`](/functions#theme.rapport). If you do not like this minimalistic bluish theme, you might reconsider using e.g. `standard.theme` from `lattice`, `ggplot2like` or `theEconomist.theme` themes available in [`latticeExtra`](http://cran.r-project.org/web/packages/latticeExtra/index.html) package or either `custom.theme.black` from [`latticist`](http://cran.r-project.org/web/packages/latticist/index.html) package. Of course, custom theme might be provided too - check out the `?custom.theme` from `latticeExtra` package or head directly to: `trellis.par.get`.
  - [`rapport`](/functions#rapport) can deal with a great number of colour palettes. By default it uses `default` theme specified in `style.color.palette` option, which is both [print and colourblind-friendly palette](http://jfly.iam.u-tokyo.ac.jp/color/). Of course, other palettes can be specified there, just check out `brewer.pal.info`. If you would like to get really colourful plots, you might consider setting `style.colorize`option to `TRUE` as it will choose random colours from a given palette for each plot.
  - By default [`rapport`](/functions#rapport) tries to generate images with Helvetica font family as it's a neat, OS independent font. If you don't like that, you can change the `style.font` option. Note that you might need to set the font family afterwards, especially on Windows machines (see `windowsFonts` for details).
  - While the most graph functions in _rapport_ can "decide" if showing a grid in the background is a good idea or not, there is a global option for all other graph functions: `graph.grid`. It is possible to render a grid for both axes (`"both"`) or separate axes only (`"x"` or `"y"`). `"none"` results in a blank background.
  - The plots are saved to disk with [`rapport`](/functions#rapport) function, and the resulting files can be customised with several options:
    - `graph.format` option holds the plot output format: `"png"`, `"jpg"`, `"bmp"`, `"tiff"`, `"svg"` or `"pdf"`
    - `graph.width` and `graph.height` options hold settings for plot width and height, respectively
    - `graph.res` sets the default resolution in points per inch (`ppi`). If you would like to export images to high resolution regardless of the specified dimensions, set `graph.hi.res` option to `TRUE`. That can be really handy in HTML exports as the images get "zoomable" on click. Note: generating high resolution images has some overhead as plots are generated twice.
- [`p`](/functions#p) function concatenates vector values to a nicely formatted string by using the values from global options (see help page for [`p`](/functions#p) for details).
- Developers might find the list of options in `rp.tags` interesting, as it lets users to specify custom tags for [`rapport`](/functions#rapport) chunks. By changing the default values you may create custom reports and use your own syntax in custom templates.

And after all, do not forget to check out other templates of this package too or even [write](#custom)/[translate](#translate) your own templates! :)
