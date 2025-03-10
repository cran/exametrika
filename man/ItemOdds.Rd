% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/02_TestItemFunctions.R
\name{ItemOdds}
\alias{ItemOdds}
\alias{ItemOdds.default}
\alias{ItemOdds.binary}
\title{Item Odds}
\usage{
ItemOdds(U, na = NULL, Z = NULL, w = NULL)

\method{ItemOdds}{default}(U, na = NULL, Z = NULL, w = NULL)

\method{ItemOdds}{binary}(U, na = NULL, Z = NULL, w = NULL)
}
\arguments{
\item{U}{Either an object of class "exametrika" or raw data. When raw data is given,
it is converted to the exametrika class with the \code{\link{dataFormat}} function.}

\item{na}{Values to be treated as missing values.}

\item{Z}{Missing indicator matrix of type matrix or data.frame. Values of 1 indicate
observed responses, while 0 indicates missing data.}

\item{w}{Item weight vector specifying the relative importance of each item.}
}
\value{
A numeric vector of odds values for each item. Values range from 0 to infinity,
where:
\itemize{
\item odds > 1: correct response more likely than incorrect
\item odds = 1: equally likely
\item odds < 1: incorrect response more likely than correct
}
}
\description{
Item Odds are defined as the ratio of Correct Response Rate to
Incorrect Response Rate:
\deqn{O_j = \frac{p_j}{1-p_j}}
where \eqn{p_j} is the correct response rate for item j.
This function is applicable only to binary response data.

The odds value represents how many times more likely a correct response is
compared to an incorrect response. For example, an odds of 2 means students
are twice as likely to answer correctly as incorrectly.
}
\note{
This function is implemented using a binary data compatibility wrapper and
will raise an error if used with polytomous data.
}
\examples{
# using sample dataset
ItemOdds(J5S10)
}
