## test_file('test-rapport.R')

templates <- tpl.list()

context('rapport')

# run all examples
for (template in templates) {
    test_that(template, {
        for (example in tpl.info(template)$meta$example) {
            expect_that(eval(parse(text=example)), is_a('rapport'))
        }
    })    
}
