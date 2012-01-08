context('Parser gets a right header')

test_that('All newline, no whitespace on the left', {
expect_that(template.parse(text='
<%%
Title: Test header #1 
Author: user001
Description: It is for testing purposes
test|numeric[1]|Test variable|With some help
%%>
'), is_a("list"))
})

test_that('All newline, no whitespace on the left, title contains special chars', {
expect_that(template.parse(text='
<%%
Title: Test header with strange symbols (@>#&?!%[])
Author: user001
Description: It is for testing purposes
test|numeric[1]|Test variable|With some help
%%>
'), is_a("list"))
})

test_that('All newline, some whitespace on the left', {
expect_that(template.parse(text='
<%%
	Title: Test header #1 
	Author: user001
	Description: It is for testing purposes
	test|numeric[1]|Test variable|With some help
%%>
'), is_a("list"))
})

context('Parser gets a wrong header')

test_that("Author name contains illegal character", {
throws_error(template.parse(text='
<%%
Title: Test header #1 
Author: user::001
Description: It is for testing purposes
test|numeric[1]|Test variable|With some help
%%>
'))
})
