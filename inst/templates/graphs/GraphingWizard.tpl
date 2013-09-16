<!--head
meta:
  title: Graph Wizard template
  author: Daniel Nagy
  description: In this template Rapporter will present you a graphing wizard template, where we will show you a visual representation.
  email: ~
  packages: ~
  example:
  - rapport('GraphingWizard.tpl', data=ius2008, variables='student')
  - rapport('GraphingWizard.tpl', data=ius2008, variables=c('edu', 'game'))
  - rapport('GraphingWizard.tpl', data=ius2008, variables=c('game', 'gender'))
inputs:
- name: variables
  label: Used Variables
  description: These are the variables which Wizard will use
  length:
    min: 1.0
    max: 2.0
  required: yes
  standalone: no
head-->

<%=
var.dat <- as.data.frame(variables)
variables <- na.omit(variables)

fac1 <- log1 <- num1 <- int1 <- cha1 <- com1 <- raw1 <- facint2 <- facnum2 <- logint2 <- lognum2 <- intfac2 <- numfac2 <- intlog2 <- numlog2 <- intint2 <- intnum2 <- numint2 <- numnum2 <- facfac2 <- raw2 <- com2 <-FALSE


if (ncol(var.dat) == 1 && length(class(variables)) == 2 && class(variables)[2] == "factor") fac1 <- TRUE
if (ncol(var.dat) == 1 && class(variables) == "factor") fac1 <- TRUE
if (ncol(var.dat) == 1 && class(variables) == "logical") log1 <- TRUE
if (ncol(var.dat) == 1 && class(variables) == "numeric") num1 <- TRUE
if (ncol(var.dat) == 1 && class(variables) == "integer") int1 <- TRUE
if (ncol(var.dat) == 1 && class(variables) == "complex") com1 <- TRUE
if (ncol(var.dat) == 1 && class(variables) == "raw") raw1 <- TRUE

if (ncol(var.dat) == 1 && class(variables) == "character") {
  cha1 <- TRUE
  class(variables) <- "factor"
}


if (ncol(var.dat) == 2 && length(class(var.dat[,1])) == 2 && class(var.dat[,1])[2] == "factor" && class(var.dat[,2]) == "complex") com2 <- TRUE
if (ncol(var.dat) == 2 && length(class(var.dat[,1])) == 2 && class(var.dat[,1])[2] == "factor" && class(var.dat[,2]) == "integer") facint2 <- TRUE
if (ncol(var.dat) == 2 && length(class(var.dat[,1])) == 2 && class(var.dat[,1])[2] == "factor" && class(var.dat[,2]) == "numeric") facnum2 <- TRUE
if (ncol(var.dat) == 2 && length(class(var.dat[,1])) == 2 && class(var.dat[,1])[2] == "factor" && class(var.dat[,2]) == "logical") faclog2 <- TRUE

if (ncol(var.dat) == 2 && length(class(var.dat[,2])) == 2 && class(var.dat[,2])[2] == "factor" && class(var.dat[,1]) == "complex") com2 <- TRUE
if (ncol(var.dat) == 2 && length(class(var.dat[,2])) == 2 && class(var.dat[,2])[2] == "factor" && class(var.dat[,1]) == "integer") intfac2 <- TRUE
if (ncol(var.dat) == 2 && length(class(var.dat[,2])) == 2 && class(var.dat[,2])[2] == "factor" && class(var.dat[,1]) == "numeric") numfac2 <- TRUE
if (ncol(var.dat) == 2 && length(class(var.dat[,2])) == 2 && class(var.dat[,2])[2] == "factor" && class(var.dat[,1]) == "logical") logfac2 <- TRUE

try(if (ncol(var.dat) == 2 && length(class(var.dat[,1])) == 2 && class(var.dat[,1])[2] == "factor" && length(class(var.dat[,2])) && class(var.dat[,2])[2] == "factor") facfac2 <- TRUE)
try(if (ncol(var.dat) == 2 && class(var.dat[,1]) == "factor" && length(class(var.dat[,2])) && class(var.dat[,2])[2] == "factor") facfac2 <- TRUE)
try(if (ncol(var.dat) == 2 && length(class(var.dat[,1])) == 2 && class(var.dat[,1])[2] == "factor" && class(var.dat[,2]) == "factor") facfac2 <- TRUE)


if (ncol(var.dat) == 2 && class(var.dat[,1]) == "integer" && class(var.dat[,2]) == "integer") intint2 <- TRUE
if (ncol(var.dat) == 2 && class(var.dat[,1]) == "numeric" && class(var.dat[,2]) == "integer") numint2 <- TRUE
if (ncol(var.dat) == 2 && class(var.dat[,1]) == "integer" && class(var.dat[,2]) == "numeric") intnum2 <- TRUE
if (ncol(var.dat) == 2 && class(var.dat[,1]) == "numeric" && class(var.dat[,2]) == "numeric") numnum2 <- TRUE

if (ncol(var.dat) == 2 && class(var.dat[,1]) == "logical" && class(var.dat[,2]) == "logical") loglog2 <- TRUE
if (ncol(var.dat) == 2 && class(var.dat[,1]) == "numeric" && class(var.dat[,2]) == "logical") numlog2 <- TRUE
if (ncol(var.dat) == 2 && class(var.dat[,1]) == "logical" && class(var.dat[,2]) == "numeric") lognum2 <- TRUE
if (ncol(var.dat) == 2 && class(var.dat[,1]) == "numeric" && class(var.dat[,2]) == "numeric") numlog2 <- TRUE

if (ncol(var.dat) == 2 && class(var.dat[,1]) == "integer" && class(var.dat[,2]) == "integer") intint2 <- TRUE
if (ncol(var.dat) == 2 && class(var.dat[,1]) == "logical" && class(var.dat[,2]) == "integer") logint2 <- TRUE
if (ncol(var.dat) == 2 && class(var.dat[,1]) == "integer" && class(var.dat[,2]) == "logical") intlog2 <- TRUE
if (ncol(var.dat) == 2 && class(var.dat[,1]) == "logical" && class(var.dat[,2]) == "logical") logint2 <- TRUE



if (ncol(var.dat) == 2 && class(var.dat[,1]) == "complex") com2 <- TRUE
if (ncol(var.dat) == 2 && class(var.dat[,2]) == "complex") com2 <- TRUE

if (ncol(var.dat) == 2 && class(var.dat[,1]) == "raw") raw2 <- TRUE
if (ncol(var.dat) == 2 && class(var.dat[,2]) == "raw") raw2 <- TRUE


if (ncol(var.dat) == 2 && class(var.dat[,1]) == "character") {
  class(var.dat[,1]) <- "factor"
  if (class(var.dat[,2]) == "integer") intfac2 <- TRUE
  if (class(var.dat[,2]) == "numeric") numfac2 <- TRUE
  if (class(var.dat[,2]) == "logical") logfac2 <- TRUE
}
if (ncol(var.dat) == 2 && class(var.dat[,2]) == "character") {
  class(var.dat[,2]) <- "factor"
  if (class(var.dat[,1]) == "integer") intfac2 <- TRUE
  if (class(var.dat[,1]) == "numeric") numfac2 <- TRUE
  if (class(var.dat[,1]) == "logical") logfac2 <- TRUE
}

if (ncol(var.dat) == 2 && class(var.dat[,1]) == "character" && class(var.dat[,2]) == "character") {
  class(var.dat[,1]) <- "factor"
  class(var.dat[,2]) <- "factor"
  facfac2 <- TRUE
}

if (fac1 | log1) {
  rapport('graphs/barchart.tpl', data=rp.data, var=variables.name)
  #rapport('graphs/dotplot.tpl', data=rp.data, var1=variables.name)
} else if (num1 | int1) {
  rapport('graphs/histogram.tpl', data=rp.data, var=variables.name)
  rapport('graphs/densityplot.tpl', data=rp.data, var=variables.name)
} else if (cha1) {
  rapport('graphs/barchart.tpl', data=rp.data, var=variables.name)
} else if (com1) {
  paste("To show visually this variable is not supported, because the class of that is complex. Please select an other variable.") 
} else if (raw1) {
  paste("To show visually this variable is not supported, because the class of that is raw. Please select an other variable.") 
} else if (facint2 | facnum2 | logint2 | lognum2) {
  rapport('graphs/bwplot.tpl', data=rp.data, var1=variables.name[2], var2=variables.name[1])
} else if (intfac2 | numfac2 | intlog2 | numlog2) {
  rapport('graphs/bwplot.tpl', data=rp.data, var1=variables.name[1], var2=variables.name[2])
} else if (intint2 | intnum2 | numint2 | numnum2) {
  rapport('graphs/xyplot.tpl', data=rp.data, x = variables.name[1], y = variables.name[2])
} else if (facfac2) {
  #rapport('graphs/barchart.tpl', data=rp.data, var=variables.name)
} else if (com2) {
  paste("To show visually the relation between these variables is not supported, because the class of at least one of that is complex. Please select two other variables.") 
} else if (raw2) {
  paste("To show visually the relation between these variables is not supported, because the class of at least one of that is raw. Please select two other variables.") 
} else if (loglog2) {
  paste("To visually show the relation between two logical variables is not supported. Please select two other variables.")
} else {
  paste("Something unexpected occured. Please select two other variables.")
}

%>





