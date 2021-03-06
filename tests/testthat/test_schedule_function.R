context("test_schedule_function")

library(lubridate)

test_that("schedule() function works", {

  christmas <- on_mday(25) %>% only_occurring(in_month("Dec"))

  one <- christmas %>% schedule(from = dmy("01/01/1990"), to = dmy("31/12/1992"))

  two <- seq.Date(from = dmy("25/12/1990"), to = dmy("25/12/1992"), by = "1 year")

  expect_identical(one, two)
})


test_that("schedule() function works with year abbreviations", {

  christmas <- on_mday(25) %>% only_occurring(in_month("Dec"))

  one <- christmas %>% schedule(from = 1990, to = 1992)

  two <- seq.Date(from = dmy("25/12/1990"), to = dmy("25/12/1992"), by = "1 year")

  expect_identical(one, two)
})

test_that("schedule function works when specifying only before() and after()", {

  demo_dates <- seq.Date(from = dmy("02/07/1990"),
                         to = dmy("30/07/1990"),
                         by = "1 day")

  before_and_after <-
    after(dmy("01/07/1990")) %>%
    only_occurring(before(dmy("31/07/1990")))

  expect_true("earliest_date" %in% get_attribute_names(before_and_after))
  expect_true("latest_date" %in% get_attribute_names(before_and_after))

  expect_equal(schedule(before_and_after), demo_dates)

})

test_that("schedule_hours() function works", {

  christmas <- on_mday(25) %>% only_occurring(in_month("Dec"))

  one <- christmas %>% schedule_hours(during = 2000)

  two <- seq.POSIXt(from = as_datetime(dmy("25/12/2000")),
                  to = as_datetime(dmy("26/12/2000")),
                  by = "1 hour")

  two <- two[mday(two)==25]

  expect_equal(one, two)
})
