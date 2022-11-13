library(datateachr)
library(purrr)

test <- scatter_bygroup(cancer_sample, "area_mean", "concavity_mean", "diagnosis",FALSE)
test_that("redundant inputs: different input", {
  geoms <- test$layers %>%
    map("geom") %>%
    map(class) %>%
    map_chr(1)

  expect_true("GeomPoint" %in% geoms)
  expect_false("GeomSmooth" %in% geoms)
})

test_that("non-redundant inputs: different type", {
  expect_error(scatter_bygroup(cancer_sample, 1, "concave_points_mean", "diagnosis",FALSE),
               "I am so sorry, but this function only works for character inputs!" )
})

rm('test')
