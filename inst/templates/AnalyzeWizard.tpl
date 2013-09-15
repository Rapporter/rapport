<!--head
meta:
  title: Analyze Wizard template
  author: Daniel Nagy
  description: In this template Rapporter will present you an analyzing wizard template, where we will show you the most important statistics between any kind of variables.
  email: ~
  packages: ~
  example: ~
inputs:
- name: variables
  label: Used Variables
  description: These are the variables which Wizard will use
  length:
    min: 2.0
    max: 2.0
  required: yes
  standalone: no
head-->


<%=

variables <- na.omit(variables)
var.dat <- as.data.frame(variables)

facint2 <-FALSE
facnum2 <-FALSE
logint2 <-FALSE
lognum2 <-FALSE
intfac2 <-FALSE
numfac2 <-FALSE
intlog2 <-FALSE
numlog2 <-FALSE
intint2 <-FALSE
intnum2 <-FALSE
numint2 <-FALSE
numnum2 <-FALSE
cha2 <-FALSE
com2 <-FALSE

if (length(class(var.dat[,1])) == 2 && class(var.dat[,1])[2] == "factor" && class(var.dat[,2]) == "character") cha2 <- TRUE
if (length(class(var.dat[,1])) == 2 && class(var.dat[,1])[2] == "factor" && class(var.dat[,2]) == "complex") com2 <- TRUE
if (length(class(var.dat[,1])) == 2 && class(var.dat[,1])[2] == "factor" && class(var.dat[,2]) == "integer") facint2 <- TRUE
if (length(class(var.dat[,1])) == 2 && class(var.dat[,1])[2] == "factor" && class(var.dat[,2]) == "numeric") facnum2 <- TRUE
if (length(class(var.dat[,1])) == 2 && class(var.dat[,1])[2] == "factor" && class(var.dat[,2]) == "logical") faclog2 <- TRUE

if (length(class(var.dat[,2])) == 2 && class(var.dat[,2])[2] == "factor" && class(var.dat[,1]) == "character") cha2 <- TRUE
if (length(class(var.dat[,2])) == 2 && class(var.dat[,2])[2] == "factor" && class(var.dat[,1]) == "complex") com2 <- TRUE
if (length(class(var.dat[,2])) == 2 && class(var.dat[,2])[2] == "factor" && class(var.dat[,1]) == "integer") intfac2 <- TRUE
if (length(class(var.dat[,2])) == 2 && class(var.dat[,2])[2] == "factor" && class(var.dat[,1]) == "numeric") numfac2 <- TRUE
if (length(class(var.dat[,2])) == 2 && class(var.dat[,2])[2] == "factor" && class(var.dat[,1]) == "logical") logfac2 <- TRUE

try(if (length(class(var.dat[,1])) == 2 && class(var.dat[,1])[2] == "factor" && length(class(var.dat[,2])) && class(var.dat[,2])[2] == "factor") facfac2 <- TRUE)
try(if (class(var.dat[,1]) == "factor" && length(class(var.dat[,2])) && class(var.dat[,2])[2] == "factor") facfac2 <- TRUE)
try(if (length(class(var.dat[,1])) == 2 && class(var.dat[,1])[2] == "factor" && class(var.dat[,2]) == "factor") facfac2 <- TRUE)


if (class(var.dat[,1]) == "integer" && class(var.dat[,2]) == "integer") intint2 <- TRUE
if (class(var.dat[,1]) == "numeric" && class(var.dat[,2]) == "integer") numint2 <- TRUE
if (class(var.dat[,1]) == "integer" && class(var.dat[,2]) == "numeric") intnum2 <- TRUE
if (class(var.dat[,1]) == "numeric" && class(var.dat[,2]) == "numeric") numnum2 <- TRUE

if (class(var.dat[,1]) == "logical" && class(var.dat[,2]) == "logical") loglog2 <- TRUE
if (class(var.dat[,1]) == "numeric" && class(var.dat[,2]) == "logical") numlog2 <- TRUE
if (class(var.dat[,1]) == "logical" && class(var.dat[,2]) == "numeric") lognum2 <- TRUE
if (class(var.dat[,1]) == "numeric" && class(var.dat[,2]) == "numeric") numlog2 <- TRUE

if (class(var.dat[,1]) == "integer" && class(var.dat[,2]) == "integer") intint2 <- TRUE
if (class(var.dat[,1]) == "logical" && class(var.dat[,2]) == "integer") logint2 <- TRUE
if (class(var.dat[,1]) == "integer" && class(var.dat[,2]) == "logical") intlog2 <- TRUE
if (class(var.dat[,1]) == "logical" && class(var.dat[,2]) == "logical") logint2 <- TRUE


if (class(var.dat[,1]) == "character") cha2 <- TRUE
if (class(var.dat[,1]) == "complex") com2 <- TRUE
if (class(var.dat[,2]) == "character") cha2 <- TRUE
if (class(var.dat[,2]) == "complex") com2 <- TRUE

if (numint2 | intnum2 | numnum2 | intint2) {
rapport('LinearRegression.tpl', data=rp.data, dep=variables.name[1], indep=variables.name[2], indep.inter=F)
rapport('Correlation.tpl', data=rp.data, vars=variables.name)
} else if (numfac2 | intfac2 | numlog2 | intlog2) {
rapport("anova", data=rp.data, resp = variables.name[1], fac = variables.name[2])
} else if (facnum2 | facint2 | lognum2 | logint2) {
rapport("anova", data=rp.data, resp = variables.name[2], fac = variables.name[1])
} else if (com2) {
paste("To show the relation between these variables is not supported, because at least one of them is a complex vector. Please select two other variables.")
}
%>


