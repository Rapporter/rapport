<!--head
meta:
  title: Hierarchical Cluster Analysis
  author: Rapporter team
  description: In this template Rapporter will present you Hierarchical Cluster Analysis.
  email: ~
  packages: ~
  dataRequired:  TRUE
  example:
  - rapport
inputs:
- name: vars
  label: Used Variables
  description:
  class: numeric
  length:
    min: 1.0
    max: 50.0
  limit:
    min: 1.0
    max: 50.0
  required: yes
  standalone: no
- name: dist
  label : Distance matrix
  description: Is the data a distance matrix?
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: no
  required: no
  standalone: yes
- name: dist.mat
  label : Distance Matrix
  description: Is your data a Distance matrix?
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: yes
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
  allow.multiple: no
  required: no
  standalone: yes
head-->

# Introduction

[Hierarchical Cluster Analysis](http://en.wikipedia.org/wiki/Hierarchical_clustering) is a data mining method which seeks to build a hierarchy of clusters. Clusters are calculated based on the distances between the observations. At the beginning each observation is assigned to be a single cluster, later in every round the most similar clusters will be joined until all observations are in one cluster. One should not mix it up with [K-means Cluster Analysis](http://en.wikipedia.org/wiki/K-means_clustering), which calculates the clusters based on the final numbers of them.

# HCA

Below you can see on the plot how the clusters were made, how the observations were paired with each other. The horizontal linkage between the vertical lines indicate the stage where two clusters joined to each other. In the bottom of the plot you can see the clustering process in an other way, for each observations the shorter lines indicate later clustering.

<%=
variables <- scale(na.omit(vars))
if (dist.mat) {
d <- dist(variables) 
} else { 
d <- variables
}
HCA <- hclust(d,method)
plclust(HCA, labels=F, main="HCA", xlab="Hierarchical Cluster Analysis",sub="")
%>


## Merge

In the following table you can see the steps of the clustering. Row i of merge describes the merging of clusters at step i of the clustering. If an element j in the row is negative, then observation -j was merged at this stage.


<%=
HCA$merge
%>

We can say that <%=length(which(HCA$height == 0))%> observations have the same values on the used variables, so they were joined in the first <%=length(which(HCA$height == 0))%> round. After that <%=which(HCA$merge[,1] >= 0)[1]-length(which(HCA$height == 0))%> times there were only made clusters with 2 observations, the first cluster that contain 3 was made in the round <%=which(HCA$merge[,1] >= 0)[1]%>.





