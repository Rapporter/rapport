<!--head
meta:
  title: K-means cluster
  author: Gergely Daróczi, Daniel Nagy
  description: K-means clustering with automatically estimated number of clusters
  email: ~
  packages:
  - cluster
  - fpc
  example:
  - rapport('Kmeans_cluster.tpl', data=ius2008, vars=c('age', 'edu', 'leisure'))
  - rapport('Kmeans_cluster.tpl', data=mtcars, vars=c('drat', 'cyl', 'wt', 'mpg'))
  - rapport('Kmeans_cluster.tpl', data=mtcars, vars=c('drat', 'cyl', 'wt', 'mpg'), clust_num=7)
inputs:
- name: vars
  label: Input variables
  description: These are the input variables which will be used here
  class: numeric
  length:
    min: 1.0
    max: 1000.0
  required: yes
  standalone: no
- name: clust_num
  class: integer
  label: Number of Clusters
  description: One can set the Number of the Clusters for the K-Mean Clustering
  standalone: yes
  value: ~
  length:
    min: 1.0
    max: 1.0
  required: no
head-->

<%=
vars <- na.omit(vars)
varsScaled <- scale(vars)
%>

## Introduction

[K-means Clustering](http://en.wikipedia.org/wiki/K-means_clustering) is a specific and one of the most widespread method of [clustering](http://en.wikipedia.org/wiki/Cluster_analysis). With clustering we want to divide our data into groups, which in the objects are similar to each other. K-means clustering is specified in the way, here we set the number of groups we want to make. In our case we will take into account the following variables: <%=vars.label%>, to find out which observations are the nearest to each other.

## References

J. B. MacQueen (1967). _"Some Methods for classification and Analysis of Multivariate Observations, Proceedings of 5-th Berkeley Symposium on Mathematical Statistics and Probability"_. 1:281-297

## Determining the number of clusters

As it was mentioned above, the speciality of the K-means Cluster method is to set the number of groups we want to produce. 

<% if (exists('clust_num') && !is.null(clust_num) && clust_num > 0) { %>

As you set, there will be a <%=clust_num%>-means cluster analysis provided.

<%= 
cn <- tryCatch(pam(vars, clust_num), error = function(e) e)
fit <- kmeans(varsScaled, clust_num)
%>

<% } else { %>
<%=
cn <- tryCatch(pamk(vars), error = function(e) e)
fit <- kmeans(varsScaled, cn$nc)
cn <- cn$pamobject
%>

Let's see how to decide which is the ideal number of them!

<%=
wss <- (nrow(varsScaled) - 1) * sum(apply(varsScaled, 2, var))
for (i in 2:15) {
    wss[i] <- sum(kmeans(varsScaled, centers = i)$withinss)
}
plot(1:15, wss, type = "b", xlab = "Number of Clusters",  ylab = "Within groups sum of squares")
cn <- tryCatch(pamk(varsScaled), error = function(e) e)
%>

We can figure out that, as we see how much the Within groups sum of squares decreases if we set a higher number of the groups. So the smaller the difference the smaller the gain we can do with increasing the number of the clusters (thus in this case the larger decreasing means the bigger gain).

<% if (inherits(cn, 'error')) { %>
<%=
nc <-  sample(2:5, 1)
cn <- list(pamobject = pam(varsScaled, nc), nc = nc)
stop(paste0('Unable to identify the ideal number of clusters, using a random number between 2 and 5: ', cn$nc))
%>
<% } else { %>
The ideal number of clusters seems to be <%=cn$nc%>.
<% } %>

<% } %>

## Cluster means

The method of the K-means clustering starts with the step to set k number of centorids which could be the center of the groups we want to form. After that there comes several iterations, meanwhile the ideal centers are being calculated.

The centroids are the observations which are the nearest in average to all the other observations of their group. But it could be also interesting which are the typical values of the clusters! One way to figure out these typical values is to see the group means. The <%=cn$nc%> cluster averages are:

<%=
res <- fit$centers
row.names(res) <- paste0(1:nrow(res), '.', 'Cluster')
set.alignment(rep('centre', ncol(res)), 'right')
res
%>

The size of the above clusters are: <%=fit$size%>.

## Results

On the chart below we can see the produced groups. To distinct which observation is related to which cluster each of the objects from the same groups have the same figure and there is a circle which shows the border of the clusters.

<%=
if (exists('clust_num') && !is.null(clust_num) && clust_num > 0) {
cn <- tryCatch(pam(vars, clust_num), error = function(e) e)
fit <- kmeans(varsScaled, clust_num)
} else {
cn <- tryCatch(pamk(vars), error = function(e) e)
fit <- kmeans(varsScaled, cn$nc)
cn <- cn$pamobject
}
if (ncol(res) > 1) {
clusplot(cn, fit$cluster, color = TRUE, shade = TRUE, labels = ifelse(nrow(vars) < 100, 2, 4), lines = 1, main = '', col.p = 'black', col.clus = panderOptions('graph.colors'))
} else {
    warning('Only one variable provided, so there is no sense drawing a 2D plot here.')
}
%>


