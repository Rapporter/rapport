<!--head
meta:
  title: Hierarchical Cluster Analysis
  author: Daniel Nagy
  description: In this template Rapporter will present you Hierarchical Cluster Analysis.
  email: ~
  packages:
  - mclust
  example: ~
inputs:
- name: vars
  label: Used Variables
  description:
  class: numeric
  length:
    min: 2.0
    max: 5000.0
  required: yes
  standalone: no
- name: dist.mat
  label : Distance Matrix
  description: Is your data a Distance matrix?
  class: logical
  value: no
  required: no
  standalone: yes
- name: method
  label: Method
  description: 
  class: character
  length:
    min: 1.0
    max: 1.0
  options:
  - ward
  - single
  - complete
  - average
  - mcquitty
  - median
  - centroid
  value: ward
  matchable: yes
  allow_multiple: no
  required: no
  standalone: yes
- name: clust.num
  label: Number of Clusters
  description: How many clusters you want to check on the Dendogram?
  class: integer
  limit:
    min: 2.0
    max: 9999.0
  required: no
  standalone: yes
head-->


# Introduction

[Hierarchical Cluster Analysis](http://en.wikipedia.org/wiki/Hierarchical_clustering) is a data mining method which seeks to build a hierarchy of clusters. Clusters are calculated based on the distances between the observations. At the beginning each observation is assigned to be a single cluster, later in every round the most similar clusters will be joined until all observations are in one cluster. One should not mix it up with [K-means Cluster Analysis](http://en.wikipedia.org/wiki/K-means_clustering), which calculates the clusters based on the final numbers of them.

# HCA

Below you can see on the plot how the clusters were made, how the observations were paired with each other. The horizontal linkage between the vertical lines indicates the stage where two clusters joined to each other. In the bottom of the plot you can see the clustering process in an other way, for each observations the shorter lines indicate later clustering. 

<%=
variables <- scale(na.omit(vars))
if (!dist.mat) {
d <- dist(variables) 
} else { 
d <- variables
}
try(HCA <- hclust(d,method))
if (exists('HCA') && !is.null(HCA)) { 
} else {
d <- dist(variables)
HCA <- hclust(d,method)
}
%>

<% if (exists('clust.num') && !is.null(clust.num) && clust.num > 0) { %>
<% if (length(HCA$order) <= clust.num) { %>
The number of the clusters cannot be equal or higher than the unique cases (<%=length(HCA$order)%>), which you set (<%=clust.num%>), was <%=ifelse(length(HCA$order) == clust.num, "equal", "higher")%>. In the following, we will use the maximum available number of the clusters (<%=length(HCA$order) -1%>).
<%= clust.num <- length(HCA$order) -1 %>
<% } %>
<%=paste("The red boxes shows the last", clust.num, "clusters.") %>
<%=
plclust(HCA, labels = F, main = "HCA", xlab = "Hierarchical Cluster Analysis", sub = "")
+rect.hclust(HCA, k = clust.num, border = "red")
%>
<% } else { %>
<%= 
plclust(HCA, labels = F, main = "HCA", xlab = "Hierarchical Cluster Analysis", sub = "") 
%>
<% } %>

We can say that <%=length(which(HCA$height == 0))%> observations have the same values on the used variables, so they were joined in the first <%=length(which(HCA$height == 0))%> round. After that <%=which(HCA$merge[, 1] >= 0)[1]-length(which(HCA$height == 0))%> times there were only made clusters with 2 observations, the first cluster that contains 3 was made in the round <%=which(HCA$merge[, 1] >= 0)[1]%>.


### Optimal number of clusters

<%= mod1 <-  suppressWarnings(Mclust(variables))%>

According to the BIC for EM initialized by hierarchical clustering for parameterized Gaussian mixture models, the optimum numbers of the clusters are <%=summary(mod1)$G%>.
<% if (exists('clust.num') && !is.null(clust.num) && clust.num > 0) { %>
<% if (summary(mod1)$G != clust.num) { %>
Let's see how the Dendogram looks like when we the optimal number of the clusters plotted in it.
<%=plclust(HCA, labels = F, main = "HCA", xlab = "Hierarchical Cluster Analysis",sub = "")
+rect.hclust(HCA, k = summary(mod1)$G, border = "red")%>
<% } else { %>
So we can see the optimum number of the clusters on the plot above.
<% } %>
<% } else { %>
Let's see how the Dendogram looks like when we the optimal number of the clusters (<%=summary(mod1)$G%>) plotted in it.
<%=plclust(HCA, labels = F, main = "HCA", xlab = "Hierarchical Cluster Analysis",sub = "")
+rect.hclust(HCA, k = summary(mod1)$G, border = "red")%>
<% } %>

