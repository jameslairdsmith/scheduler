% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/direction.R
\name{after}
\alias{after}
\alias{before}
\alias{in_between}
\alias{on_or_after}
\alias{on_or_before}
\title{Specify the start and end of a schedule}
\usage{
after(start_event, within_given = NULL)

before(end_event, within_given = NULL)

in_between(start_event, end_event, within_given = NULL)

on_or_after(start_event, within_given = NULL)

on_or_before(end_event, within_given = NULL)
}
\arguments{
\item{start_event, end_event}{The start and/or end events of the schedule.
Can be either:
\itemize{
\item A date-time object or
\item A schedule.
}}

\item{within_given}{Required only when either \code{start_date} or \code{end_date}
is a schedule. Can be either:
\itemize{
\item A string shortcut for a period type: either \code{"day"}, \code{"week"}, \code{"month"},
\code{"quarter"} or \code{"year"}. Or,
\item A date accessor function. Eg. \code{lubridate::month()}.
}}
}
\value{
A schedule object.
}
\description{
Creates a schedule of events occuring before or after either a certain
date or another scheduled event.
}
\details{
When \code{start_event} and/or \code{end_event} are schedules they are likely to come
around every year.  To have any events which can occur 'before' or 'after'
them, they need a limit specified by the \code{within_given} argument. This can
either be date accessor function like \code{lubridate::month()} or
\code{lubridate::year()} or the provided character shortcuts
\code{"day"}, \code{"week"}, \code{"month"}, \code{"quarter"} or \code{"year"}.
}
\examples{
christmas <-  only_occur(in_month("Dec"), on_mday(25))
new_years_eve <-  only_occur(in_month("Dec"), on_mday(31))

after_christmas <- after(christmas, within_given = "year")

schedule_days(after_christmas, from = 2000, to = 2001)

in_between_christmas_and_new_years_eve <-
    in_between(christmas,
               new_years_eve,
               within_given = lubridate::year)

schedule_days(in_between_christmas_and_new_years_eve, from = 2000, to = 2001)

}
\keyword{after,}
\keyword{before,}
\keyword{date,}
\keyword{schedule}
