context("file name check")

test_that("file name is correct", {

  expect_equal(make_filename(2013), 'accident_2013.csv.bz2')
})


test_that("file does not exist",{

  expect_error(fars_read('accident_20.csv.bz2'), "file 'accident_20.csv.bz2' does not exist")
})
