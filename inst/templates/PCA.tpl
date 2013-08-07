<!--head
meta:
  title: Principal Component Analysis
  author: Daniel Nagy
  description: In this template Rapporter will present you Principal Component Analysis.
  email: ~
  packages: 
  - psych
  - GPArotation
  example:
  - rapport('PCA.tpl', data=mtcars, vars=c('carb', 'mpg', 'cyl', 'drat'), components=3)
inputs:
- name: vars
  label: Used Variables
  description: Which variables would you use?
  class: numeric
  length:
    min: 1.0
    max: 100.0
  required: yes
  standalone: no
- name: components
  label: Number of Components
  description: How many Principal Components you want to use?
  class: integer
  length:
    min: 1.0
    max: 99.0
  required: yes
  standalone: yes
- name: rot.matrix
  label : Rotation Matrix
  description: Would you check the Rotation Matrix?
  class: logical
  length:
    min: 1.0
    max: 1.0
  value: yes
  required: no
  standalone: yes
- name: rot.method
  label: Method of Rotation
  description: Which rotation method would you use?
  class: character
  length:
    min: 1.0
    max: 1.0
  options:
  - none
  - varimax
  - quartimax
  - promax
  - oblimin
  - simplimax
  - cluster
  value: varimax
  matchable: yes
  allow_multiple: no
  required: no
  standalone: yes
head-->

# Introduction
 
[Principal Component Analysis](https://en.wikipedia.org/wiki/Principal_component_analysis) is a dimension reduction method. It produces linearly independent principal components using the variances of the observations in a set of variables.
 
 
# Results
 
<%=
vars <- na.omit(vars)
summary(prcomp(vars))$importance[, 1:components]%>
From the table above one can see that the first <%=components%> Principal Component<%=ifelse(components == 1, '', 's')%> contains the <%=paste(summary(prcomp(vars))$importance[2, 1:components] * 100, "%")%> of the variance<%=ifelse(components == 1, '', 's')%>, so together the <%=paste(sum(summary(prcomp(vars))$importance[2, 1:components] * 100), "%")%> of that.

### Visual representation

It could be informative to see visually how the observations lies on these components. On that two dimensional plot below, where the axes are the components which contains the two most variances, you can see (the red vectors) the effect of the variables as well. <% if(ncol(vars) > 5) { %> In the case we have several variables, the plot could be a little bit confusing but it still helps us to explore the number of the Principal Components. <% } %>

<%= 
biplot(prcomp(vars)) 
%>

<% if (rot.matrix) { %>

## Rotation


<%= 
ifelse(rot.matrix,"As you wanted to check the Rotation matrix let us present that for you:","")
if (rot.matrix) {
rot <- prcomp(vars)$rotation[,1:components]
emphasize.strong.cells(which(abs(rot) > 0.3, arr.ind = TRUE))
rot
} else { }
%>

The cells written in bold shows which components explain the most variances of the variables, with the help of them we can draw the following conclusion:
<%=paste(colnames(rot)[which(abs(rot) > 0.3, arr.ind = TRUE)[, 2]],rp.name(vars)[which(abs(rot) > 0.3, arr.ind = TRUE)[, 1]], sep = " is a principal component of ")%>.

<% if (length(which(rot > 0.3)) != length(which(abs(rot) > 0.3))) { %>

<%=neg.comp <- colnames(rot)[which(rot < -0.3, arr.ind = TRUE)[, 2]]%>

From them in the case<%=ifelse(neg.comp < 1, "s", "")%> of the <%=paste(colnames(rot)[which(rot < -0.3, arr.ind = TRUE)[, 2]],rp.name(vars)[which(rot < -0.3, arr.ind = TRUE)[, 1]], sep = "'s impact on ")%>, we can say <%=ifelse(neg.comp < 1, "they are", "that is")%> negative.
		
<% } else { %>
We can say that <%=ifelse(length(which(abs(rot) > 0.3)), "none of these impacts are negative", "this impact is positive")%>. 

<% }} %>

