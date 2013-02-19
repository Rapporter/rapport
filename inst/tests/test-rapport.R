## test_file("inst/tests/test-rapport.R")

context("Bundled template examples")

for (template in tpl.list(path = system.file("templates", package = "rapport"), full.names = TRUE)) {
    test_that(template, {
        for (example in tpl.meta(template)$example)
            expect_that(eval(parse(text = example)), is_a('rapport'))
    })
}


context("Bundled deprecated template examples")

for (template in tpl.list(path = system.file("templates/deprecated", package = "rapport"), full.names = TRUE)) {
    test_that(template, {
        for (example in tpl.meta(template)$example)
            expect_that(eval(parse(text = example)), is_a('rapport'))
    })
}


context("Errors (or lack thereof) in example report chunks")

for (template in tpl.list()) {
    ## example template contains errors
    if (template != "example.tpl") {
        test_that(template, {
            for (example in tpl.meta(template)$example)
                expect_that(check.report.chunks(eval(parse(text = example))), equals(NULL))
        })
    }
}
