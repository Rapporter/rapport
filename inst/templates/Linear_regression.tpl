<!--head
meta:
  title: Linear Regression
  author: Gergely Daróczi, Daniel Nagy
  description: This template will run a linear regression
  email: ~
  packages:
  - HH
  - car
  - nortest
  - gvlma
  example:
  - rapport('Linear_regression.tpl', data=ius2008, dep='age', indep='edu', indep.inter=F)
  - rapport('Linear_regression.tpl', data=ius2008, dep='age', indep='edu', indep.inter=T)
  - rapport('Linear_regression.tpl', data=mtcars, dep='carb', indep='cyl', indep.inter=F)
inputs:
- name: dep
  label: Dependent Variable
  description: This is the dependent variables which will be used here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
- name: indep
  label: Independent Variable(s)
  description: These are the independent variables which will be used here
  class: numeric
  length:
    min: 1.0
    max: 100.0
  required: yes
  standalone: no
- name: indep.inter
  label: Interaction
  description: Should be calculated the interaction between the independent variables
  class: logical
  required: yes
  standalone: yes
- name: crPlots
  label: crplot
  description: Plot checking linearity
  class: logical
  required: no
  value: yes
  standalone: yes
head-->

<%=
d <- structure(na.omit(data.frame(dep, indep)), .Names = c(dep.name, indep.name))
indep.int <- fml(dep.name, indep.name, join.right = "*")
indep.nonint <- fml(dep.name, indep.name, join.right = "+")
fit <- lm(ifelse(indep.inter, indep.int, indep.nonint), data = d)
indep.plu <- switch(indep.ilen, '', 's')
gvmodel <- tryCatch(gvlma(fit), error = function(e) e)
%>

# Introduction

With the help of the [linear regression](http://en.wikipedia.org/wiki/Linear_regression) we can investigate the relationship <%=ifelse(indep.ilen == 1, 'between two variables', 'between the variables')%>. More punctually we can observe if one of the variables, the so-called [dependent](http://en.wikipedia.org/wiki/Dependent_variable) variable, significantly depended on the other variable<%=indep.plu%>, if an increase/decrease on the dependent variable's values made an increase/decrease on the independent variable<%=indep.plu%>.
In this case we only observe linear relationships. <%=ifelse(indep.ilen == 1, '', 'As we use in the model more than 1 independent variables, we call the method [multivariate regression](http://en.wikipedia.org/wiki/Multivariate_regression_model).')%>

# Overview

<%= ifelse(indep.ilen == 1, '', 'Multivariate-') %>Linear Regression was carried out, with <%= p(indep.label) %> as independent variable<%= indep.plu %>, and <%= p(dep.label) %> as a dependent variable.

<% if (ncol(as.matrix(indep)) > 1) { %>
The [interaction](http://en.wikipedia.org/wiki/Interaction) between the independent variables was<%=ifelse(indep.inter, "", "n't")%> taken into account.
<% } %>


# Assumptions

<% if (!inherits(gvmodel, 'error')) { %>
In order to have reliable results, we have to check if the assumptions of the linear regression met with the data we used.

<%=
(summary(gvmodel))
decision <- (gvmodel$Decision)
decision <- summary(gvmodel)[, 3]
decision1 <- (decision[1] == 'Assumptions NOT satisfied!')
decision2 <- (decision[2] == 'Assumptions NOT satisfied!')
decision3 <- (decision[3] == 'Assumptions NOT satisfied!')
decision4 <- (decision[4] == 'Assumptions NOT satisfied!')
decision5 <- (decision[5] == 'Assumptions NOT satisfied!')
decision.any <- (any(decision == 'Assumptions NOT satisfied!'))
%>

To check these assumptions the so-called GVLMA, the Global Validation of Linear Model Assumptions will help us. The result of that we can see in the table above.

The GVLMA makes a thorough detection on the linear model, including tests generally about the fit, the shape of the distribution of the residuals ([skewness](http://en.wikipedia.org/wiki/Skewness) and [kurtosis](http://en.wikipedia.org/wiki/Kurtosis)), the linearity and the [homoskedasticity](http://en.wikipedia.org/wiki/Homoscedasticity). On the table we can see if our model met with the assumptions.
As a generally accepted thumb-rule we use the critical [p-value](http://en.wikipedia.org/wiki/P-value)=0.05.

So let's see the results, which the test gave us:

 - The general statistic tells us about the linear model, that it <%= ifelse(decision1, "does not fit to our data", "can fit to our data")%>.

 - According to the GVLMA the residuals of our model's skewness<%= ifelse(decision2, "", " does not")%> differs significantly from the normal distribution's skewness.

 - The residuals of our model's kurtosis<%= ifelse(decision3, "", " does not")%> differs significantly from the normal distribution's kurtosis, based on the result of the GVLMA.

 - In the row of the link function we can read that the linearity assumption of our model was <%=ifelse(decision4, "rejected", "accepted")%>.

 - At last but not least GVLMA confirms<%= ifelse(decision5, " the violation of", "") %> homoscedasticity.

In summary: We can<%=ifelse(decision.any, " 't", "")%> be sure that the linear model used here fits to the data.

References:

  * Pena, EA and Slate, EH (2006): Global validation of linear model assumptions. _J. Amer. Statist. Assoc._ **101** (473):341-354.

<% } else { %>

We could not test the assumptions as the following R error occured: <%=gvmodel$message%>

<% } %>

### Nonlinearity

As we want to fit a linear regression model, it is advisable to see if the relationship between the used variables are linear indeed.
Next to the test statistic of the GVLMA it is advisable to use a graphical device as well to check that linearity. Here we will use the so-called crPlots funtion to do that, which is an abbreviation of the Component + Residual Plot.

<%=
fit.nonint <- lm(indep.nonint, data = d)
suppressWarnings(crPlots(fit.nonint))
%>

Here comes the question: What do we see on the plot?
First of all we can see two lines and several circles. The red interrupted line is the best fitted linear line, which means that te square of the residuals are the least while fitting that line in the model. The green curved line is the best fitted line, which does not have to be straight, of all. The observations we investigate are the circles.
We can talk about linearity if the green line did not lie too far from the red.
<%=ifelse(indep.ilen==1,'','The other plots we see are simple [boxplots](http://en.wikipedia.org/wiki/Box_plot).')%>

Next to these options there is a possibility to have a glance on the so-called diagnostic plots, which on we can see the residuals in themselves and in standardized forms.
<%=
par(mfrow = c(2, 2))
+plot(fit)
%>

<% if (ncol(d) > 2) { %>

### Multicollinearity

<%=
mcoll <- as.table(matrix(c(vif(fit), 1 / vif(fit)), ncol(d)-1, 2))
colnames(mcoll) <- c("VIF", "Tolerance")
rownames(mcoll) <- c(indep.name)
mcoll 
CNM <- as.table(kappa(fit))
row.names(CNM) <- "The Condition Number of a Matrix"
CNM
%>
<% } else { } %>

# Results

After successfully checked the assumptions we can finally turn to the main part of the interest, the results of the Linear Regression Model.
From the table we can read the variables <%=ifelse(indep.inter,'and interactions ','')%>which have significant effect on the dependent variable.

<%=
set.caption(sprintf('Fitting linear model: %s based on %s', dep.name, p(indep.name)))
fit
gof <- as.table(c(nrow(d), summary(fit)$adj.r.squared, AIC(fit), BIC(fit)),1,4)
rownames(gof) <- c("Number of Cases", "Adjusted R Squared", "AIC", "BIC")
gof
p_val <- summary(fit)$coefficients[, 4]
%>

From the table one can see that <%= paste(rownames(summary(fit)$coefficients)[which(p_val < 0.05)], round(p_val, 3)[which(p_val < 0.05)], sep = " has significant effect on the dependent variable, the p-value of that is ")%>

The model <%= sprintf("%s %s well", ifelse(gof[2] > 0.2, "fits", "does not fit"), ifelse(gof[2] > 0.4, "very", "")) %>, because the Adjusted R Square is <%=gof[2]%>.



