<!--head
meta:
  title: Graphing
  author: Rapporter team
  description: In this template Rapporter will present you a barplot.
  email: ~
  packages:
  - grDevices
  example:
  - rapport
inputs:
- name: var
  label: Used Variable
  description: This is the variable that you will use here
  class: numeric
  length:
    min: 1.0
    max: 1.0
  required: yes
  standalone: no
- name: main.lab
  label: Main name of the plot
  description: This is good to set the main name of the plot.
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
- name: col.bar
  label: Color's of Bar's
  description: The color of the bars on the plot
  class: character
  value: red
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
if (nomargin != "sans") panderOptions('graph.fontfamily', fontfamily)
if (nomargin != "black") panderOptions('graph.fontcolor', fontcolor)
if (nomargin != 12) panderOptions('graph.fontsize', fontsize)
if (nomargin != TRUE) panderOptions('graph.grid', grid)
if (nomargin != TRUE) panderOptions('graph.grid.minor', grid.minor)
if (nomargin != "grey") panderOptions('graph.grid.color', grid.color)
if (nomargin != "dashed") panderOptions('graph.grid.lty', grid.lty)
if (nomargin != FALSE) panderOptions('graph.boxes', boxes)
if (nomargin != "right") panderOptions('graph.legend.position', legend.position)
if (nomargin != "white") panderOptions('graph.background', background)
if (nomargin != FALSE) panderOptions('graph.color.rnd', color.rnd)
if (nomargin != 1) panderOptions('graph.axis.angle', axis.angle)
if (nomargin != 1) panderOptions('graph.symbol', symbol)

# if (nomargin != "transparent") panderOptions('graph.panel.background', panel.background) didnt find the other possibilities so redundant to parameterize
# if (nomargin != TRUE) panderOptions('graph.colors') would need character vector/palette

var <- as.vector(na.omit(var))

if (main.lab == "default")  main_lab <- sprintf('Barplot of %s',var.name)
if (y.lab == "default")  y_lab <- sprintf(var.label)
if (min(var) >= 0)  {
y_min <- 0
} else {
y_min <- min(var)*1.1
}
y_max <- max(var)*1.1

bp <- barplot(var, main = ifelse(main.lab == "default", main_lab, main.lab), ylab = ifelse(y.lab == "default", y_lab, y.lab), xlim= c(0,length(var)), ylim = c(y_min,y_max))
+lines(var, bp, type = "h", col = col.bar, lwd = 3)
%>



