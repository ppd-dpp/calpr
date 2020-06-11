\name{complete quarters / years}
\alias{complete_quarters}
\alias{complete_years_m}
\alias{complete_years_q}

\title{Complete quarters / years}

\description{
Identify which elements in a vector of dates correspond to complete quarter/years.
}

\usage{
complete_quarters(x, f)

complete_years_m(x, f)

complete_years_q(x, f)
}

\arguments{
  \item{x}{A vector of dates, or something that can be coerced into one.}
  \item{f}{A factor the same length as \code{x}, or an atomic vector to be turned into a factor, that is used to group \code{x}.}
}

\details{
This function counts the unique year-month/year-quarters in \code{x} and returns which elements of \code{x} belong to a year-quarter/year with the appropriate number of year-month/year-quarters.

For example, \code{complete_quarters} returns TRUE for an element of \code{x} if there are three distinct year-months in the corresponding year-quarter to which this element of \code{x} belongs.

NAs return always return NA.

If \code{f} is given then \code{x} is split according to \code{f} before finding complete quarters/years in \code{x}.
}

\value{
A logical vector, the same length as \code{x}.
}

\seealso{
\code{\link[calpr]{complete_periods}} for checking completeness of non-standard calendar periods.
}

\examples{
# Which elements in a monthly series form complete quarters?
x <- seq(as.Date('2018-01-01'), as.Date('2019-04-01'), 'month')
x[complete_quarters(x)]
x[complete_quarters(x, c(rep('a', 10), rep('b', 6)))]

\dontrun{
 # Can be done manually with zoo
 library(zoo)
 x <- unique(as.yearmon(x))
 f <- factor(as.yearqtr(x))
 x[as.character(as.yearqtr(x)) %in% levels(f)[tabulate(f) == 3]]
}

# Which elements in a monthly series form complete years?
x[complete_years_m(x)]

# Which elements in a quarterly series form complete years?
y <- seq(as.Date('2018-01-01'), as.Date('2019-04-01'), 'quarter')
y[complete_years_q(y)]
}
