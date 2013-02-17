## test_file("inst/tests/test-utils.R")

context('trim.spaces')

test_that('should trim spaces from both ends', {
    expect_equal(trim.space(" \t\n\rfoo\t\n\r "), "foo")
})

test_that('should trim trailing spaces', {
    expect_equal(trim.space(" \t\n\rfoo\t\n\r ", 'leading'), "foo\t\n\r ")
})

test_that('should trim leading spaces', {
    expect_equal(trim.space(" \t\n\rfoo\t\n\r ", 'trailing'), " \t\n\rfoo")
})

test_that('should trim spaces from both ends (vectorised)', {
    expect_equal(trim.space(c(" \t\n\rfoo\t\n\r ", " \t\n\rbar\t\n\r ")), c("foo", "bar"))
})

test_that('should trim trailing spaces (vectorised)', {
    expect_equal(trim.space(c(" \t\n\rfoo\t\n\r ", " \t\n\rbar\t\n\r "), 'leading'), c("foo\t\n\r ", "bar\t\n\r "))
})

test_that('should trim leading spaces (vectorised)', {
    expect_equal(trim.space(c(" \t\n\rfoo", " \t\n\rbar"), 'trailing'), c(" \t\n\rfoo", " \t\n\rbar"))
})


context('is.empty')
