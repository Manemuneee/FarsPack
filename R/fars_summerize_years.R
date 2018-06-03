#' this function takes a vector of years. reads the file for each year. creates a list of tbl_df, it does a row binding over all the tbls
#' it groups the resulting tibble by year and MONTH and then counts the occurances and then it makes a wide tibble from the long tibble according to year.
#' 
#' @param years The target years
#' @importFrom dplyr summarize
#' @importFrom dplyr group_by
#' @importFrom dplyr bind_rows
#' @importFrom tidyr spread
#'
#' @return returns a spreaded tbl_df if the file exists and is read into R successfully and NULL if the file does not exist.
#' @export
#'
#' @examples table <- fars_summerized_year(c(2013, 2014))
fars_summarize_years <- function(years) {
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>% 
    dplyr::group_by(year, MONTH) %>% 
    dplyr::summarize(n = n()) %>%
    tidyr::spread(year, n)
}
