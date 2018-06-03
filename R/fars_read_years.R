#' this function takes a vector of years and opens the file related to each year and imports it into a tbl_df
#' it then takes the part of the tbl_df that belongs to that specific year. then it  takes columns MONTH and year of that tbl_df
#' and returns it in the list
#' if the file does not exist it will return a warning and returns a NULL inside the list
#'
#'#' @references
#'   \url{https://www.nhtsa.gov/research-data/fatality-analysis-reporting-system-fars}
#'
#' @param years target years
#'
#' @importFrom dplyr mutate
#' @importFrom dplyr select
#' @importFrom dplyr "%>%"
#' @import magrittr
#'
#' @examples
#'
#' \dontrun{
#' fars_read_years(c(2016,2017))
#' }
#'
#' @export
fars_read_years <- function(years) {
  lapply(years, function(year) {
    filename <- make_filename(year)
    #print(filename)
    tryCatch({
      dat <- fars_read(filename)
      dplyr::mutate(dat, year = ~year) %>%
        dplyr::select("MONTH", "year")
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}
