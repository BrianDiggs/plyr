\name{vaggregate}
\alias{vaggregate}
\title{Vector aggregate.}
\usage{
  vaggregate(.value, .group, .fun, ..., .default = NULL, .n
  = nlevels(.group))
}
\arguments{
  \item{.value}{vector of values to aggregate}

  \item{.group}{grouping vector}

  \item{.fun}{aggregation function}

  \item{...}{other arguments passed on to \code{.fun}}

  \item{.default}{default value used for missing groups.
  This argument is also used as the template for function
  output.}

  \item{.n}{total number of groups}
}
\description{
  This function is somewhat similar to \code{tapply}, but
  is designed for use in conjunction with \code{id}. It is
  simpler in that it only accepts a single grouping vector
  (use \code{\link{id}} if you have more) and uses
  \code{\link{vapply}} internally, using the
  \code{.default} value as the template.
}
\details{
  \code{vaggregate} should be faster than \code{tapply} in
  most situations because it avoids making a copy of the
  data.
}
\examples{
# Some examples of use borrowed from ?tapply
n <- 17; fac <- factor(rep(1:3, length = n), levels = 1:5)
table(fac)
vaggregate(1:n, fac, sum)
vaggregate(1:n, fac, sum, .default = NA_integer_)
vaggregate(1:n, fac, range)
vaggregate(1:n, fac, range, .default = c(NA, NA) + 0)
vaggregate(1:n, fac, quantile)
# Unlike tapply, vaggregate does not support multi-d output:
tapply(warpbreaks$breaks, warpbreaks[,-1], sum)
vaggregate(warpbreaks$breaks, id(warpbreaks[,-1]), sum)

# But it is about 10x faster
x <- rnorm(1e6)
y1 <- sample.int(10, 1e6, replace = TRUE)
system.time(tapply(x, y1, mean))
system.time(vaggregate(x, y1, mean))
}

