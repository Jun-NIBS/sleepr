% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hypnogram.R
\name{plot_hypnogram}
\alias{plot_hypnogram}
\title{Draw a hypnogram with ggplot2.}
\usage{
plot_hypnogram(events, labels = c("N3", "N2", "N1", "REM", "AWA"))
}
\arguments{
\item{events}{Events dataframe. Dataframe must have \code{begin} (\code{POSIXt}), \code{end} (\code{POSIXt}) and \code{event}}

\item{labels}{Sleep stages labels. Defaults to \code{c("N3","N2","N1","REM","AWA")}.}
}
\value{
a ggplot object.
}
\description{
A hypnogram represents the stages of sleep as a function of time. \code{plot_hypnogram()} plot a hypnogram using the \code{ggplot2} library from stages sleep in an event dataframe. \code{REM} stage is higlighted in red.
}
\references{
Silber MH, Ancoli-Israel S, Bonnet MH, Chokroverty S, Grigg-Damberger MM, et al. (2007). "The visual scoring of sleep in adults". Journal of Clinical Sleep Medicine. 3 (2): 121–31. PMID 17557422
}
