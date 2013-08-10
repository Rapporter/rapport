<!--head
meta:
  title: Multidimensional Scaling
  author: Daniel Nagy
  description: In this template Rapporter will present you Multidimensional Scaling.
  email: ~
  packages: ~
  example:
  - rapport('MDS.tpl', data=ius2008, vars=c('age', 'edu', 'leisure'), max.dist.num=16)
  - rapport('MDS.tpl', data=ius2008, vars=c('age', 'edu', 'leisure'), max.dist.num=17, min.dist.num=30, id='game')
  - rapport('MDS.tpl', data=mtcars, vars=c('drat', 'cyl', 'mpg'), max.dist.num=17, min.dist.num=30)
inputs:
- name: vars
  label: Used Variables
  description: These are the variables which MDS use to differentiate between values
  class: numeric
  length:
    min: 1.0
    max: 100.0
  required: yes
  standalone: no
- name: id
  label: Labels of the cases
  description: On the plot, these names will be shown as the labels of the cases
  class: ~
  required: no
  standalone: no
- name: dist.mat
  label : Distance Matrix
  description: Is your data a Distance matrix?
  class: logical
  value: no
  required: no
  standalone: yes
- name: max.dist.num
  label: Maximum Distance Number
  description: Number of pairs with the biggest differences
  class: integer
  length:
    min: 1.0
    max: 1.0
  limit:
    min: 1.0
    max: 1000.0
  value: 10
  required: no
  standalone: yes
- name: min.dist.num
  label: Minimum Distance Number
  description: Number of pairs with the smallest distances
  class: integer
  length:
    min: 1.0
    max: 1.0
  limit:
    min: 1.0
    max: 1000.0
  value: 10
  required: no
  standalone: yes
head-->


# Introduction

[Multidimensional-scaling](http://en.wikipedia.org/wiki/Multidimensional_scaling) is a technique which gives us a visual representation about the distances between the observations. 

# MDS

Below you can see a plot, that presents you the distance between the observations, which was calculated based on <%=rp.label(vars)%>.

<%= if (exists('id') && !is.null(id)) {
id <- as.character(id)
id[which(is.na(id))] <- "noname"
dd <- duplicated(id)
if (any(dd)) {
warning("Among labels some of them are duplicated. Possibly there is a better way to label, please consider other options. In this report duplications will be distinguished by following '_' and numbers after them.")
}
whichisduplicated <- apply(data.frame(need = names(table(id[dd]))), 1, function(i) which(id==i))
if (class(whichisduplicated) != "list") {
  whichisduplicated <- list('1' = whichisduplicated) }
lapply(whichisduplicated, function(i) id[i] <<- paste(id[i], 1:length(i), sep = "_") )
rownames(vars) <- id
}
variables <- scale(na.omit(vars))
if (!dist.mat) {
d <- dist(variables) 
} else { 
d <- variables
}
fit <- cmdscale(d, eig = TRUE, k = 2)
x <- fit$points[, 1]
y <- fit$points[, 2]
plot(x, y, xlab="Coordinate 1", ylab = "Coordinate 2", main = "Metric  MDS",   type = "n")
+text(x, y, labels = row.names(variables), cex = 0.7, col = panderOptions("graph.colors")[4]) 
distance <- as.matrix(d)
maxind <- which(distance == max(distance), arr.ind = TRUE)
minind <- which(distance == min(distance[distance != min(distance)]), arr.ind = TRUE)
%>

### What can be seen here?

#### Outsiders
<%=
furthest <- colnames(distance)[which(colSums(distance) == max(colSums(distance)))]
nearest <- colnames(distance)[which(colSums(distance) == min(colSums(distance)))]%>

<%=furthest %> differ<%= ifelse(length(furthest) > 1, "", "s")%> the most from the others, and <%=nearest%> seem<%= (ifelse (length(nearest) > 1, "", "s"))%> to be the most "common" observation<%= (ifelse (length(nearest) > 1, "s", ""))%>, which <%=ifelse(length(nearest) > 1, "lies", "lie") %> nearest to all other observations.

<%=
distance[upper.tri(distance, diag = T)] <- NA
h <- NULL
notneeded <- apply(data.frame(unique(as.vector(sort(distance[lower.tri(distance)], decreasing = T))[1:max.dist.num])), 1, function(i) h <<- rbind(h, which(distance == i, arr.ind = T)))
j <- NULL
notneeded <- apply(data.frame(unique(as.vector(sort(distance[lower.tri(distance)], decreasing = F))[1:min.dist.num])), 1, function(i) j <<- rbind(j, which(distance == i, arr.ind = T)))
%>

#### Outsider Pairs

<%=paste0(p(c(rownames(distance)[h[1, 1]], colnames(distance)[h[1, 2]])), ' (', round(distance[h[1, 1], h[1, 2]], 2), ')')%> are the "furthest", <%=paste0(p(c(rownames(distance)[j[1, 1]], colnames(distance)[j[1, 2]])), ' (', round(distance[j[1, 1], j[1, 2]], 2), ')') %> are the "nearest" to each other.

#### In General

Now let's see which observations can be said statistically far/similar to each other in general. The <%=max.dist.num%> pairs with the biggest differences and the <%=min.dist.num%> pairs with the smallest differences will be presented. In the brackets you can see the amount of the distances between two observations.

<%if (nrow(h) <= max.dist.num) { %>

According to the used variables (<%=rp.label(vars)%>) the <%=max.dist.num%> furthest pair of observations are:

<%=
paste(pander.return(lapply(1:nrow(h), function(i) paste0(p(c(rownames(distance)[h[i, 1]], colnames(distance)[h[i, 2]])), ' (', round(distance[h[i, 1], h[i, 2]], 2), ')'))), collapse = '\n')
%>

<% } else { %>

There are <%=nrow(h)%> observations which are the most similar, and equal in the same time, that is a higher number than the wanted <%=max.dist.num%>, thus will not be reported one-by-one. Set <%=nrow(h)%> as parameter _max.dist.num_ to check the pairs if you are interested.
<%}%>

 
<%if (nrow(j) <= min.dist.num) { %>

According to the used variables (<%=rp.label(vars)%>) the <%=min.dist.num%> nearest pair of observations are:

<%=
paste(pander.return(lapply(1:nrow(j), function(i) paste0(p(c(rownames(distance)[j[i, 1]], colnames(distance)[j[i, 2]])), ' (', round(distance[j[i, 1], j[i, 2]], 2), ')'))), collapse = '\n')
%>

<% } else { %>

There are <%=nrow(j)%> observations which are the most similar and equal in the same time, that is a higher number than the wanted <%=min.dist.num%>, thus will not be reported one-by-one. Set <%=nrow(j)%> as parameter _min.dist.num_ to check the pairs if you are interested.
<%}%>



