set.seed(0)
typeDemoData <- data.frame(
                           replicate(10, replicate(10, paste(sample(c(LETTERS, letters, 0:9), 10, replace = TRUE), collapse = ""))),
                           as.complex(sample(1000, 100, replace = TRUE)),
                           factor(sample(LETTERS[1:5], 100, replace = TRUE)),
                           sample(c(TRUE, FALSE), 100, replace = TRUE),
                           rbinom(100, 5, .5),
                           rbeta(100, 2, 3),
                           rcauchy(100),
                           rchisq(100, 10),
                           rexp(100),
                           rgeom(100, .5),
                           rnorm(100),
                           runif(100),
                           rf(100, 3, 5),
                           rt(100, 15),
                           stringsAsFactors = FALSE)
names(typeDemoData) <- LETTERS[1:ncol(typeDemoData)]
