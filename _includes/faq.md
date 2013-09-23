#### What does "rapport" mean?

Actually a lot of stuff:

- first of all, it's a name of absolutely marvellous <a id="infinite-loop" href="#infinite-loop">R package</a> created by [two humble developers](#contact)
- initially, **rapport** was just a pun (and a very lame attempt to get an available domain name)
- it also refers to _"the relationship of two or more people who are in sync or on the same wavelength because they feel similar and/or relate well to each other"_\*
- in psychotherapy, **rapport** reflects mutual empathy and understanding between a therapist and client
- if you're a German (oder Sie sprechen fließend Deutsch), then it's just a synonym for "report" (BTW, in Hungarian *rapport* denotes interrogation in military parlance)
- if you're a Kwakiutl Indian or a Khalkha Mongol, **rapport** probably means nothing in your language, but you should give it a try, it's bonkers!

\* Stewart, Dorothy (1998). Gower handbook of management skills. Gower Publishing. p. 282. ISBN 0566078899

<a id="authors"> </a>
#### Who is developing this package?

Members of the [_rapport_ development team](#contact) are painstakingly procrastinating on this project, to the utmost limits of endurance. Feel free to [contribute](#custom) and help us [localising](#translate) it!

#### Why should I prefer *rapport* over [Sweave](http://www.stat.uni-muenchen.de/~leisch/Sweave/), [brew](http://cran.r-project.org/web/packages/brew/index.html), [knitr](https://github.com/yihui/knitr) and the like?

**Short answer:** you should not.

**Long answer:**  you should not... oftentimes... especially if you already have an efficient development work flow. But *rapport* is a bit different from the other popular dynamic report frameworks in R: [Sweave](http://www.stat.uni-muenchen.de/~leisch/Sweave/), [brew](http://cran.r-project.org/web/packages/brew/index.html), or even [knitr](https://github.com/yihui/knitr). With those nifty tools you can easily embed **R** code and **R** output in **TeX**, **PDF**, **HTML** and other formats, which is a common practice in advanced R users.

**rapport** has a similar goal: to use R to generate dynamic, reproducible templates, which can be easily exported to various external formats, providing (hopefully) nicely formatted template elements, such as tables, graphs or in-line expressions. You may get an impression that **rapport** is n00b-friendly interface to statistical report creation, but from our POV, it's just a convenient way of dealing with repetitive tasks.

**rapport** relies on some [predefined](#templates)/[custom](#custom) templates, which can be easily ran against any dataset and with user-defined input specifications <!-- add links to inputs section -->. Don't forget: [custom templates](#custom) are easy to write!

#### OK, you got me. How can I use this package?

Read sections on [usage](#usage) and/or [writing custom templates](#custom).

#### I found a bug. What should I do?

Please join our [discussion list](#discuss) or [file an issue on Github](https://github.com/rapporter/rapport/issues) tagged as `bug`!

#### I have a really cool idea about this package. Are you interested?

Hell yeah! Please join our [discussion list](#discuss) or [file an issue about your idea on Github](https://github.com/rapporter/rapport/issues) tagged as `feature`, we will be really interested to check it out.

#### Can I use this package for academic/commercial/any other purpose?

Of course, with some limitations: see [license terms](#license) for details.

#### How can I use my custom templates without always specifying the full path and name of the templates?

Check out [`tpl.path`](/functions#tpl.path) and [`tpl.path.add`](/functions#tpl.path.add). If you add the paths of the directories holding your custom templates, [`rapport`](/functions#rapport) and any related function would easily find it just like you would use a [package bundled template](#templates). So if you have e.g. `mytemplate.tpl` in `/tmp`, adding that to the list of custom paths like `tpl.path.add('/tmp')`, you can easily call `rapport('mytemplate', ...)`. You don't even have to include the extension of the file (unless it ends with something other than `tpl`).

It would be a good practice to add a call to [`tpl.paths.add(...)`](/functions#tpl.paths.add) to your [`.Rprofile`](http://www.statmethods.net/interface/customizing.html), which would be evaluated on each R session startup.

#### Why do you write such complex templates? Why not including those in [helpers](/functions) like `rp.anova`?

It is based on a theory behind *rapport*: you can define a function at any part of your template and use it, or just load any library which is installed on your system - even your own, local packages. You might even include a `source` command in your local template, but bear in mind that this template will not be able to run on other computers!

#### OK, I understand, but I have a really handy function which should be added to *rapport*!

We'd be glad to incorporate it in our package, please [file an issue about your idea on Github](https://github.com/rapporter/rapport/issues) tagged as `feature`. Or write your own package submitted to [CRAN](http://cran.r-project.org) and please attract our attention to add that package to our [required or suggested package list](https://github.com/rapporter/rapport/blob/master/DESCRIPTION).

#### HTML template exports have ugly fonts in Firefox, but not in other browsers. What's the catch?

Actually, it's not a `rapport` bug, rather a *Firefox* feature. Type `about:config` in *Awesome Bar&trade;* and search for following property:

{% highlight text %}
security.fileuri.strict_origin_policy
{% endhighlight %}

Set it to `false` (by double-clicking on it) and refresh the page (you may want to bypass the browser cache, too: use *Shift* + click on *Refresh* button, or *Ctrl*+*Shift*+*R*). Behold the pretty fonts! See an [answer](http://stackoverflow.com/a/3704578/457898) that solved this strange behaviour.

#### I'm trying to produce those fancy **HTML** tables you have in **rapport**. Any tips on how to do that? (Q of **Roman Luštrik**)

Sure, just put a piece of code that returns a `data.frame` object in a **chunk**, and it will be converted to HTML table once you export it. Put something like this in your `.tpl` file:

{% highlight r %}
<%=
rp.desc("edu", "student", c(min, max, mean, sd), ius2008)
%>
{% endhighlight %}

and run `rapport.html(<file path>, <data>, <inputs>)`.
