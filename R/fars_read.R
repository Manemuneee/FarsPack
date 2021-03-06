
#' reads a file into a tibble
#' if the file doesn't exist it returns an error "The file does not exist"
#'
#'#' @references
#'   \url{https://www.nhtsa.gov/research-data/fatality-analysis-reporting-system-fars}
#'
#' @importFrom dplyr tbl_df
#' @importFrom readr read_csv
#' @param filename name of the file
#'
#' @return returns a tbl_df if the file exists in the directory and will return an error otherwise
#'
#' @examples \dontrun{fars_read('accident_2013.csv.bz2')}
#'
#' @export
fars_read <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}
