#' R6 objects holding your data
#'
#' @export

JFig <- R6::R6Class("JFig",
  public = list(
    initialize = function(specs) {
      if (!missing(specs)) self$specs <- specs
    },
    specs = list()
  )
)

JData <- R6::R6Class("JData",
  public = list(
    initialize = function(data, version, type, scenario, project, doc) {
      self$data     <- data
      self$version  <- version
      self$type     <- type
      self$scenario <- scenario
      self$project  <- project
      self$doc      <- doc
      self$fig      <- JFig$new()
      self$born     <- date()
    },
    data     = NULL,
    version  = NULL,
    type     = NULL,
    scenario = NULL,
    project  = NULL,
    doc      = NULL,
    fig      = NULL,
    born     = NULL  # creation_date
  )
)

JRoot <- R6::R6Class("JRoot",
  public = list(
    file_name         = NULL,
    active_project    = "",
    active_scenario   = "",
    data_lst          = list(),
    initialize        = function(file_name, active_scenario, active_project) {
      if (file.exists(file_name)) {
        cat(paste0("Opening ", file_name, "..."))
        j_root_file    <- readRDS(file_name)
        self$data_lst  <- j_root_file$data_lst
        self$file_name <- file_name # store file name if successful        
      } else {
        cat(paste0("Creating ", file_name, "..."))
        self$file_name <- file_name
        self$save()
      }
      if (!missing(active_scenario)) self$active_scenario <- active_scenario
      if (!missing(active_project))  self$active_project <- active_project
    },
    save = function() {
      saveRDS(self, self$file_name)
    }
  )
)