stopifnot(
  exprs = {
    year_month(c('2017-01-01', '2019-12-31')) == as.Date(c('2017-01-01', '2019-12-01'))
    year_month(c('2017-01-01', '2019-12-31'), frac = 1) == as.Date(c('2017-01-31', '2019-12-31'))
    year_month(c('2017-01-01', '2019-12-31'), shift = 3) == as.Date(c('2017-04-01', '2020-03-01'))
    year_quarter(c('2017-01-01', '2019-12-31')) == as.Date(c('2017-01-01', '2019-10-01'))
    year_quarter(c('2017-01-01', '2019-12-31'), frac = 1) == as.Date(c('2017-03-31', '2019-12-31'))
    year_quarter(c('2017-01-01', '2019-12-31'), shift = 3) == as.Date(c('2017-04-01', '2020-01-01'))
    year(c('2017-01-01', '2019-12-31')) == as.Date(c('2017-01-01', '2019-01-01'))
    year(c('2017-01-01', '2019-12-31'), frac = 1) == as.Date(c('2017-12-31', '2019-12-31'))
    year(c('2017-01-01', '2019-12-31'), shift = 3) == as.Date(c('2017-04-01', '2019-04-01'))
    calendar_period('quarter', 'June')(c('2017-01-01', '2019-12-31')) == as.Date(c('2016-12-01', '2019-12-01'))
    calendar_period('quarter', 'June')(c('2017-01-01', '2019-12-31'), frac = 1) == as.Date(c('2017-02-28', '2020-02-29'))
    calendar_period('quarter', 'June')(c('2017-01-01', '2019-12-31'), shift = 3) == as.Date(c('2017-03-01', '2020-03-01'))
    identical(year_month(as.Date(character(0))), as.Date(character(0)))
    identical(year_month(as.Date(character(0)), frac = 1), as.Date(character(0)))
    identical(year_month(as.Date(character(0)), shift = 3), as.Date(character(0)))
    is.na(year_month(NA))
    is.na(year_month(NA, frac = 1))
    is.na(year_month(NA, shift = 3))
  },
  local = getNamespace('calpr')
)

x <- seq(as.Date('2017-12-04'), as.Date('2019-04-04'), 'month')[-5]
stopifnot(
  exprs = {
    complete_quarters(c('2016-12-01', '2017-01-01', '2017-02-01', '2017-03-01', '2017-04-01')) == c(FALSE, TRUE, TRUE, TRUE, FALSE)
    complete_quarters(c('2017-01-01', '2017-02-01', '2017-03-01', '2017-01-01', '2017-02-01'), c('a', 'a', 'a', 'b', 'b')) == c(TRUE, TRUE, TRUE, FALSE, FALSE)
    identical(complete_quarters(c('2017-01-01', '2017-02-01', '2017-03-01', '2017-01-01', '2017-02-01'), c('a', 'a', NA, 'b', 'b')), c(FALSE, FALSE, NA, FALSE, FALSE))
    identical(complete_quarters(c('2017-01-01', '2017-02-01', '2017-03-01', NA, '2017-02-01'), c('a', 'a', 'a', 'b', 'b')), c(TRUE, TRUE, TRUE, NA, FALSE))
    complete_quarters(c('2017-01-01', '2017-02-01', '2017-03-01', '2017-01-01', '2017-02-01'), factor(c('a', 'a', 'a', 'c', 'c'), levels = letters[1:3])) == c(TRUE, TRUE, TRUE, FALSE, FALSE)
    is.na(complete_quarters(NA))
    identical(complete_quarters(character(0)), logical(0))
    complete_years_m(x) == c(rep(FALSE, length(x)))
    complete_years_q(x) == c(F, T, T, T, T, T, T, T, T, T, T, T, F, F, F, F)
    complete_periods('quarter', 'month', 'Dec')(x) == c(T, T, T, F, F, T, T, T, T, T, T, T, T, T, F, F)
    complete_periods('year', 'month', 'Dec')(x) == c(rep(FALSE, length(x)))
    complete_periods('year', 'quarter', 'Dec')(x) == c(T, T, T, T, T, T, T, T, T, T, T, F, F, F, F, F)
  },
  local = getNamespace('calpr')
)
