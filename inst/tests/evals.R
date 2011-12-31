## test_file('rp.eval.R')
context('No output generated')

test_that('No output should be', {
    expect_that(rp.eval('x <- rnorm(100)'), is_a("list"))
})
test_that('No output should be', {
    expect_that(rp.eval('x <- rnorm(100)')[[1]],
                equals(list(src='x <- rnorm(100)',
                            output=NULL,
                            type="NULL",
                            msg=list(messages=NULL, warnings=NULL, errors=NULL)
                            )))
})
test_that('No output should be', {
    expect_that(rp.eval('### comment')[[1]],
                equals(list(src='### comment',
                            output=NULL,
                            type="NULL",
                            msg=list(messages=NULL, warnings=NULL, errors=NULL)
                            )))
})

context('Vector output generated')
test_that('Integer output', {
    expect_that(rp.eval('1:10')[[1]],
                equals(list(src='1:10',
                            output=1:10,
                            type="integer",
                            msg=list(messages=NULL, warnings=NULL, errors=NULL)
                            )))
})
test_that('Integer output', {
    expect_that(rp.eval('rep(pi,5)')[[1]],
                equals(list(src='rep(pi,5)',
                            output=rep(pi,5),
                            type="numeric",
                            msg=list(messages=NULL, warnings=NULL, errors=NULL)
                            )))
})

context('Plot output generated')
test_that('Plot class', {
    expect_that(rp.eval('hist(1:10)')[[1]]$type,
                equals("character"))
})
test_that('Plot class', {
    expect_that(rp.eval('hist(1:10)')[[1]]$output,
                is_a('character'))
})
test_that('Plot class', {
    expect_that(file.exists(rp.eval('hist(1:10)')[[1]]$output),
                is_true())
})
test_that('Plot class', {
    expect_that(file.exists(rp.eval(c('plot(mtcars$hp, pch = 19)','text(mtcars$hp, label = rownames(mtcars), pos = 4)'))[[1]]$output),
                is_true())
})

context('Error/warning handling')
test_that('Error handling', {
    expect_that(rp.eval('Old MacDonald had a farm\\dots')[[1]],
                equals(list(src='Old MacDonald had a farm\\dots',
                            output=NULL,
                            type=NULL,
                            msg=list(messages=NULL, warnings=NULL, errors="Malformed R code found in \"Old MacDonald had a farm\\dots\"")
                            )))
})
test_that('Error handling', {
    expect_that(rp.eval('runiff(20)')[[1]],
                equals(list(src='runiff(20)',
                            output=NULL,
                            type=NULL,
                            msg=list(messages=NULL, warnings=NULL, errors="Malformed R code found in \"runiff(20)\"")
                            )))
})
test_that('Warning handling', {
    expect_that(rp.eval('chisq.test(mtcars$gear, mtcars$hp)')[[1]],
                equals(list(src='chisq.test(mtcars$gear, mtcars$hp)',
                            output=suppressWarnings(chisq.test(mtcars$gear, mtcars$hp)),
                            type='htest',
                            msg=list(messages=NULL, warnings="Chi-squared approximation may be incorrect", errors=NULL)
                            )))
})
