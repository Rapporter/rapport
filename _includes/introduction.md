**rapport** is an [R](http://r-project.org ) package that facilitates creation of reproducible statistical report templates. Once created, **rapport** templates can be exported to various external formats: **HTML**, **LaTeX**, **PDF**, **ODT**, **DOCX** etc. The appearance of the page you are just reading is similar to a 'rapported document'. Apart from **R**, all you need to know to start writing your own templates is [Pandoc](http://johnmacfarlane.net/pandoc/index.html )'s markdown syntax, and some **rapport** conventions that allow the reproducibility of the template.

Several [predefined templates](#templates ) come bundled with default **rapport** installation, and their number will increase in future releases. Of course, we strongly encourage you to [write your own templates](#custom), and/or customise the ones that are shipped with default package installation.

For a brief introduction to **rapport**, run:

{% highlight r %}
demo(rapport, ask = FALSE)
{% endhighlight %}
