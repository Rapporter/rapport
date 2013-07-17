<!--head
meta:
  title: Graphing
  author: Rapporter team
  description: In this template Rapporter will present you a barplot.
  email: ~
  packages:
  - grDevices
  - RColorBrewer
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
  standalone: yes
- name: log.scale
  label: Is the variable's scale logarithmic
  description: Is the variable's scale logarithmic?
  class: logical
  value: FALSE
  matchable: no
  required: no
  standalone: yes
- name: var.lab
  label: Label of the axis
  description: This is the label of the axis on the plot.
  class: character
  value: default
  matchable: no
  required: no
  standalone: yes
- name: horizontal
  label: Horizontal bars
  description: If TRUE, the bars are drawn horizontally with the first at the bottom
  class: logical
  value: FALSE
  matchable: no
  required: no
  standalone: yes
- name: col.bar
  label: Colors of Bars
  description: The color of the bars on the plot
  class: character
  value: red
  matchable: no
  required: no
  standalone: yes
- name: bar.text.type
  label: Type of the text of the bar
  description: Specifying the type of the text of the bar (frequency or percentage)
  class: character
  options:
  - frequency
  - percentage
  value: frequency
  matchable: yes
  allow_multiple: no
  required: no
  standalone: yes
- name: bar.text.pos
  label: Position of the text of the bar
  description: Specifying the position of the text which shows the height of the bar
  class: character
  options:
  - under the top of the bar
  - on the right side of the bar
  - above the top of the bar
  - on the left side of the bar
  value: above the top of the bar
  matchable: yes
  required: no
  standalone: yes
- name: bar.text.col
  label: Bar text's color
  description: Specifying the bar's text's color
  class: character
  value: black
  matchable: no
  required: no
  standalone: yes
- name: bar.space
  label: Space between bars
  description: Specifying the space between the bars
  class: numeric
  limit:
    min: 0.0
    max: 1000
  value: 0.2
  matchable: no
  required: no
  standalone: yes
- name: nomargin
  label: Graph no margin
  description: if trying to keep plots' margins at minimal
  class: logical
  value: TRUE
  matchable: no
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
  required: no
  standalone: yes
- name: fontsize
  label: Size of the font
  description: Specifying the base font size in pixels
  class: integer
  value: 12
  matchable: no
  required: no
  standalone: yes
- name: grid
  label: Grid
  description: If a grid should be added to the plot
  class: logical
  value: TRUE
  matchable: no
  required: no
  standalone: yes
- name: grid.minor
  label: Grid minor
  description: If a miner grid should be also rendered
  class: logical
  value: TRUE
  matchable: no
  required: no
  standalone: yes
- name: grid.color
  label: Color of the grid
  description: Specifying the color of the rendered grid
  class: character
  value: grey
  matchable: no
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
  required: no
  standalone: yes
- name: colp
  label: Color palette
  description: Color paletter from colorbrewer.com
  required: no
  class: character
  value: Set1
  length:
    min: 1.0
    max: 1.0  
  matchable: yes
  standalone: yes
  options:
  - BrBG
  - PiYG
  - PRGn
  - PuOr
  - RdBu
  - RdGy
  - RdYlBu
  - RdYlGn
  - Spectral
  - Accent
  - Dark2
  - Paired
  - Pastel1
  - Pastel2
  - Set1
  - Set2
  - Set3
  - Blues
  - BuGn
  - BuPu
  - GnBu
  - Greens
  - Greys
  - Oranges
  - OrRd
  - PuBu
  - PuBuGn
  - PuRd
  - Purples
  - RdPu
  - Reds
  - YlGn
  - YlGnBu
  - YlOrBr
  - YlOrRd
  allow_multiple: no
- name: color.rnd
  label: Reordered colors
  description: Specifying if the palette should be reordered randomly before rendering each plot to get colorful images
  class: logical
  value: FALSE
  matchable: no
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
  required: no
  standalone: yes
- name: symbol
  label: Specifying a symbol
  description: Specifying a symbol
  class: integer
  value: 1
  matchable: no
  required: no
  standalone: yes
head-->

<%=
evalsOptions('graph.unify', FALSE)
%>

<%=
var <- as.vector(na.omit(var))

if (plot.title == "default")  main_lab <- sprintf('Barplot of %s',var.name)
if (var.lab == "default")  var_lab <- sprintf(var.label)

if (bar.text.type == "frequency"){
labels <- table(var)
} else {
labels <- paste(round(table(var)/length(var),4)*100, "%")
}

if(bar.text.pos == "under the top of the bar") bar.text.pos <- 1
if(bar.text.pos == "on the left side of the bar") bar.text.pos <- 2
if(bar.text.pos == "above the top of the bar") bar.text.pos <- 3
if(bar.text.pos == "on the right side of the bar") bar.text.pos <- 4



#if (nomargin != TRUE) panderOptions('graph.nomargin', nomargin)
#if (fontfamily != "sans") panderOptions('graph.fontfamily', fontfamily)
#if (fontcolor != "black") panderOptions('graph.fontcolor', fontcolor)
#if (fontsize != 12) panderOptions('graph.fontsize', fontsize)
#if (grid != TRUE) panderOptions('graph.grid', grid)
#if (grid.minor != TRUE) panderOptions('graph.grid.minor', grid.minor)
#if (grid.color != "grey") panderOptions('graph.grid.color', grid.color)
#if (grid.lty != "dashed") panderOptions('graph.grid.lty', grid.lty)
#if (boxes != FALSE) panderOptions('graph.boxes', boxes)
#if (legend.position != "right") panderOptions('graph.legend.position', legend.position)
#if (background != "white") panderOptions('graph.background', background)
#if (color.rnd != FALSE) panderOptions('graph.color.rnd', color.rnd)
#if (axis.angle != 1) panderOptions('graph.axis.angle', axis.angle)
#if (symbol != 1) panderOptions('graph.symbol', symbol)

#if (colp != "Set1") panderOptions('graph.colors', cs)


fc  <- fontcolor
fbs <- fontsize
bc  <- background
gc  <- grid.color
cex <- fbs/12
cs <- brewer.pal(brewer.pal.info[which(rownames(brewer.pal.info) == colp),1], colp)
if (color.rnd) {cs  <- sample(cs) }
cb  <- cs[1]


par(
    family   = fontfamily,
    cex      = cex, cex.axis = cex * 0.8, cex.lab = cex, cex.main = cex * 1.2, cex.sub = cex,
    bg       = bc, 
    las      = axis.angle,
    lwd      = 2,
    pch      = symbol,
    col.axis = fc, col.lab = fc, col.main = fc, col.sub = fc)
+if (nomargin) {
            par(mar = c(4.1, 4.3, 2.1, 0.1))
        }
+if (boxes) {
par(fg = background)
}
+if (horizontal) {
set.caption(ifelse(plot.title.pos == "outside the plot", main_lab, ""))
bp <- barplot(table(var), main = ifelse(plot.title.pos == "on the plot", main_lab, ""), ylab = ifelse(var.lab == "default", var_lab, var.lab), space=bar.space, log=ifelse(log.scale,"x",""), horiz=horizontal, plot=FALSE)
barplot(table(var), main = ifelse(plot.title.pos == "on the plot", main_lab, ""), ylab = ifelse(var.lab == "default", var_lab, var.lab), space=bar.space, log=ifelse(log.scale,"x",""), horiz=horizontal, col=cb)
text(as.numeric(table(var)), bp, labels=labels, pos=bar.text.pos, offset=0.5, col=bar.text.col) 
} else {
set.caption(ifelse(plot.title.pos == "outside the plot", main_lab, ""))
bp <- barplot(table(var), main = ifelse(plot.title.pos == "on the plot", main_lab, ""), xlab = ifelse(var.lab == "default", var_lab, var.lab), space=bar.space, log=ifelse(log.scale,"x",""),horiz=horizontal,  plot=FALSE)
barplot(table(var), main = ifelse(plot.title.pos == "on the plot", main_lab, ""), xlab = ifelse(var.lab == "default", var_lab, var.lab), space=bar.space, log=ifelse(log.scale,"x",""),horiz=horizontal, col=cb)
text(bp, as.numeric(table(var)), labels=labels, pos=bar.text.pos, offset=0.5, col=bar.text.col) 
 }
+if (grid){
grid(lty = grid.lty, col = grid.color, lwd = 0.5)
}
+if (grid.minor) {
pander:::add.minor.ticks(2, 2, grid = TRUE)
}

%>
