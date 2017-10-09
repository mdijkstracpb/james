#' List data + metadata in archive
#'
#' Equivalent of R's ls() function.
#' @param type Data type (choose yourself, e.g. "input").
#' @param version Version of data you want to filter on.
#' @param scenario Scenario filter.
#' @param project Project filter.
#' @param collapsed Shows only most recent version of each data type. Defaults to TRUE.
#' @param active_project_scenario_only List only data in your active project and scenario. Defaults to TRUE.
#' @export
#' @examples
#' j_ls()

j_ls <- function(type, version, scenario, project, collapsed = TRUE, active_project_scenario_only = TRUE) {
  if (active_project_scenario_only) {
    if (missing(project))  project  <- .j_root$active_project
    if (missing(scenario)) scenario <- .j_root$active_scenario
  }
  
  # Filter on type, version, scenario, project
  df <- data.frame(index = integer(), project = character(), scenario = character(), type = character(), version = character(), "dim|class" = character(), doc = character(), stringsAsFactors = FALSE)
  colnames(df)[6] <- "dim|class" # Fixes dim.class
  for (i in seq_along(.j_root$data_lst)) {
    x <- .j_root$data_lst[[i]]

    if (!missing(type)     && type != x$type)         next
    if (!missing(version)  && version != x$version)   next
    if (!missing(scenario) && scenario != x$scenario) next
    if (!missing(project)  && project != x$project)   next

    # x_info: dim or class
    x_info <- paste(dim(x$data), collapse = "/")
    if ("" == x_info) x_info <- class(x_info)

    j <- 1 + nrow(df)
    df[j, "index"]       <- i
    df[j, "project"]     <- x$project
    df[j, "scenario"]    <- x$scenario
    df[j, "type"]        <- x$type
    df[j, "version"]     <- x$version
    df[j, "dim|class"]   <- x_info
    df[j, "doc"]         <- x$doc
  }

  # If "collapsed", filter most recent version per project/scenario/type
  if (collapsed && 0 < nrow(df)) {
    filter_cols <- c("project", "scenario", "type")
    pst <- unique(df[, filter_cols])
    for (i in 1:nrow(pst)) {
      index <- NULL
      for (j in 1:nrow(df)) if (all(df[j, filter_cols] == pst[i, ])) index <- c(index, j)
      if (1 < length(index)) df <- df[-head(index, -1), ]
    }
  }
  df
}
