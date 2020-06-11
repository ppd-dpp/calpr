\name{complete_periods}
\alias{complete_periods}

\title{
Complete periods
}

\description{
Create a function to identify which elements in a vector of dates correspond to complete calendar periods.
}

\usage{
complete_periods(period = c('quarter', 'year'),
                 by = c('month', 'quarter'),
                 start.mon = month.name)
}

\arguments{
  \item{period}{One of 'quarter' (default) or 'year'.}
  \item{by}{One of 'month' (default) or 'quarter'.}
  \item{start.mon}{In which month does a year start (default is January)?}
}

\value{
A function.
}

\seealso{
\code{\link[calpr:complete_quarters]{complete quarters / years}} for the important cases.
}

