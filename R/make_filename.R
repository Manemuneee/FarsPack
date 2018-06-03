#' generates the name of the file according to the year 
#'
#'
#' @param year a string or an integer to address the file that we want to read
#'
#' @return string which is going to be name of the 
#' @export
#'
#' @examples fileName <- make_file(2014)
make_filename <- function(year) {
  year <- as.integer(year)
  sprintf("accident_%d.csv.bz2", year)
}