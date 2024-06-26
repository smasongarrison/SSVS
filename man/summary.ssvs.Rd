% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary.R
\name{summary.ssvs}
\alias{summary.ssvs}
\title{Summarize results of an SSVS model}
\usage{
\method{summary}{ssvs}(object, interval = 0.89, threshold = 0, ordered = FALSE, ...)
}
\arguments{
\item{object}{An SSVS result object obtained from \code{\link[=ssvs]{ssvs()}}}

\item{interval}{The desired probability for the credible interval, specified as a decimal}

\item{threshold}{Minimum MIP threshold where a predictor will be shown in the output, specified as a decimal}

\item{ordered}{If \code{TRUE}, order the results based on MIP (in descending order)}

\item{...}{Ignored}
}
\value{
A dataframe with results
}
\description{
Summarize results from SSVS including marginal inclusion probabilities,
Bayesian model averaged parameter estimates, and
95\% highest posterior density credible intervals. Estimates and
credible intervals are based on standardized X variables.
}
\examples{
\donttest{
outcome <- "qsec"
predictors <- c("cyl", "disp", "hp", "drat", "wt", "vs", "am", "gear", "carb", "mpg")
results <- ssvs(data = mtcars, x = predictors, y = outcome, progress = FALSE)
summary(results, interval = 0.9, ordered = TRUE)
}
}
