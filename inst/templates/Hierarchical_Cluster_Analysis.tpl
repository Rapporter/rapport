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

[Hierarchical Cluster Analysis](http://en.wikipedia.org/wiki/Hierarchical_clustering) is a data mining method which seeks to build a hierarchy of clusters. Clusters are calculated based on the distances between the observations.

# HCA

Below you can see on the plot how the clusters were made, how the observations were paired with each other.

<%=
variables <- scale(na.omit(vars))
if (dist.mat) {
d <- dist(variables) 
} else { 
d <- variables
}
HCA <- hclust(d,method)
plclust(HCA)
plot(HCA)
%>


