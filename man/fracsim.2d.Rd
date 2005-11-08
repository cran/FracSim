\name{fracsim.2d}
\alias{fracsim.2d}
\title{Simulation of 2D fractional and multifractional Lévy motions}}
\description{
  The function simulates 2D fractional and multifractional motions 
}
\usage{
fracsim.2d(h, n, kx, ky = kx, m = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{h}{Regularity function. One value for fractional
    motions; either a function or a kx*ky-matrix  for
    multifractional ones}
  
  \item{n}{Number of terms in the serie}
  
  \item{kx}{Either the vector of row discretisation points or the number
    of points (calculated equally spaced)}
  
  \item{ky}{Either the vector of column discretisation points or the number
    of points (calculated equally spaced)}
  
  \item{m}{Mass term, usually set equal to 1}
}
\details{

}
\value{

  \item{X}{kx-vector of row discretization points}

  \item{Y}{ky-vector of column discretization points}

  \item{simul.h}{Matrix of imulated regularity values}
  
  \item{process}{kx*ky-matrix which elements are the
process value at each discretization point}

}
\references{http://www.lsp.ups-tlse.fr/FracSim}
\author{Sébastien Déjean & Serge Cohen}
\note{}

\seealso{\code{\link{fracsim.1d}}}
\examples{
library(FracSim)
X05.2d = fracsim.2d(h=0.5,kx=100,n=10000)
persp(X05.2d$process)
}
\keyword{datagen}

