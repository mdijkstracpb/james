j_activate <- function(type, version, scenario = .j_root$active_scenario, project = .j_root$active_project, index) {
  if (missing(index)) {
    if (missing(version)) stop("Please specify either 'index' or 'version'.")
    j_table <- j_ls(active_project_scenario_only = FALSE, collapsed = FALSE)
    index   <- which(type == j_table$type & scenario == j_table$scenario & project == j_table$project & version == j_table$version)
  }

  n <- length(.j_root$data_lst)
  .j_root$data_lst <- replace(.j_root$data_lst, c(index, n), c(.j_root$data_lst[n], .j_root$data_lst[index]))
}
