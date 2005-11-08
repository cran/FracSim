\name{fracsim.1d}
\alias{fracsim.1d}
\encoding{latin1}
\title{Simulation of 1D fractional and multifractional Lévy motions}
\description{
 The function simulates 1D fractional and multifractional motions 
}
\usage{
fracsim.1d(h, n, k, m = 1)
}

\arguments{
  \item{h}{Regularity function. One value for fractional
motions; either a function or a vector of length \code{k} for multifractional ones}

  \item{n}{Number of terms in the serie}

  \item{k}{Either the vector of discretisation points or the number of
  discretisation points (calculated equally spaced)}

  \item{m}{Mass term, usually set equal to 1}
}
\details{

}
\value{
  \item{t}{k-vector of discretization points}
  
  \item{simul.h}{Vector of simulated regularity values}
  
  \item{process}{k-vector which elements are the process value at each discretization
point}
}

\references{http://www.lsp.ups-tlse.fr/FracSim}
\author{Sébastien Déjean & Serge Cohen}
\note{}

\seealso{\code{\link{fracsim.2d}}}
\examples{
library(FracSim)
# Fractional process
X05 = fracsim.1d(h=0.5,k=1000,n=5000)
plot(X05$t,X05$process,type="l")
# Multifractional process
# h is a k-vector
Hsin = 0.25+0.25*sin(seq(0,1,length=1000)*(6*pi))
Xsin = fracsim.1d(h=Hsin,k=1000,n=5000)
plot(Xsin$t,Xsin$process,type="l")
sint=function(x){0.5+0.5*sin(6*pi*x)}
# h is a function
Xsin2=fracsim.1d(sint,1000,500,1)
par(mfrow=c(2,1))
plot(Xsin2$t,Xsin2$simul.h,type="l")
plot(Xsin2$t,Xsin2$process,type="l")
par(mfrow=c(1,1))
}
\keyword{datagen}

