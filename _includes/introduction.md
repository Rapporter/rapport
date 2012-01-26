_rapport_ is an [R](http://r-project.org ) package that facilitates creation of reproducible statistical report templates. Once created, _rapport_ templates can be exported to various external formats: _HTML_, _LaTeX_, _PDF_, _ODT_, etc. Apart from _R_, all you need to know to start writing your own templates is [pandoc](http://johnmacfarlane.net/pandoc/index.html ) markup syntax, and some _rapport_ conventions that allow the reproducibility of the template.

Several [predefined templates](#templates ) come bundled with default _rapport_ installation, and their number will increase in future releases. Of course, we strongly encourage you to [write your own templates](#custom), and/or customise the ones that are shipped with default package installation.

For a brief introduction to _rapport_, run:

{% highlight r %}
demo(rapport)
{% endhighlight %}
