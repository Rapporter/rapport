## rapport internals helpers

context('Limit specifications')

test_that('should provide correct limits', {
    expect_that(rapport:::check.limit(""), equals(list(min = 1, max = 1)))
    expect_that(rapport:::check.limit("[1,20]"), equals(list(min = 1, max = 20)))
    expect_that(rapport:::check.limit("[20]"), equals(list(min = 20, max = 20)))
    expect_that(rapport:::check.limit("[0,1]", "number"), equals(list(min = 0, max = 1)))
    expect_that(rapport:::check.limit("-100,100", "number"), equals(list(min = -100, max = 100)))
    expect_that(rapport:::check.limit("-2.58, 2.58", "number"), equals(list(min = -2.58, max = 2.58)))
})

test_that('should throw error about invalid limit definition', {
    expect_that(rapport:::check.limit(","), throws_error('invalid limit definition'))
    expect_that(rapport:::check.limit("[,]"), throws_error('invalid limit definition'))
    expect_that(rapport:::check.limit("[2,]"), throws_error('invalid limit definition'))
    expect_that(rapport:::check.limit("[,2]"), throws_error('invalid limit definition'))
    expect_that(rapport:::check.limit("[2,2,2]"), throws_error('invalid limit definition'))
})

test_that('should throw error about zero limits', {
    expect_that(rapport:::check.limit("[]"), throws_error('limits cannot be zero'))
    expect_that(rapport:::check.limit("[0]"), throws_error('limits cannot be zero'))
})

test_that('should throw error about maximum limit', {
    expect_that(rapport:::check.limit("[20,10]"), throws_error('minimum limit cannot be greater than maximum limit'))
    expect_that(rapport:::check.limit("[-1.96,-2.58]", "number"), throws_error('minimum limit cannot be greater than maximum limit'))
})

test_that('should throw error about decimal and/or less than 1 limits', {
    expect_that(rapport:::check.limit("[0,1]"), throws_error('decimal and/or less than 1 limits only allowed for number inputs'))
    expect_that(rapport:::check.limit("[-2.58,2.58]"), throws_error('decimal and/or less than 1 limits only allowed for number inputs'))
})
