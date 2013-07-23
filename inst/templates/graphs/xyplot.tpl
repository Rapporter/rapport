<!--head
meta:
  title: Graphing
  author: Rapporter team
  description: In this template Rapporter will present you a qqplot.
  email: ~
  packages:
  - RColorBrewer
inputs:
- name: x
  label: Used Variable
  description: This is the x variable that you will use here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
- name: y
  label: Used Variable
  description: This is the y variable that you will use here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: no
  standalone: no
- name: plot.title.pos
  label: Position of the title of the plot
  description: Specifying the position of the title of the plot
  class: character
  options:
  - on the plot
  - outside the plot
  - nowhere
  value: nowhere
  matchable: yes
  allow_multiple: no
  required: no
  standalone: yes
- name: plot.title
  label: Title of the plot
  description: This is good to set the title of the plot.
  class: character
  value: default
  matchable: no
  required: no
- name: x.lab
  label: X label
  description: This is the name of the X label on the plot.
  class: character
  value: default
  matchable: no
  allow_multiple: no
  required: no
  standalone: yes
- name: y.lab
  label: Y label
  description: This is the name of the Y label on the plot.
  class: character
  value: default
  matchable: no
  allow_multiple: no
  required: no
  standalone: yes
- name: nomargin
  label: Graph no margin
  description: if trying to keep plots' margins at minimal
  class: logical
  value: TRUE
  matchable: no
  allow_multiple: no
  required: no
  standalone: yes
- name: fontfamily
  label: Family of the font
  description: Specifying the font family to be used in images
  class: character
  options:
  - serif
  - sans
  - mono
  - symbol
  value: sans
  matchable: yes
  allow_multiple: no
  required: no
  standalone: yes
- name: fontcolor
  label: Color of the font
  description: Specifying the default font color
  class: character
  value: black
  matchable: no
  allow_multiple: no
  required: no
  standalone: yes
- name: fontsize
  label: Size of the font
  description: Specifying the base font size in pixels
  class: integer
  value: 12
  matchable: no
  allow_multiple: no
  required: no
  standalone: yes
- name: grid
  label: Grid
  description: If a grid should be added to the plot
  class: logical
  value: TRUE
  matchable: no
  allow_multiple: no
  required: no
  standalone: yes
- name: grid.minor
  label: Grid minor
  description: If a miner grid should be also rendered
  class: logical
  value: TRUE
  matchable: no
  allow_multiple: no
  required: no
  standalone: yes
- name: grid.color
  label: Color of the grid
  description: Specifying the color of the rendered grid
  class: character
  value: grey
  matchable: no
  allow_multiple: no
  required: no
  standalone: yes
- name: grid.lty
  label: Line type of the grid
  description: Specifying the line type of grid
  class: character
  options:
  - blank
  - solid
  - dashed
  - dotted
  - dotdash
  - longdash
  - twodash
  value: dashed
  matchable: yes
  allow_multiple: no
  required: no
  standalone: yes
- name: boxes
  label: Graph boxes
  description: If to render a border around of plot (and e.g. around strip)
  class: logical
  value: FALSE
  matchable: no
  allow_multiple: no
  required: no
  standalone: yes
- name: legend.position
  label: Position of the legend
  description: Specifying the position of the legend
  class: character
  options:
  - top
  - right
  - bottom
  - left
  value: right
  matchable: yes
  allow_multiple: no
  required: no
  standalone: yes
- name: background
  label: Background's color
  description: Specifying the plots main background's color
  class: character
  value: white
  matchable: no
  allow_multiple: no
  required: no
  standalone: yes
- name: color.rnd
  label: Reordered colors
  description: Specifying if the palette should be reordered randomly before rendering each plot to get colorful images
  class: logical
  value: FALSE
  matchable: no
  allow_multiple: no
  required: no
  standalone: yes
- name: axis.angle
  label: Angle of the axes
  description: Specifying the angle of axes' labels
  class: integer
  limit:
    min: 1.0
    max: 4.0
  value: 1.0
  matchable: no
  allow_multiple: no
  required: no
  standalone: yes
- name: symbol
  label: Angle of the axis
  description: Specifying a symbol
  class: integer
  value: 1
  matchable: no
  allow_multiple: no
  required: no
  standalone: yes
head-->


<%=
if (nomargin != TRUE) panderOptions('graph.nomargin', nomargin)
if (fontfamily != "sans") panderOptions('graph.fontfamily', fontfamily)
if (fontcolor != "black") panderOptions('graph.fontcolor', fontcolor)
if (fontsize != 12) panderOptions('graph.fontsize', fontsize)
if (grid != TRUE) panderOptions('graph.grid', grid)
if (grid.minor != TRUE) panderOptions('graph.grid.minor', grid.minor)
if (grid.color != "grey") panderOptions('graph.grid.color', grid.color)
if (grid.lty != "dashed") panderOptions('graph.grid.lty', grid.lty)
if (boxes != FALSE) panderOptions('graph.boxes', boxes)
if (legend.position != "right") panderOptions('graph.legend.position', legend.position)
if (background != "white") panderOptions('graph.background', background)
if (color.rnd != FALSE) panderOptions('graph.color.rnd', color.rnd)
if (axis.angle != 1) panderOptions('graph.axis.angle', axis.angle)
if (symbol != 1) panderOptions('graph.symbol', symbol)

if (plot.title == "default") {
main_lab <- sprintf('Scatterplot of %s and %s',x.name, y.name)
} else {
main_lab <- plot.title
}
if (x.lab == "default")  x_lab <- sprintf(x.label)
if (y.lab == "default")  y_lab <- sprintf(y.label)

x <- na.omit(x)
y <- na.omit(y)
set.caption(ifelse(plot.title.pos == "outside the plot", main_lab, ""))
xyplot(x ~ y, main = ifelse(plot.title.pos == "on the plot", main_lab, ""), ylab = ifelse(x.lab == "default", x_lab, x.lab), xlab = ifelse(y.lab == "default", y_lab, y.lab))

%>
