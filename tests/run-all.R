library(rapport)

if (any(grepl('testthat', .packages(all = TRUE))))
    if (suppressWarnings(require(testthat, quietly = TRUE)))
        test_package("rapport")