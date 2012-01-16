## test_file('test-rp.prettyascii.R')
context('rp.round')

test_that('running examples: should not throw error', {
    expect_is(rp.round(22/7), 'character')
    expect_is(rp.round(22/7, T), 'character')
    expect_is(rp.round(22/7, short = TRUE), 'character')
    expect_is(rp.round(22/7, digits = 10), 'character')
    expect_is(rp.round(matrix(runif(9), 3, 3)), 'matrix')
})

test_that('running examples: checking returned value', {
    expect_equal(rp.round(22/7), "3.1429")
    expect_equal(rp.round(22/7, T), "3.14")
    expect_equal(rp.round(22/7, short = TRUE), "3.14")
    expect_equal(rp.round(22/7, digits = 10), "3.1428571429")
    expect_equal(rp.round(matrix(3, 3, 3)), structure(c(rep("3", 9)), .Dim = c(3L, 3L)))
})
