#---- Complete periods function factory ----
complete_periods <- function(period = c('quarter', 'year'),
                             by = c('month', 'quarter'),
                             start.mon = month.name) {
  # match arguments
  period <- match.arg(period)
  by <- match.arg(by)
  mon <- match(match.arg(start.mon), month.name)
  # count for each period
  k <- switch(period, quarter = 1L, year = 4L) * switch(by, month = 3L, quarter = 1L)
  # return value
  function(x, f) {
    stopifnot(
      "x must be an atomic vector" = is.atomic(x),
      "f must be an atomic vector" = missing(f) || is.atomic(f),
      "x and f must be the same length" = missing(f) || length(x) == length(f)
    )
    # function to find complete periods
    cp <- function(x) {
      # x should be a vector of dates
      x <- as.Date(x)
      if (length(x) == 0L) {
        return(logical(0))
      } else if (all(is.na(x))) {
        return(rep.int(NA, length(x)))
      }
      # do nothing if period == by
      if (period == by) return(rep.int(TRUE, length(x)))
      # turn x into calendar periods
      xb <- calendar_period(by, start.mon)(x, 1L - mon)
      # which periods are complete?
      tab <- tabulate(cut.Date(unique(xb), period, FALSE)) == k
      # output
      out <- cut.Date(xb, period, FALSE) %in% which(tab)
      out[is.na(x)] <- NA
      out
    }
    if (missing(f)) {
      # apply cp to x if f is missing
      cp(x)
    } else {
      # turn f into a factor and use it to split x, then apply cp
      f <- as.factor(f)
      out <- vector(length = length(x))
      split(out, f) <- lapply(split(x, f), cp)
      out[is.na(f)] <- NA
      out
    }
  }
}

#---- The important cases ----
complete_quarters <- complete_periods('quarter', 'month')

complete_years_m <- complete_periods('year', 'month')

complete_years_q <- complete_periods('year', 'quarter')
