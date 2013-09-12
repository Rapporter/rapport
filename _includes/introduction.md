_rapport_ is an [R](http://r-project.org ) package that facilitates creation of reproducible statistical report templates. Once created, _rapport_ templates can be exported to various external formats: _HTML_, _LaTeX_, _PDF_, _ODT_, _DOCX_ etc. The appearance of the page you are just reading is similar to a 'rapported document'. Apart from _R_, all you need to know to start writing your own templates is [Pandoc](http://johnmacfarlane.net/pandoc/index.html )'s markdown syntax, and some _rapport_ conventions that allow the reproducibility of the template.

Several [predefined templates](#templates ) come bundled with default _rapport_ installation, and their number will increase in future releases. Of course, we strongly encourage you to [write your own templates](#custom), and/or customise the ones that are shipped with default package installation.

For a brief introduction to _rapport_, run:

{% highlight r %}
demo(rapport, ask = FALSE)
{% endhighlight %}
