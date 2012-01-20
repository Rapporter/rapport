#### What does "rapport" mean?

Actually a lot of stuff:

- first of all, it's a name of absolutely marvellous <a id="infinite-loop" href="#infinite-loop">R package</a> created by two humble developers <!-- add link to contacts -->
- initially, _rapport_ was just a pun (and a very lame attempt to get an available domain name)
- it also refers to *["the relationship of two or more people who are in sync or on the same wavelength because they feel similar and/or relate well to each other"](http://en.wikipedia.org/wiki/Rapport)*
- in psychotherapy, _rapport_ reflects mutual empathy and understanding between a therapist and client
- if you're a German (oder Deutsch fließend sprechen), then it's just a synonim for "report" (BTW, in Hungarian *rapport* denotes interrogation in military parlance)
- if you're a Kwakiutl Indian or a Khalkha Mongol, _rapport_ probably means nothing in your language, but you should give [R](http://www.r-project.org ) a try, it's bonkers!

<a id="authors"> </a>
#### Who is developing this package?

At the moment Aleksandar Blagotić and Gergely Daróczi <!-- add links to contact --> are painstakingly procrastinating to the utmost limits of endurance on this project. Feel free to [contribute](#custom) and help [translating](#translate) it! <!-- were you serious with this one?! -->

#### Why should I use *rapport* instead of [Sweave](http://www.stat.uni-muenchen.de/~leisch/Sweave/), [brew](http://cran.r-project.org/web/packages/brew/index.html), [knitr](https://github.com/yihui/knitr) etc.

**Short answer:** you should not.

**Long answer:**  you should not... oftentimes... especially if you already have an efficient development workflow. But as the matter of fact, *rapport* is a bit different from the other popular dynamical report frameworks in R: [Sweave](http://www.stat.uni-muenchen.de/~leisch/Sweave/), [brew](http://cran.r-project.org/web/packages/brew/index.html), or even [knitr](https://github.com/yihui/knitr). With those nifty tools you can easily embed [R](http://www.r-project.org/) code and [R](http://www.r-project.org/) output in _TeX_, _PDF_, _HTML_ and other formats, which is a common practice in advanced R users. You can easily write custom reports in pure [R](http://www.r-project.org/) and, if needed, export them to various formats with nice formatting.

On the other hand, _rapport_ holds some [predefined](#templates)/[custom](#custom) templates, which can be easily ran with custom dataset and input specifications <!-- add links to inputs section --> with a simple one-liner. The returned nicely formatted reports can be exported to various formats. By this you could say: *rapport* is for child**R**en. We would rather say: *rapport* is for those who regularly runs similar analysis and has to show up some documentation/reports AND also for basic use**R**s. Just do not forget: you can set up [any (complex) template](#custom) on your own easily, even localized ones in several languages - which is a quite unique feature! <!-- continue form here -->

#### Okay, how can I use this package?

See below for [detailed instructions for novice users](#usage], or head below for [advanced, customized usage](#translate)!

#### WTF? I get an error message while trying to export a template?

```
... : error running command
```

Yup, that is the normal behaviour if you do not have a backend installed. Please read the [manual](#install)!  

#### I have found a bug, what should I do?

Please join our [discussion list](#discuss) or [file an issue on Github](https://github.com/aL3xa/rapport/issues) tagged as `bug`!

#### I have a really cool idea about this package. Are you interested?

Of course! Please join our [discussion list](#discuss) or [file an issue about your idea on Github](https://github.com/aL3xa/rapport/issues) tagged as `feature`, we will be really interested to check it out.

#### Can I use this package for academic/commercial/any other purpose?

Of course, with some limitations: [license terms](#license) applies.

#### How can I use my custom templates without always specifying the full path and name of the templates?

Check out [`tpl.path`](#tpl.path) and [`tpl.path.add`](#tpl.path.add). If you add the paths of the diretories holding your custom templates, [`rapport`](#rapport) and any related function would easily find it just like you would use a [package bundled template](#templates). So if you have eg. `mytemplate.tpl` in `/tmp`, adding that to the list of custom paths like `tpl.path.add('/tmp')`, you can easily call `rapport('mytemplate', ...)`. There you do not even have to inlcude the extension of the file (if it ends in `tpl` at least).

It would be a good practice to add a call to [`tpl.paths.add(...)`](#tpl.paths.add) to your [`.Rprofile`](http://www.statmethods.net/interface/customizing.html), which would be fired on all [R](http://www.r-project.org/) startup.
