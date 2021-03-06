% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{with_pb}
\alias{with_pb}
\title{Allow a function to be called with a progress bar}
\usage{
with_pb(.f, .pb, ...)
}
\arguments{
\item{.f}{Function to be called. Pre-processed with
\code{\link[rlang:as_function]{rlang::as_function()}}, so it can be an anonymous "lambda"
function.}

\item{.pb}{Progress bar object. Both \code{\link[progress:progress_bar]{progress::progress_bar()}} and
\code{\link[utils:txtProgressBar]{utils::txtProgressBar()}} are supported.}

\item{...}{Arguments to function \code{.f}}
}
\value{
Function \code{.f} modified to tick the progress bar
}
\description{
Allow a function to be called with a progress bar
}
\examples{
# The progress package has nice
f <- function(x) Sys.sleep(1)
pb <- progress::progress_bar$new(total = 5)
invisible(lapply(1:5, with_pb(f, pb)))

# Base R's txtProgressBar is also supported, but note that it does
# not close itself
pb <- txtProgressBar(max = 5, style = 3)
invisible(lapply(1:5, with_pb(~Sys.sleep(0.5), pb)))
close(pb)
}
\author{
Alexey Shiklomanov
}
