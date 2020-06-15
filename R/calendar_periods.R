#---- Calendar period function factory ----
calendar_period <- function(period = c('month', 'quarter', 'year'), start.mon = month.name) {
  # match period and start.mon
  period <- match.arg(period)
  start.mon <- match(match.arg(start.mon), month.name)
  # return function
  function(x, shift = 0, frac = 0) {
    # frac and shift should be length 1 numbers
    stopifnot(
      "x must be an atomic vector" = is.atomic(x),
      "shift must be a length 1 number" = length(shift) == 1L && is.vector(shift, "numeric") && is.finite(shift),
      "frac must be a length 1 number" = length(frac) == 1L && is.vector(frac, "numeric") && is.finite(frac)
    )
    # x should be a date
    x <- as.Date(x)
    if (length(x) == 0L || all(is.na(x))) return(x)
    # make a sequence of calendar periods that spans x
    ends <- period_ends(x, period, start.mon)
    s <- seq.Date(as.Date(ends[1]), as.Date(ends[2]), period)
    # use this sequence to bin x
    loc <- cut.Date(x, s, FALSE)
    # shift sequence
    ends$mon <- ends$mon + shift
    ends <- as.Date(ends)
    s0 <- seq.Date(ends[1], ends[2], period)
    # return calendar periods in a bin
    x0 <- s0[loc]
    if (frac == 0) return(x0)
    # if frac != 0 then calculate last day in a calendar period
    s1 <- seq.Date(ends[1], by = period, length.out = length(s0) + 1L)[-1] - 1
    x1 <- s1[loc]
    if (frac == 1) return(x1)
    # if frac != 1 take a combination of the first day and last day in a calendar period
    as.Date(frac * as.numeric(x1) + (1 - frac) * as.numeric(x0), origin = '1970-01-01')
  }
}

#---- The important cases ----
year_month <- calendar_period('month')

year_quarter <- calendar_period('quarter')

year <- calendar_period('year')
