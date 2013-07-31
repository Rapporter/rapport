<!--head
meta:
  title: Factor Analysis
  author: Rapporter team
  description: In this template Rapporter will present you Factor Analysis.
  email: ~
  packages:
  - psych
  - nFactors
inputs:
- name: vars
  label: Used Variables
  description: The Variables that will be used in Factor Analysis
  class: numeric
  length:
    min: 1.0
    max: 500.0
  required: yes
  standalone: no
- name: fact.num
  label: Number of Factors
  description: How many Factors you want to use?
  class: integer
  length:
    min: 1.0
    max: 499.0
  required: no
  standalone: yes
- name: method
  label: Method of factoring
  description: The used method of the factoring
  class: character
  options:
  - minimum residual (OLS)
  - weighted least squares (WLS)
  - generalized weighted least squares (GLS)
  - principal factor solution
  - maximum likelihood
  - minimize the sample size weighted chi square
  value: maximum likelihood
  matchable: yes
  allow_multiple: no
  required: no
  standalone: yes
- name: rot.method
  label: Method of Rotation
  description: The used method of the rotation
  class: character
  options:
  - none
  - varimax
  - promax
  - quartimax
  - bentlerT
  - geominT
  - bifactor
  - oblimin
  - simplimax
  - bentlerQ
  - geominQ
  - biquartimin
  - cluster
  value: varimax
  matchable: yes
  allow_multiple: no
  required: no
  standalone: yes
- name: fa.scores
  label: Type of scores
  description: Type of scores to produce
  class: character
  options:
  - regression
  - Bartlett
  value: regression
  matchable: yes
  allow_multiple: no
  required: no
  standalone: yes
- name: obs.plot
  label : Observation plot
  description: Would you check the plot about the distribution among the factors?
  class: logical
  value: yes
  required: no
  standalone: yes
- name: max.iter
  label : Maximum iterations
  description: Maximum number of iterations for convergence
  class: integer
  limit:
    min: 1
    max: 10000 
  required: no
  standalone: yes
head-->

# Introduction

[Factor Analysis](http://en.wikipedia.org/wiki/Factor_analysis) is applied as a data reduction or structure detection method. There are two main applications of it: reducing the number of variables and detecting structure in the relationships between variables, thus explore latent structure behind the data, classify variables.

<% if (is.null(fact.num)) { %>
#### Determining the number of the factors
<% } %>

<%= 
if (method=="minimum residual (OLS)") { method <- "minres"}
if (method=="weighted least squares (WLS)") { method <- "wls"}
if (method=="generalized weighted least squares (GLS)") { method <- "gls"}
if (method=="principal factor solution") { method <- "pa"}
if (method=="maximum likelihood") { method <- "ml"}
if (method=="minimize the sample size weighted chi square") { method <- "minchi"}

fact.matrix <- na.omit(scale(vars))

if (!is.null(fact.num)) {
FA <- fa(fact.matrix, factors=fact.num, scores=fa.scores, rotation=rot.method, fm=method, max.iter=max.iter, warnings=TRUE)
auto.fact <- FALSE
} else {
ev <- eigen(cor(fact.matrix))
ap <- parallel(subject=nrow(fact.matrix),var=ncol(fact.matrix), rep=100,cent=.05)
nS <- nScree(x=ev$values, aparallel=ap$eigen$qevpea)
plotnScree(nS)
fact.num <- max(which(ev$values >= 1))
auto.fact <- TRUE
FA <- fa(fact.matrix, factors=fact.num, scores=fa.scores, rotation=rot.method, fm=method, max.iter=max.iter, warnings=TRUE)
}
%>

#### Eigenvalues

<% if (auto.fact) { %>
As you haven't provided value for the number of the factors, we calculated that automatically based on the eigenvalues, thus it is equal: <%=max(which(ev$values >= 1))%>. The eigenvalues you can find in the following table:
<% } else { %>
You can find the eigenvalues of the possible factors in the following table (<%=fact.num%> factors were produced as you set):
<% } %>
<%=cbind("Factor Number" = 1:length(ev$values), "Eigenvalues" = ev$values)%>


## Factor loadings

At first step let's check the factor loadings. They mean that how deep the impact of a factor for the variables<%= ifelse(rot.method != "none",""," (Keep in mind that these are the results without rotation, please set the parameter rot.method to see the rotated ones)")%>. We emphasized the cells when the explained is higher than 30% of the whole variance.
<%= 
FA_loadings <- FA$loadings
class(FA_loadings) <- "matrix"
emphasize.strong.cells(which(abs(FA_loadings) > 0.3, arr.ind = TRUE))
FA_loadings
%>

So it can be said that <%=paste(colnames(FA_loadings)[which(abs(FA_loadings) > 0.3, arr.ind = TRUE)[,2]],rp.name(vars)[which(abs(FA_loadings) > 0.3, arr.ind = TRUE)[,1]],sep=" is a latent factor of ")%>.

<% if (length(which(FA_loadings > 0.3)) != length(which(abs(FA_loadings) > 0.3))) { %>

<%=neg.comp <- colnames(FA_loadings)[which(FA_loadings < -0.3, arr.ind = TRUE)[,2]]%>

From them in the case<%=ifelse(length(neg.comp) > 1, "s", "")%> of the <%=paste(colnames(FA_loadings)[which(FA_loadings < -0.3, arr.ind = TRUE)[,2]],rp.name(vars)[which(FA_loadings < -0.3, arr.ind = TRUE)[,1]],sep="'s impact on ")%>, we can say <%=ifelse(length(neg.comp) > 1, "they are", "that is")%> negative effects.
    
<% } else { %>
We can say that <%=ifelse(length(which(abs(FA_loadings) > 0.3)), "none of these impacts are negative", "this impact is positive")%>. 

<% }%>


<% if (obs.plot & length(rownames(FA$scores)) > 0 & nrow(vars) < 10) { %>
## Plot about the distribution of the observations

Now let's check how the observations distribute among the <%= ifelse(fact.num < 2, "factor", "first and the second factors")%>.
<%= FA_scores <- FA$scores
plot(FA_scores)
+text(FA_scores,labels=rownames(fact.matrix),cex=1)
%>
<% } else { %>
<%=ifelse(length(rownames(FA$scores)) > 0,"Excuse us, but the data does not contain names for the observations. Plot would not be informative without labels, thus we do not present that.", "On the plot we would show at least 100 observations, which would make that chaotic, so it will not be presented.") %>
<% } %>

## Uniquenesses

At last but not least let us say some words about the not explained part of the variables. There are two statistics which help us quantifying this concept: Communality and Uniquness. They are in a really strong relationship, because Uniqueness is the variability of a variable minus its Communality. The following table contains the Uniqunesses of the variables:
<%= uni <- as.matrix(FA$uniquenesses)
uni
%>

We can see from the table that variable <%=rownames(uni)[which(max(uni) == uni)]%> has the highest Uniqueness, so could be explained the least by the factors and variable <%= rownames(uni)[which(min(uni) == uni)]%> variance's was explained the most, because it has the lowest Uniqueness.
