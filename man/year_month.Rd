\name{year month / year quarter / year}
\alias{year_month}
\alias{year_quarter}
\alias{year}

\title{year month / year quarter / year}

\description{
Turn dates into year months/year quarters/years.
}

\usage{
year_month(x, shift = 0, frac = 0)

year_quarter(x, shift = 0, frac = 0)

year(x, shift = 0, frac = 0)
}

\arguments{
  \item{x}{A vector of dates, or something that can be coerced into one.}
  \item{shift}{Number of months to shift up/down dates in x (0 by default).}
  \item{frac}{Should calendar periods be formatted as the first day in a period (0, the default), the last day (1), or some point in between?}
}

\value{
A vector of dates, the same length as \code{x}.
}

\seealso{
\code{\link[calpr]{complete_quarters}} for finding \emph{complete} calendar periods.

\code{\link[calpr]{calendar_period}} for non-standard calendar periods.
}

\examples{
# Turn dates into year-months
x <- as.Date(c('2018-01-15', '2018-01-03', '2018-02-24'))
year_month(x)

# Turn year-months into year-quarters
x <- as.Date(c('2018-01-01', '2018-02-01', '2018-04-01'))
year_quarter(x)

# Format as the last day in a quarter
year_quarter(x, frac = 1)

\dontrun{
 # This can also be done with zoo
 library(zoo)
 as.Date(as.yearqtr(x))
 as.Date(as.yearqtr(x), frac = 1)
}

# Find periods one month ago
match(year_month(x, -1), year_month(x))
}


