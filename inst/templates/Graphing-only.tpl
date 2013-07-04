<!--head
meta:
  title: Graphing
  author: Rapporter team
  description: In this template Rapporter will present you several graphing options.
  email: ~
  packages: ~
  dataRequired:  TRUE
  example:
  - rapport
inputs:
- name: vars
  label: Used Variables
  description: These are the variables that you will use here
  class: numeric
  length:
    min: 1.0
    max: 50.0
  limit:
    min: 1.0
    max: 50.0
  required: yes
  standalone: no
- name: lattice
  label : Lattice (de ez nem tudom mi)
  description: rapport csomagban rp.hist,rp.density...
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: yes
  required: no
  standalone: yes
head-->


function: lattice (rapport csomagban rp.hist,rp.density...)

rp.barplot(x, facet = NULL, data = NULL, groups = FALSE,    percent = FALSE, horizontal = TRUE, ...)

rp.boxplot(x, y = NULL, facet = NULL, data = NULL, ...)

rp.densityplot(x, facet = NULL, data = NULL, ...)

rp.dotplot(x, facet = NULL, data = NULL, groups = FALSE,    horizontal = TRUE, ...)


rp.graph.check(x, facet = NULL, subset = NULL, ...)

rp.hist(x, facet = NULL, data = NULL,    kernel.smooth = FALSE, ...)

rp.lineplot(x, y, facet = NULL, data = NULL,    groups = NULL, ...)

rp.qqplot(x, dist = qnorm, facet = NULL, data = NULL,    ...)

rp.scatterplot(x, y, facet = NULL, data = NULL, ...)

rp.desc(measure.vars, id.vars = NULL, fn, data = NULL,    na.rm = TRUE, margins = NULL, subset = TRUE, fill = NA,    add.missing = FALSE, total.name = "Total",    varcol.name = "Variable",    use.labels = getOption("rp.use.labels"),    remove.duplicate = TRUE)

rp.freq(f.vars, data, na.rm = TRUE, include.na = FALSE,    drop.unused.levels = FALSE, count = TRUE, pct = TRUE,    cumul.count = TRUE, cumul.pct = TRUE,    total.name = "Total", reorder = FALSE)

rp.iqr(...)

rp.max(...)

rp.mean(...)

rp.median(...)

rp.min(...)

rp.missing(...)

rp.percent(x, subset = NULL, na.rm = TRUE, pct = FALSE,    ...)

rp.range(...)

rp.sd(...)

rp.se.mean(...)

rp.skewness(...)

rp.sum(...)

rp.univar(x, subset = NULL, fn, na.rm = TRUE, ...)

rp.valid(...)

rp.var(...)

rp.outlier(x)

rp.label(x, fallback = TRUE, simplify = TRUE)

rp.name(x)



is.heading(x)





adj.rle(x)
alike.integer(x)
capitalise(x)
catn(...)
is.boolean(x)
is.empty(x, trim = TRUE, ...)
is.number(x, integer = FALSE)
is.string(x)
messagef(s, ...)
stopf(s, ...)
tocamel(x, sep = "[^[:alnum:]]", upper = FALSE, ...)
trim.space(x,    what = c("both", "leading", "trailing", "none"),    space.regex = "[:space:]", ...)
vgsub(pattern, replacement, x, ...)
warningf(s, ...)
is.tabular(x)
is.variable(x)
fml(left, right, join.left = " + ", join.right = " + ")
pct(x, digits = panderOptions("digits"),    type = c("percent", "%", "proportion"),    check.value = TRUE)



