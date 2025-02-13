% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/05_LCA.R
\name{LCA}
\alias{LCA}
\title{Latent Class Analysis}
\usage{
LCA(U, ncls = 2, na = NULL, Z = NULL, w = NULL, maxiter = 100)
}
\arguments{
\item{U}{U is either a data class of exametrika, or raw data. When raw data is given,
it is converted to the exametrika class with the \link{dataFormat} function.}

\item{ncls}{number of latent class}

\item{na}{na argument specifies the numbers or characters to be treated as missing values.}

\item{Z}{Z is a missing indicator matrix of the type matrix or data.frame}

\item{w}{w is item weight vector}

\item{maxiter}{Maximum number of iterations.}
}
\value{
\describe{
\item{nobs}{Sample size. The number of rows in the dataset.}
\item{testlength}{Length of the test. The number of items included in the test.}
\item{Nclass}{number of classes you set}
\item{TRP}{Test Reference Profile matrix. The TRP is the column sum vector of estimated class reference matrix,
\eqn{\hat{\Pi}_c}}
\item{LCD}{Latent Class Distribution table.see also \link{plot.exametrika}}
\item{CMD}{Class Membership Distribution table. see also \link{plot.exametrika}}
\item{Students}{Class Membership Profile matrix.The s-th row vector of \eqn{\hat{M}_c}, \eqn{\hat{m}_c}, is the
class membership profile of Student s, namely the posterior probability distribution representing the student's
belonging to the respective latent classes. The last column indicates the latent class estimate.}
\item{IRP}{Item Reference Profile matrix.The IRP of item j is the j-th row vector in the class reference matrix,
\eqn{\hat{\pi}_c}}
\item{ItemFitIndices}{Fit index for each item.See also \link{ItemFit}}
\item{TestFitIndices}{Overall fit index for the test.See also \link{TestFit}}
}
}
\description{
A function for estimating LCA using the EM algorithm.
}
\examples{
\donttest{
# Fit a Latent Class Analysis model with 5 classes to the sample dataset
result.LCA <- LCA(J15S500, ncls = 5)

# Display the first few rows of student class membership probabilities
head(result.LCA$Students)

# Plot Item Response Profiles (IRP) for items 1-6 in a 2x3 grid
plot(result.LCA, type = "IRP", items = 1:6, nc = 2, nr = 3)

# Plot Class Membership Probabilities (CMP) for students 1-9 in a 3x3 grid
plot(result.LCA, type = "CMP", students = 1:9, nc = 3, nr = 3)

# Plot Test Response Profile (TRP) showing response patterns across all classes
plot(result.LCA, type = "TRP")

# Plot Latent Class Distribution (LCD) showing the size of each latent class
plot(result.LCA, type = "LCD")
}

}
