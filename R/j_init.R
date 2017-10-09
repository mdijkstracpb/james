#' Initialize James
#'
#' @param file_name File holding your archive. Defaults to "data.james".
#' @param active_scenario Scenario you want to work on.
#' @param active_project Project you want to work on.
#' @export
#' @examples
#' j_init()

j_init <- function(file_name = "data.james", active_scenario, active_project) {
  .j_root <<- JRoot$new(file_name, active_scenario, active_project)
}