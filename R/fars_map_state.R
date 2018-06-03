#' This function takes year and a state number and plots the map of accidents. if the state number does not exist
#' it will return an error. and if there are no accidents in a state it will stop and returns a message
#'
#' @param state.num number of the target state
#' @param year The target year
#' @importFrom dplyr filter
#' @importFrom maps map
#' @importFrom graphics points
#'
#' @return a plot of accidents in the given state and the given year. it returns an error if the state does not exist and returns a message if there are no accidents in the given state
#' @export
#'
#' @examples fars_map_state(1, 2013)
fars_map_state <- function(state.num, year) {
  filename <- make_filename(year)
  data <- fars_read(filename)
  state.num <- as.integer(state.num)
  
  if(!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- dplyr::filter(data, STATE == state.num)
  if(nrow(data.sub) == 0L) {
    message("no accidents to plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
              xlim = range(LONGITUD, na.rm = TRUE))
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}