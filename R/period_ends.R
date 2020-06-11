period_ends <- function(x, period, start.mon){
  m <- as.POSIXlt(c(min(x, na.rm = TRUE), max(x, na.rm = TRUE)), tz = 'UTC')
  m$mday <- 1
  m$mon <- m$mon - start.mon + 1L
  ends <- as.POSIXlt(cut(m, period), tz = 'UTC')
  ends$mon <- ends$mon + start.mon - 1L
  ends[2] <- seq(ends[2], length.out = 2, by = period)[2]
  ends
}
