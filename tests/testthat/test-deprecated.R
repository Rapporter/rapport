## test_file("inst/tests/test-deprecated.R")

context('Deprecated input specifications')

test_that('should have length 1', {
    expect_that(rapport:::guess.old.input.length("", "variable"), equals(list(min = 1, max = 1)))
    expect_that(rapport:::guess.old.input.length("[]", "variable"), equals(list(min = 1, max = 1)))
    expect_that(rapport:::guess.old.input.length("[1,]", "variable"), equals(list(min = 1, max = 1)))
    expect_that(rapport:::guess.old.input.length("[10,]", "variable"), equals(list(min = 10, max = 10)))
})

test_that('should have correct length', {
    expect_that(rapport:::guess.old.input.length("[1,20]", "variable"), equals(list(min = 1, max = 20)))
    expect_that(rapport:::guess.old.input.length("[20]", "variable"), equals(list(min = 20, max = 20)))
    expect_that(rapport:::guess.old.input.length("[0,1]", "number"), equals(list(min = 0, max = 1)))
    expect_that(rapport:::guess.old.input.length("[-100,100]", "number"), equals(list(min = -100, max = 100)))
    expect_that(rapport:::guess.old.input.length("[-2.58, 2.58]", "number"), equals(list(min = -2.58, max = 2.58)))
})

test_that('should throw error about invalid limit definition', {
    expect_that(rapport:::guess.old.input.length(",", "variable"), throws_error('invalid limit definition'))
    expect_that(rapport:::guess.old.input.length("[,]", "variable"), throws_error('invalid limit definition'))

    expect_that(rapport:::guess.old.input.length("[,2]", "variable"), throws_error('invalid limit definition'))
    expect_that(rapport:::guess.old.input.length("[2,2,2]", "variable"), throws_error('invalid limit definition'))
})

test_that('should throw error about zero limits', {
    expect_that(rapport:::guess.old.input.length("[0]", "variable"), throws_error('limits cannot be zero'))
    expect_that(rapport:::guess.old.input.length("[0,0]", "variable"), throws_error('limits cannot be zero'))
    expect_that(rapport:::guess.old.input.length("[0.0, 0.0]", "variable"), throws_error('limits cannot be zero'))
})

test_that('should throw error about maximum limit', {
    expect_that(rapport:::guess.old.input.length("[20,10]", "variable"), throws_error('minimum limit cannot be greater than maximum limit'))
    expect_that(rapport:::guess.old.input.length("[-1.96,-2.58]", "number"), throws_error('minimum limit cannot be greater than maximum limit'))
})

test_that('should throw error about decimal and/or less than X limits', {
    expect_that(rapport:::guess.old.input.length("[0,1]", "variable"), throws_error('decimal and/or less than 1 limit values are not allowed for variable inputs'))
    expect_that(rapport:::guess.old.input.length("[-2.58,2.58]", "variable"), throws_error('decimal and/or less than 1 limit values are not allowed for variable inputs'))
    expect_that(rapport:::guess.old.input.length("[0.3,1]", "string"), throws_error('decimal and/or negative limit values are not allowed for string inputs'))
    expect_that(rapport:::guess.old.input.length("[-2,1]", "string"), throws_error('decimal and/or negative limit values are not allowed for string inputs'))
})

test_that('should provide correct input definition', {
    expect_that(rapport:::guess.old.input.type("character"), equals(list(class = 'character', length = list(min = 1, max = 1), value = NULL, required = FALSE, standalone = FALSE)))
    expect_that(rapport:::guess.old.input.type("complex"), equals(list(class = 'complex', length = list(min = 1, max = 1), value = NULL, required = FALSE, standalone = FALSE)))
    expect_that(rapport:::guess.old.input.type("factor"), equals(list(class = 'factor', length = list(min = 1, max = 1), value = NULL, required = FALSE, standalone = FALSE)))
    expect_that(rapport:::guess.old.input.type("logical"), equals(list(class = 'logical', length = list(min = 1, max = 1), value = NULL, required = FALSE, standalone = FALSE)))
    expect_that(rapport:::guess.old.input.type("numeric"), equals(list(class = 'numeric', length = list(min = 1, max = 1), value = NULL, required = FALSE, standalone = FALSE)))
    expect_that(rapport:::guess.old.input.type("variable"), equals(list(length = list(min = 1, max = 1), value = NULL, required = FALSE, standalone = FALSE)))
    expect_that(rapport:::guess.old.input.type("TRUE"), equals(list(class = 'logical', length = list(min = 1, max = 1), value = TRUE, required = FALSE, standalone = TRUE)))
    expect_that(rapport:::guess.old.input.type("FALSE"), equals(list(class = 'logical', length = list(min = 1, max = 1), value = FALSE, required = FALSE, standalone = TRUE)))
    expect_that(rapport:::guess.old.input.type("number"), equals(list(class = 'numeric', length = list(min = 1, max = 1), value = NULL, limit = list(min = -Inf, max = Inf), required = FALSE, standalone = TRUE)))
    expect_that(rapport:::guess.old.input.type("string"), equals(list(class = 'character', length = list(min = 1, max = 1), value = NULL, nchar = list(min = 1, max = 256), required = FALSE, standalone = TRUE)))
    expect_that(rapport:::guess.old.input.type("fee, fi, foo, fam"), equals(list(class = 'character', length = list(min = 1, max = 1), options = c("fee", "fi", "foo", "fam"), value = "fee", matchable = TRUE, allow_multiple = FALSE, required = FALSE, standalone = TRUE)))
})

context('Bundled templates backwards compatibility')

oldies <- rapport.ls(path = system.file("templates/deprecated", package = "rapport"), full.names = TRUE)
sapply(oldies, function(x) {
    new.path <- system.file(file.path("templates", basename(x)), package = "rapport")
    expect_that(suppressWarnings(rapport.info(x)), is_identical_to(rapport.info(new.path)))
})

context('Renew function')

sapply(oldies, function(x) {
    bn <- basename(x)
    new.path <- system.file(file.path("templates", basename(x)), package = "rapport")
    expect_that(suppressWarnings(rapport.info(x)), is_identical_to(rapport.info(strsplit(rapport.renew(x), "\n")[[1]])))
})
