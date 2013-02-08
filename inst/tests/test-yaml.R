## YAML tests

context('YAML header specification')

expect_that(tpl.info("../templates/example.tpl"), is_identical_to(tpl.info("../templates/example-yaml.tpl")))
