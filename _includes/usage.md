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

The easiest way is to call a helper function (`tpl.example()`) which runs the example call(s) of a given template. You do not need to specify the `.tpl` extension, although you can if you wish:

{% highlight r %}
> tpl.example('example')
Enter example ID from the list below: 

(1) rapport("example", ius2009, var='it.leisure') 
(2) rapport("example", ius2009, var='it.leisure', desc=FALSE) 
(3) rapport("example", ius2009, var='it.leisure', desc=FALSE, hist=T) 
(4) rapport("example", ius2009, var='it.leisure', desc=FALSE, hist=T, color='green') 
(all)   Run all examples 

Template ID>  
{% endhighlight %}

There are a bunch of other helper functions in *rapport* to deal with templates.  

**TODO**

{% highlight r %}
tpl.info('example')
TODO
{% endhighlight %}

Do not forget to check out other examples of this package too! :)


