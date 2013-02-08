<!--head
meta:
  title: Example template
  author: Gergely Daróczi, Aleksandar Blagotić
  desc: This template demonstrates the basic features of rapport. We all hope you will like it!
  email: ~
  packages:
  - lattice
  - ggplot2
  - xtable
  dataRequired: 'TRUE'
  example:
  - rapport("example", ius2008, v='age')
  - rapport("example", ius2008, v='gender', pacman=FALSE)
  - rapport("example", ius2008, v='age', s='FOO BAR')
inputs:
- name: v
  label: Variable
  type: variable
  limit:
    min: 1
    max: 1
  default: ~
  mandatory: TRUE
  desc: A variable
- name: pacman
  label: Pacman
  type: boolean
  limit:
    min: 1.0
    max: 1.0
  default: TRUE
  mandatory: FALSE
  desc: Show Pacman in the results?
- name: s
  label: A string
  type: string
  limit:
    min: 0
    max: 256
  default: Bye!
  mandatory: FALSE
  desc: Any character value to be printed at the end of the report
- name: i
  label: Integer input
  type: number
  limit:
    min: 0
    max: 100
  default: 100
  mandatory: FALSE
  description: Yes, we provide means to define an integer inputs as well
- name: o
  label: Option input
  type: option
  limit:
    min: 1
    max: 100
  default:
  - fee
  - fi
  - foo
  - fam
  multiple: TRUE
  mandatory: FALSE
  description: Option input
- name: multi
  label: Multiple string
  type: string
  multiple: TRUE
  limit:
    min: 1
    max: 100
  default:
  - hello
  - world
  mandatory: FALSE
  description: Extended string input
head-->

# Hello, world!

This template is a tutorial on how to write [rapport](http://rapport-package.info) templates.

You have already learned a lot: above we [say hello to the world](http://en.wikipedia.org/wiki/Hello_world_program) in a header (of level `1`) in [ATX-style](http://johnmacfarlane.net/pandoc/README.html#atx-style-headers). So the first lesson of all programming tutorials is accomplished :)

A rapport template is a regular [Pandoc's markdown](http://johnmacfarlane.net/pandoc/) file with two exceptions:

  * the file starts with a special `header` which is documented on the (rapport homepage](http://rapport-package.info/#custom). In short: you need to specify some metadata (like: author, title and description of the template, what kind of parameters would you like to use *in* the template and some examples of the template)
  * and text between `brew` tags are recognized as R commands. Details about this can be found in [`pander`'s documentation](http://rapporter.github.com/pander/#brew-to-pandoc).

Let us check out this latter (short descriptives about _<%=v.name%>_):

<%=
if (is.numeric(v)) {
	summary(v)
} else {
	table(v)
}
%>

Above we have a so called `chunk` between the special `brew` tags and the result is printed in the run template. Everything between the tags are evaluated after parsing the chunk line-by-line and are also printed if returned anything.

Tags can be inline too <%='of course'%>, but multi line results (e.g. <%=mtcars[1:5, 1:2]%>) are get separated.

`brew` ninjas also know that another pair of tag is existing in the syntax, but please hold on. We really suggest to always use the so called `BRCATCODE` (ending in an equal sign), because only those are [cached](http://rapporter.github.com/pander/#caching) and the robust error handling does not happen in "simple" `BRCODE`.

`BRCODE` tags are useful when you want to loop through something or optionally filter out/conditionally format a part of the template. A really easy example of this:

<%for (l in letters) { %>
 * <%=l%>
<% } %>

We have just shown the alphabet to the users in a list.

Loops and `if` conditionals without the curly braces do not work between the `BRCATCODE` tags, as everything between those are `parse`d. So in short: use `BRCODE` for loops and filtering, use `BRCATCODE` for the rest.

# Errors and warning

What happens if you have an error in your document?

<%=mean(foobar)%>

Which is possible even inline too: <%=foo%> and <%=bar%> beside a normal chunk showing $\pi$ (<%=pi%>).

And how do warnings show up?

<%=chisq.test(mtcars$am, mtcars$gear)%>

# Control-flow

We almost forgot about our inputs! A quite detailed documentation can be found on [rapport homepage](http://rapport-package.info/#custom).

Let us check if the template was called with `pacman` parameter set to TRUE and show some great stuff if so:

<% if (pacman) { %>
<%=pie(c(2,8), init.angle=-30, main = "I was born 30 years ago!")%>
Yeah, this plot is generated with `pie` from `graphics` package, no fancy `lattice` or `ggplot2` call :)
<% } %>

# Evaluate multiple commands at once

All R code in the template body are parsed to separate expressions to grab all error/warning/simple message. This is really comfortable and useful most of the time, but not desired with e.g. complex plots (so multiple lines creates one plot after all) or in other situations when you want evaluate your commands at one run.

Of course there is  workaround: use `+` in the beginning of the line which you want to run locked with the prior one(s). For example let us create a plot with two histograms:

<%=
par(mfrow = c(2, 1))
+hist(mtcars$wt)
+hist(mtcars$hp)
%>

### Multiple options

The _option_ input matched following values: <%= o %>. Yes, with new YAML input syntax you can match multiple option inputs.

### List input

_List input_ is another new thingy in rapport. You can now specify your own list of values and munge them afterwards, like this: <%= multi %>

### H3 tag

Oh, and by the way: <%=s%>
