<!--head
meta:
  title: Crosstable
  author: Gergely Daróczi
  email: gergely@snowl.net
  packages: descr
  example:
  - rapport('crosstable', data=ius2008, row='gender', col='dwell')
  - rapport('crosstable', data=ius2008, row='email', col='dwell')
  description: Returning the Chi-squared test of two given variables with count, percentages
    and Pearson's residuals table.
inputs:
- name: row
  label: Row variable
  description: A categorical variable.
  class: factor
  length: 1
  value: ~
  required: TRUE
  standalone: FALSE
- name: col
  label: Column variable
  description: A categorical variable.
  class: factor
  length: 1
  value: ~
  required: TRUE
  standalone: FALSE
- name: annotation
  label: Annotation
  description: Should textual annotations be added to the report?
  class: logical
  length: 1
  value: TRUE
  required: FALSE
  standalone: TRUE
head-->

# Variable description

Two variables specified:

 * "<%=rp.name(row)%>"<%=ifelse(rp.label(row)==rp.name(row), '', sprintf(' ("%s")', rp.label(row)))%> with <%=rp.valid(as.numeric(row))%> and
 * "<%=rp.name(col)%>"<%=ifelse(rp.label(col)==rp.name(col), '', sprintf(' ("%s")', rp.label(col)))%> with <%=rp.valid(as.numeric(col))%> valid values.

# Counts

<%=
table		<- table(row, col, deparse.level = 0, useNA = 'ifany')
if (length(which(is.na(rownames(table)))) > 0)
    rownames(table)[which(is.na(rownames(table)))] <- 'Missing'
if (length(which(is.na(colnames(table)))) > 0)
    colnames(table)[which(is.na(colnames(table)))] <- 'Missing'
fulltable	<- addmargins(table)
# fulltable.nrow  <- nrow(fulltable)
# fulltable.ncol  <- ncol(fulltable)
# fulltable[fulltable.nrow, ] <- paste0('**', fulltable[fulltable.nrow, ], '**')
# rownames(fulltable)[fulltable.nrow] <- paste0('**', rownames(fulltable)[fulltable.nrow], '**')
# fulltable[1:fulltable.nrow-1, fulltable.ncol] <- paste0('**', fulltable[1:fulltable.nrow-1, fulltable.ncol], '**')
set.caption('Counted values')
set.alignment(row.names = "right")
fulltable
%>

<%if (annotation) {
   table.max <- which(table == max(table), arr.ind = TRUE)
%>

Most of the cases (<%=table[table.max]%>) can be found in "<%=paste(rownames(table)[table.max[,1]], colnames(table)[table.max[,2]], sep = '-')%>" categories. Row-wise "<%=names(which.max(rowSums(table)))%>" holds the highest number of cases (<%=max(rowSums(table))%>) while column-wise "<%=names(which.max(colSums(table)))%>" has the utmost cases (<%=max(colSums(table))%>).

<% } %>

# Percentages

<%=
set.caption('Total percentages')
set.alignment(row.names = "right")
fulltable <- round(addmargins(prop.table(table)*100), 2)
# fulltable <- trim.space(fulltable, leading = TRUE)
# fulltable.nrow  <- nrow(fulltable)
# fulltable.ncol  <- ncol(fulltable)
# fulltable[fulltable.nrow, ] <- paste0('**', fulltable[fulltable.nrow, ], '**')
# rownames(fulltable)[fulltable.nrow] <- paste0('**', rownames(fulltable)[fulltable.nrow], '**')
# fulltable[1:fulltable.nrow-1, fulltable.ncol] <- paste0('**', fulltable[1:fulltable.nrow-1, fulltable.ncol], '**')
fulltable
%>

<%=
set.caption('Row percentages')
set.alignment(row.names = "right")
fulltable <- round(prop.table(addmargins(table, 1), 1)*100, 2)
# fulltable <- trim.space(fulltable, leading = TRUE)
# fulltable.nrow  <- nrow(fulltable)
# fulltable[fulltable.nrow, ] <- paste0('**', fulltable[fulltable.nrow, ], '**')
# rownames(fulltable)[fulltable.nrow] <- paste0('**', rownames(fulltable)[fulltable.nrow], '**')
fulltable
%>

<%=
set.caption('Column percentages')
set.alignment(row.names = "right")
fulltable <- round(prop.table(addmargins(table,2 ), 2)*100, 2)
# fulltable <- trim.space(fulltable, leading = TRUE)
# fulltable.ncol  <- ncol(fulltable)
# fulltable[, fulltable.ncol] <- paste0('**', fulltable[, fulltable.ncol], '**')
fulltable
%>

# Chi-squared test

<%=
t <- suppressWarnings(chisq.test(table))
lambda <- lambda.test(table)
cramer <- sqrt(as.numeric(t$statistic)/(sum(table)*min(dim(table))))
t
%>

<%if (t$p.value < 0.05) { %>

It seems that a real association can be pointed out between *<%=rp.name(row)%>* and *<%=rp.name(col)%>* by the *<%=t$method%>* ($\chi$=<%=as.numeric(t$statistic)%> at the degree of freedom being <%=as.numeric(t$parameter)%>) at the significance level of <%=t$p.value%>.

Based on Goodman and Kruskal's lambda it seems that *<%=c(rp.name(col),rp.name(row))[which.max(lambda)]%>* ($\lambda$=<%=pander.return(max(as.numeric(lambda)))%>) has an effect on *<%=c(rp.name(col),rp.name(row))[which.min(lambda)]%>* ($\lambda$=<%=min(as.numeric(lambda))%>) if we assume both variables to be nominal.

The association between the two variables seems to be <%=ifelse(cramer < 0.5, "weak", "strong")%> based on Cramer\'s V (<%=cramer%>).

<% } else { %>

It seems that no real association can be pointed out between *<%=rp.name(row)%>* and *<%=rp.name(col)%>* by the *<%=t$method%>* ($\chi$=<%=as.numeric(t$statistic)%> at the degree of freedom being <%=as.numeric(t$parameter)%>) at the significance level of <%=t$p.value%>.

For this end no other statistical tests were performed.

<% } %>

<%=
set.caption('Pearson\'s residuals')
set.alignment(row.names = "right")
table		<- table(row, col, deparse.level = 0)
table.res <- suppressWarnings(CrossTable(table))$chisq$stdres
table.res <- round(table.res, 2)
table.res.highlow  <- which(table.res < -2 | table.res > 2, arr.ind = TRUE)
#table.res <- trim.space(round(table.res, 2), leading = TRUE)
#table.res[table.res.highlow] <- paste0('**', table.res[table.res.highlow], '**')
table.res
%>

<%=
if (annotation) {
   ## table.res.high     <- which(table.res >  2, arr.ind = TRUE)
   ## table.res.low      <- which(table.res < -2, arr.ind = TRUE)
   if (nrow(table.res.highlow) > 0)
      sprintf('Based on Pearson\'s resuals the following cells seems interesting (with values higher then `2` or lower then `-2`):\n%s', paste(sapply(1:nrow(table.res.highlow), function(i) sprintf('\n * "%s - %s"', rownames(table)[table.res.highlow[i, 1]], colnames(table)[table.res.highlow[i, 2]])), collapse = ''))
   else
      sprintf('No interesting (higher then `2` or lower then `-2`) values found based on Pearson\'s residuals.')

}
%>

# Charts

<%=
set.caption('Mosaic chart')
mosaicplot(table, shade=T, main=NULL)
%>
