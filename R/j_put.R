#' Put data in archive.
#'
#' @param x
#' @param type
#' @param doc
#' @param scenario
#' @param project
#' @param ignore_if_duplicate
#' @param activate_project_scenario
#' @export
#' @examples
#' j_put(x = 10, type = "number", scenario = "Primary school", project = "Education")
#' j_get(type = "number")
#' j_put(x = 11)
#' j_get("number")
#' j_get("number", version = "2")

j_put <- function(x, type = "", doc = NA, scenario = .j_root$active_scenario, project = .j_root$active_project, ignore_if_duplicate = TRUE, activate_project_scenario = TRUE) {
  # First check if we really want to add x
  x2_object <- j_get(type = type, scenario = scenario, project = project, what = "object")
  add_x     <- !ignore_if_duplicate || is.null(x2_object)
  if (!add_x) add_x <- !identical(x, x2_object$data) || !identical(doc, x2_object$doc)
  
  if (add_x) {
    lst              <- j_ls(active_project_scenario_only = FALSE, collapsed = FALSE)
    index            <- which(type == lst$type & scenario == lst$scenario & project == lst$project)
    version          <- 1 + length(index) # New version
    jdata            <- JData$new(x, version, type, scenario, project, doc) # Create
    if (!is.null(x2_object)) {
      jdata$fig <- x2_object$fig # Re-use fig settings
      jdata$doc <- x2_object$doc # Re-use doc
    }
    .j_root$data_lst <- append(.j_root$data_lst, jdata) # Add    
  }
  
  # Select that project and scenario
  if (activate_project_scenario) {
    .j_root$active_project  <- project
    .j_root$active_scenario <- scenario    
  }
  
  return(invisible(add_x))
}
