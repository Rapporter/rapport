After [installing](#install), load the package:

{% highlight r %}
library(rapport)
{% endhighlight %}

The most obvious goal of this package is to easily create some reports of our data.

*Rapport* has some predefined templates distributed with the package. These files can be found in the *templates* directory of the package with `tpl` extension. Listing all templates is easy: 

{% highlight r %}
> tpl.list()
[1] "anova.tpl"                "correlations.tpl"         "crosstable.tpl"          
[4] "example.tpl"              "multivar-descriptive.tpl" "outlier-test.tpl"        
[7] "type_demo.tpl"            "univar-descriptive.tpl"  
{% endhighlight %}

Let us say `'example.tpl'` seems promising, let's check out what is it for demonstrating purposes!

The easiest way of doing a demo is to call a helper function ([`tpl.example`](#tpl.example)) which runs the example call(s) of a given template. You do not need to specify the `.tpl` extension, although you can if you wish:

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

There you chose and ID of the given examples and press `ENTER`. For example running the first example returns:

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

What was done here? We run a simple analysis on the `leisure` variable found in [`ius2008`](#ius2008) (package bundled demo) dataset. This simple template only returned some traditional welcome strings, the name and the [label](#rp.label) of the given variable besides a `summary` and the top5 highest values.

As you could see in the examples there are some other parameters of this template besides `data` and `var`, for example: `desc`, `hist` and `theme`. To find out what are these, [get some info](#tpl.info) on the template:

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

These latter shows exactly what we were looking for which can be returned by [`tpl.info('example', meta=F)`](#tpl.info) command too without meta informations.

There we can see that four parameters can be provided. `var` is the name of the variable we want to analyze, we can set `desc` to `FALSE` instead of the default value `TRUE` not to print descriptive statistics and we can instruct the template to return a histogram too (see: `hist` parameter) with given color `theme`.

Let's run the forth example where we do exactly this!

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

Here instead of the known [`tpl.example`](#tpl.example) we used directly [`rapport`](#rapport) which takes the above described input parameters. As you can see the descriptive statistics table is gone, instead we got a histogram. Or at least a path to a png - which holds that image. You can find that file after running tha above command with a modified path (based on `tempfile()`) on your local machine and check it out, we have attached that [here](demo/3f5075e30419f077ee974a022dd89e33.png).

Well, this is a quite rough way of checking out plots generated in a template :)

There are a lot easier ways for that, as we can export our reports (to be more technical our `rapport` classes, see `str()` on any [`rapport`](#rapport) returned object) to wide range of formats with [`tpl.export`](#tpl.expport).

Please find the HTML exported versions of the examples of `example.tpl` [here](demo/example.html) or run on your machine:

{% highlight r %}
tpl.export(tpl.example('example', 'all'))
{% endhighlight %}

Which will return the above linked HTML with all examples of `example.tpl`. Well, not exactly the same :)

Were you aware of the change in the second line which holds the name and e-mail address of the use*R*? This is set to `Rapport package team @ https://github.com/aL3xa/rapport` in our deploying system and set to `undefined` by default. It might be a good idea to set this to custom strings on all users' machine, which are hold in `options()`.

Set your name and e-mail address:

{% highlight r %}
options('rp.user'  = 'userR')
options('rp.email' = 'userR@example.com')
{% endhighlight %}

And rerun the following commands to see the changes. For other settings in [`tpl.export`](#tpl.export) please check out the [docs](#tpl.export).

There are a bunch of other helper functions in *rapport* to deal with templates. As most starts with `tpl` prefix (except for the main [`rapport`](#rapport) function), we can easily list them by typing `tpl.` and pressing `TAB` twice:

{% highlight r %}
> tpl.
tpl.body     tpl.example  tpl.export   tpl.find     tpl.info     tpl.inputs   tpl.list     tpl.meta     tpl.rerun    
{% endhighlight %}

By this method you might not find all handy functions, for example `rapport.html` and `rapport.odt` which are simple wrappers around [`rapport`](#rapport) and [`tpl.export`](#tpl.export). Just use thse functions you would use [`rapport`](#rapport) and get a nifty HTML/odt output directly. For example:

{% highlight r %}
rapport.html('example', ius2008, var = 'leisure')
{% endhighlight %}

Do not forget to check out other templates of this package too or even [write](#custom)/[translate](#translate) your own templates! :)
