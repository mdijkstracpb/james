#' Get data from archive
#'
#' @export
#' @examples
#' j_put(x = 10, type = "number", scenario = "Primary school", project = "Education")
#' j_get(type = "number")
#' j_put(x = 11)
#' j_get("number")
#' j_get("number", version = "2")

j_get <- function(type, version, scenario = .j_root$active_scenario, project = .j_root$active_project, what = c("data", "fig", "object"), index) {
  if (missing(index)) {
    j_table <- j_ls(active_project_scenario_only = FALSE, collapsed = FALSE)
    if (missing(version)) { # take last
      index <- tail(which(type == j_table$type & scenario == j_table$scenario & project == j_table$project), 1)
    } else {
      index <- which(type == j_table$type & scenario == j_table$scenario & project == j_table$project & version == j_table$version)
    }      
  }
  
  if (0 == length(index)) {
    return(NULL)
  } else {
    what   <- what[1]
    object <- .j_root$data_lst[[index]]
    if ("object" == what) return(object)
    if ("data"   == what) return(object$data)
    if ("fig"    == what) return(object$fig)
    stop(paste0("j_get(..., what = '", what, "') is NOT allowed."))
  }
  
  return(if (0 == length(index)) NULL else if (get_fig) .j_root$data_lst[[index]]$fig else .j_root$data_lst[[index]]$data)
}
