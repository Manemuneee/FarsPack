#' generates the name of the file according to the year
#'
#'
#' @param year a string or an integer to address the file that we want to read
#'
#' @return string which is going to be name of the
#'
#' @examples fileName <- make_filename(2014)
#' @export
make_filename <- function(year) {
  year <- as.integer(year)
  name <- sprintf("accident_%d.csv.bz2", year)
  # system.file("extdata", name, package ="FarsPackage")
}
