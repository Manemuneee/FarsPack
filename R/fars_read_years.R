#' this function takes a vector of years and opens the file related to each year and imports it into a tbl_df
#' it then takes the part of the tbl_df that belongs to that specific year. then it  takes columns MONTH and year of that tbl_df
#' and returns it in the list
#' if the file does not exist it will return a warning and returns a NULL inside the list
#'
#' @param year a vector of integers where each integer is a year,
#' @import magrittr
#' @importFrom dplyr mutate
#' @importFrom dplyr select
#'
#' @return a list of tbl_df each having two columns MONTH and year and NULL for the non-existing Years with a warning
#' @export 
#'
#' @examples tibble_vector <- fars_read_years(c(2000, 2001))
fars_read_years <- function(years) {
  lapply(years, function(year) {
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(file)
      dplyr::mutate(dat, year = year) %>% 
        dplyr::select(MONTH, year)
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}