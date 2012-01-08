set.seed(0)
typeDemoData <- data.frame(
                           replicate(10, replicate(10, paste(sample(c(LETTERS, letters, 0:9), 10, replace = TRUE), collapse = ""))),
                           as.complex(sample(1000, 100, replace = TRUE)),
                           factor(sample(LETTERS[1:5], 100, replace = TRUE)),
                           sample(c(TRUE, FALSE), 100, replace = TRUE),
                           replicate(10, rnorm(100)),
                           runif(100),
                           stringsAsFactors = FALSE)
