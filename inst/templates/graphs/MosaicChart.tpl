<!--head
meta:
  title: Graphing (Mosaic Chart)
  author: Daniel Nagy
  description: In this template Rapporter will present you a Mosaic Chart.
  email: ~
  packages:
  - ggplot2
  example: ~
inputs:
- name: x
  label: Used Variable
  description: This is the x variable that you will use here
  class: factor
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
- name: y
  label: Used Variable
  description: This is the y variable that you will use here
  class: factor
  length:
    min: 1.0
    max: 1.0
  required: no
  standalone: no
head-->

<%=
panderOptions('graph.legend.position', 'top')
%>


<%=
table <- table(rp.data[,x.name], rp.data[,y.name], deparse.level = 0, useNA = 'no')

set.caption('Mosaic chart')
t        <- melt(table)
t$x      <- rowSums(table) / sum(table) * 100
t$xmax   <- cumsum(rowSums(table)) / sum(table) * 100
t$xmin   <- t$xmax - t$x
t$y      <- t$value / rep(rowSums(table), ncol(table)) * 100
t        <- t[with(t, order(Var.1)), ]
t$ymax   <- cumsum(t$y) - as.vector(sapply(1:nrow(table) - 1, rep, ncol(table))) * 100
t$ymin   <- t$ymax - t$y
t$xxtext <- with(t, xmin + (xmax - xmin) / 2)
t$xytext <- as.vector(sapply(rep(c(103, -3), length.out = nrow(table)), rep, ncol(table)))
ggplot(t, aes(ymin = ymin, ymax = ymax, xmin = xmin, xmax = xmax, fill = Var.2)) + geom_rect() + geom_rect(colour = 'white', show_guide = FALSE) + geom_text(aes(x = xxtext, y = xytext, label = Var.1), size = 4) + xlab('') + ylab('') + theme(legend.position = 'top') + labs(fill = '')
%>
