## test_file("inst/tests/test-rapport.R")

context("Bundled template examples")

for (template in rapport.ls(path = system.file("templates", package = "rapport"), full.names = TRUE)) {
    test_that(template, {
        for (example in rapport.meta(template)$example)
            expect_that(eval(parse(text = example)), is_a('rapport'))
    })
}


context("Bundled deprecated template examples")

for (template in rapport.ls(path = system.file("templates/deprecated", package = "rapport"), full.names = TRUE)) {
    test_that(template, {
        for (example in rapport.meta(template)$example)
            expect_that(eval(parse(text = example)), is_a('rapport'))
    })
}


context("Errors (or lack thereof) in example report chunks")

for (template in rapport.ls()) {
    ## example template contains errors
    if (template != "Example.rapport") {
        test_that(template, {
            for (example in rapport.meta(template)$example) {
                e <- eval(parse(text = example))
                expect_that(rapport:::check.report.chunks(e, what = 'errors'),
                            equals(NULL),
                            info = paste(unlist(c('', sapply(e$report, function(x) c(x$msg$errors, x$robject$msg$errors)),'')), collapse = '\n\t* '))
            }
        })
    }
}
