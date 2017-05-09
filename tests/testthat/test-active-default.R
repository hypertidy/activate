library(testthat)
context("active-default")

test_that("active defaults work", {
   my_object <- structure(list(x = 1, y = 25), active = "y")
   expect_warning(activ <- my_object %>% active(), "object not recognized")
   activ  %>% expect_identical("y")
  expect_warning(activate(my_object, "x") %>% active() %>% expect_identical("x"), "activating as a default")
})
