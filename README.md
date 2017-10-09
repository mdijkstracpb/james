# R package 'james'
James is your servant in the archive who automates the trivial parts of your analysis so you have more time for the smart work. James works as follows. For each of your projects James allocates a separate room in his archive. As a given project may study different scenarios, James adds a new closet to the project's room for each of them. A closet contains drawers that each corresponds to a different data type. A data set of a given type may have different versions. James stores each version in a separate folder and puts the folders in the right drawer. The folder in the front is the version you work with. Because James is context aware, you can get/put your data with minimal effort. James automatically and transparently saves your data on disk.

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