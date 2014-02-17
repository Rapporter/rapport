## test-internals.R

tpl.no.htag.1 <- c("meta:", "  title: No body", "  author: Tester", "  description: Template with no body :'-(", "inputs:", "- name: c", "  class: 'character'", "  label: Character input", "  description: Character input", "  standalone: true", "head-->")
tpl.no.htag.2 <- c("<!--head", "meta:", "  title: No body", "  author: Tester", "  description: Template with no body :'-(", "inputs:", "- name: c", "  class: 'character'", "  label: Character input", "  description: Character input", "  standalone: true")
tpl.no.head <- c("<!--head", "head-->")
tpl.empty.head <- c("<!--head", "", " ", "\t", "\n", "head-->")
tpl.no.body <- c("<!--head", "meta:", "  title: No body", "  author: Tester", "  description: Template with no body :'-(", "inputs:", "- name: c", "  class: 'character'", "  label: Character input", "  description: Character input", "  standalone: true", "head-->")

no.body.err.msg.re <- "what good is a template if it has no body\\? http://bit\\.ly/11E5BQM"


context('Header tags')

expect_error(rapport:::rapport.read(tpl.no.htag.1), 'opening header tag not found in first line')
expect_error(rapport:::rapport.read(tpl.no.htag.2), 'closing header tag not found')
expect_error(rapport:::rapport.read(tpl.no.head), 'template header not found')
expect_error(rapport:::rapport.header(tpl.empty.head), 'template header is empty')


context('Template body presence')

expect_error(rapport:::rapport.read(tpl.no.body), no.body.err.msg.re)


## context("Rapport internal helpers")
