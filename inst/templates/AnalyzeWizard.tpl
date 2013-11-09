<!--head
meta:
  title: Analyze Wizard template
  author: Daniel Nagy, Gergely Daróczi
  description: In this template Rapporter will present you an analyzing wizard template, where we will show you the most important statistics between any kind of variables.
  email: ~
  packages: ~
  example:
  - rapport('AnalyzeWizard.tpl', data=ius2008, variables = c('edu', 'game'))
  - rapport('AnalyzeWizard.tpl', data=ius2008, variables = c('gender', 'game'))
  - rapport('AnalyzeWizard.tpl', data=ius2008, variables = c('edu', 'age'))
inputs:
- name: variables
  label: Used Variables
  description: These are the variables which Wizard will use
  length:
    min: 2.0
    max: 2.0
  required: yes
  standalone: no
head-->


<%=
v  <- na.omit(variables)
vc <- sapply(v, class, USE.NAMES = FALSE)

## force levels of measurement
vc <- sapply(vc, function(x)
             switch(x,
                    'factor'    = 'factor',
                    'character' = 'factor',
                    'logical'   = 'factor',
                    'integer'   = 'numeric',
                    'numeric'   = 'numeric',
                    'complex'   = 'numeric'))

if ('factor' %in% vc && 'numeric' %in% vc) {
    rapport("ANOVA.tpl", data = rp.data, resp = variables.name[which(vc == 'numeric')], fac = variables.name[which(vc == 'factor')])
} else {
    if ('factor' %in% vc) {
        rapport('Crosstable.tpl', data = ius2008, row = variables.name[1], col = variables.name[2])
    } else {
        rapport('Correlation.tpl', data = rp.data, vars = variables.name)
    }
}
%>


