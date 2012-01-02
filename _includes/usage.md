*Rapport* has some predefined templates distributed with the package.

These files can be found in the *templates* directory of the package with `tpl` extension.

List all those files:

{% highlight r %}
> list.files(system.file(package='rapport', 'templates'), pattern='^.+\\.tpl$')
 [1] "correlations.tpl"       "crosstable.tpl"         "example.tpl"           
 [4] "mtcars_example.tpl"     "outlier-test.tpl"       "simple.tpl"            
 [7] "test.tpl"               "type_demo.tpl"          "univar-descriptive.tpl"
{% endhighlight %}

Let us say `'univar-descriptive.tpl'` seems promising, let's check out what is it:

{% highlight text %}
> tpl.meta('univar-descriptive')

`Descriptives`

 by Gergely Daroczi (g*rg*ly@sn*wl.n*t)

 This template will return descriptive statistics of a numerical, or a frequency table of a categorical variable.
 
 packages:	NA
 dataRequired:	NA
 example:	rapport('univar-descriptive', data=mtcars, var='gear')
{% endhighlight %}

It seems that this template will return some descriptive statistics of given variable. Let us try the example:

{% highlight text %}
 > rapport('univar-descriptive', data=mtcars, var='gear')
     == Variable description  
    
    The dataset has 32 observations with 32 valid values (missing: 0) in "gear".
    This variable seems to be numeric.
    
     == Base statistics  
    
        **3**   **4**   **5**  
    --- ------- ------- -------
    1   15      12      5      
    --- ------- ------- -------
    
     == Histogram  
    
    /tmp/RtmpAW9Erx/file5f9954eb.png
    
    It seems that the highest value is 5 which is exactly 1.6667 times higher than the smalles values (3).
    
    If we suppose that "gear is not near to a normal distribution (test: , skewness: 0.55, kurtosis: 2.06), checking the median (4) might be a better option instead of the mean. The interquartile range (1) measures the statistics dispersion of the variable (similar to standard deviation) based on median. 
{% endhighlight %}

We can run this template against any other variable of given dataset, or even other data frame of course :)
To check out the available options:

{% highlight text %}
 > tpl.inputs('univar-descriptive')
    
    Input parameters
     
    `var` (Variable)
       A categorical or numerical variable. The template will determine the measurement level of the given variable and will return a detailed frequency table or appropriate descriptive statistics for numerics.
         - type:	variable
         - limits:	exactly 1 variable

It seems we have only one input: the variable specified in a data frame.

Other templates might have more inputs, check out eg.:

	> tpl.inputs('correlations')

	Input parameters
 
	`vars` (Variable)
	   Numerical variables
	     - type:	numeric
	     - limits:	from 1, up to 10 variables
 
 
	`cor.matrix` (Correlation matrix)
	   Show correlation matrix (numbers)?
	     - type:	boolean
	     - limits:	exactly 1 variable
	     - default value:	TRUE 
 
	`cor.plot` (Scatterplot matrix)
	   Show scatterplot matrix (image)?
	     - type:	boolean
	     - limits:	exactly 1 variable
	     - default value:	TRUE 
{% endhighlight %}
 
Here we can specify multiple variables in `vars` (eg.: `vars = c('hp', 'mpg')`) and a few `boolean` if we want to show the correlation matrix or scatterplot matrix.

Check out the example of this template too and run it against your data!

