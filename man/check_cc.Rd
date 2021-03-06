% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cc.R
\name{check_cc}
\alias{check_cc}
\title{Check ISO country code}
\usage{
check_cc(country)
}
\arguments{
\item{country}{A character vector of \link[=dialr-region]{ISO country codes}.}
}
\value{
A logical vector flagging which elements are valid codes.
}
\description{
Check whether an \link[=dialr-region]{ISO country code} is valid.
}
\examples{
check_cc(c("AU", "US", "CN", "WRONG", NA))
}
