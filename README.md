# R package 'james'

## Install
    devtools::install_github("mdijkstracpb/james")

## Example
    library(james)
    j_init()
    j_put(x = "some data", type = "ex txt", scenario = "Likely scenario", project = "Great project")
    j_get("ex txt")
    j_put(x = "some new data", type = "ex txt")
    j_get("ex txt")
    j_ls()
    j_ls(collapse = FALSE)
    j_get("ex txt", version = 1)