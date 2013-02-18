## test_file("inst/tests/test-stat_helpers.R")

context('Skewness tests')

test_that('should be vectorised', {
    expect_equal(skewness(mtcars), sapply(mtcars, skewness))
})


context('Kurtosis tests')

test_that('should be vectorised', {
    expect_equal(kurtosis(mtcars), sapply(mtcars, kurtosis))
})
