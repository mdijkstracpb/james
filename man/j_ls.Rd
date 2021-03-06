% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/j_ls.R
\name{j_ls}
\alias{j_ls}
\title{List data + metadata in archive}
\usage{
j_ls(type, version, scenario, project, collapsed = TRUE,
  active_project_scenario_only = TRUE)
}
\arguments{
\item{type}{Data type (choose yourself, e.g. "input").}

\item{version}{Version of data you want to filter on.}

\item{scenario}{Scenario filter.}

\item{project}{Project filter.}

\item{collapsed}{Shows only most recent version of each data type. Defaults to TRUE.}

\item{active_project_scenario_only}{List only data in your active project and scenario. Defaults to TRUE.}
}
\description{
Equivalent of R's ls() function.
}
\examples{
j_ls()
}
