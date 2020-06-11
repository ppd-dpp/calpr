\name{period_ends}
\alias{period_ends}

\title{Period ends}

\description{
End points for calendar periods
}

\usage{
period_ends(x, period, start.mon)
}

\arguments{
  \item{x}{A vector of dates.}
  \item{period}{One of 'month', 'quarter', or 'year'.}
  \item{start.mon}{Starting month of a year, beginning at 1 for January.}
}

\details{
This is a simple helper function to make a sequence of dates to cut \code{x}. There is no argument checking, and it should probably not be called directly.
}

\value{
A pair of POSIXlt that bound \code{x}.
}
