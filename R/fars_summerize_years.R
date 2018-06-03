#' this function takes a vector of years. reads the file for each year. creates a list of tbl_df, it does a row binding over all the tbls
#' it groups the resulting tibble by year and MONTH and then counts the occurances and then it makes a wide tibble from the long tibble according to year.
#'
#'#' @references
#'   \url{https://www.nhtsa.gov/research-data/fatality-analysis-reporting-system-fars}
#'
#' @param years The target years
#' @importFrom dplyr summarize
#' @importFrom dplyr group_by
#' @importFrom dplyr bind_rows
#' @importFrom tidyr spread
#' @import magrittr
#' @importFrom dplyr "%>%"
#'
#' @return returns a spreaded tbl_df if the file exists and is read into R successfully and NULL if the file does not exist.
#'
#' @examples
#' \dontrun{
#' fars_summerized_year(c(2013, 2014))
#' }
#'
#' @export
fars_summarize_years <- function(years) {
  dat_list <- fars_read_years(years)
  dat_list1 <- dplyr::bind_rows(dat_list)
  dat_list2 <- dplyr::group_by(dat_list1, 'year', 'MONTH')
  dat_list3 <- dplyr::summarize(dat_list2, 'n' = ~n())
  tidyr::spread(dat_list3, 'year', 'n')
}
