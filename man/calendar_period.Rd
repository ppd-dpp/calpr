\name{calendar_period}
\alias{calendar_period}

\title{Calendar periods}

\description{
Create a function to turn dates into calendar periods.
}

\usage{
calendar_period(period = c('month', 'quarter', 'year'), start.mon = month.name)
}

\arguments{
  \item{period}{One of 'month' (default), 'quarter', or 'year'.}
  \item{start.mon}{In which month does a calendar year start (default is January)?}
}

\details{
This function creates a simple wrapper for \code{\link[base]{cut.POSIXt}}. By default it turns a date into the first day in a given calendar period, essentially rounding down dates.

Non-standard calendar periods that do not start in January (e.g., fiscal years) can be constructed by choosing a different starting month for a year with \code{start.mon}.

This function is an alternative to some useful features in 'zoo'. It is essentially creates a drop-in replacement for \code{as.Date(as.yearmon(as.Date))}. When dates are clustered, as in most time-series application, performance is about the same as the 'zoo' equivalent. Performance can be much faster when working with microdata, and is usually slower when working with few dates that are spread out.
}

\value{
A function.
}

\seealso{
\code{\link[calpr:year_month]{year month / year quarter / year}} for the important cases.
}
