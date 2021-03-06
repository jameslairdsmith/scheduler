% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dont.R
\name{dont_occur}
\alias{dont_occur}
\title{Invert a schedule}
\usage{
dont_occur(x, y = NULL)
}
\arguments{
\item{x, y}{Schedule objects.}
}
\value{
A schedule object.
}
\description{
Create a schedule of events occurring only when the specified events do
not occur.
}
\details{
\code{doesnt_occur()} can accept either one or two schedules as input(s):
\itemize{
\item When a single schedule is used, the function returns a schedule of all
events that do not fall on on the input schedule. The result is the
\strong{negation} of the schedule. For example, the negation of all weekdays
would be a schedule of all weekend days.
\item When two schedules are used, the function returns the first schedule but
with the events of the second schedule stripped away. This works to remove
the events of the second schedule from the first.
\itemize{
\item This means that \code{doesnt_occur(a, b)} is the equivalent of
\code{only_occur(a, doesnt_occur(b))}
\item This usage works best when composing with the pipe (\code{\%>\%}) operator.
}
}
}
\examples{
library(magrittr)
my_dates <- seq.Date(as.Date("1999-01-01"),
                     as.Date("1999-01-10"),
                     by = "1 day")

happen(in_month("Jan"), my_dates)
happen(dont_occur(in_month("Jan")), my_dates)
happen(on_wday("Sat"), my_dates)
happen(dont_occur(on_wday("Sat")), my_dates)

on_christmas <- only_occur(on_mday(25), in_month("Dec"))
on_new_years_day <- on_yday(1)
on_public_holidays <- also_occur(on_new_years_day, on_christmas)

on_business_days <-
  dont_occur(on_weekend()) \%>\%
  dont_occur(on_public_holidays)

happen(on_business_days, my_dates)
}
