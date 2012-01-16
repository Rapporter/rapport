## test_file('test-rapport.R')

context('rapport')

require(rapport)
templates <- tpl.list()
for (template in templates) {
    test_that(template, {
        for (example in tpl.info('example')$meta$example) {
            expect_that(eval(parse(text=example)), is_a('rapport'))
        }
    })    
}
