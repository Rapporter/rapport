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

test_that('should be empty', {
    expect_true(is.empty(NULL))
    expect_true(is.empty(c()))
    expect_true(is.empty(list()))
    expect_true(is.empty(NA))
    expect_true(is.empty(NaN))
    expect_true(is.empty(""))
    expect_true(is.empty(0L))
    expect_true(is.empty(0.0))
    expect_true(is.empty("      "))
    expect_true(is.empty("\t \t"))
})

test_that('should NOT be empty', {
    expect_false(is.empty("foobar"))
    expect_false(is.empty("\t \t", trim = FALSE))
})

test_that('should be empty (vectorised)', {
    expect_true(all(is.empty(c(NULL, NULL, NULL, NULL))))
    expect_true(all(is.empty(list(character(), complex(), integer(), logical(), numeric(), raw()))))
    expect_true(all(is.empty(rep(NA, 10))))
    expect_true(all(is.empty(rep(NaN, 10))))
    expect_true(all(is.empty(matrix(NA, 10, 10))))
    expect_true(all(is.empty(rep("", 10))))
    expect_true(all(is.empty(rep(0L, 10))))
    expect_true(all(is.empty(rep(0.0, 10))))
    expect_true(all(is.empty(rep("      ", 10))))
    expect_true(all(is.empty(rep("\t \t", 10))))
})

test_that('should NOT be empty (vectorised)', {
    expect_false(all(is.empty(rep("foobar", 10))))
    expect_false(all(is.empty(rep("\t \t", 10), trim = FALSE)))
})
