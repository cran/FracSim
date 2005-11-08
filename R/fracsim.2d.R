"fracsim.2d" <-
function(h,n,kx,ky=kx,m=1)
{

# Initialization

# kx- and ky-vectors of discretization points

if (length(kx)==1) {X = seq(0,1,length=kx)}
else {
  X = kx
  kx = length(X)
    }
if (length(ky)==1) {Y = seq(0,1,length=ky)}
else {
  Y = ky
  ky = length(Y)
    }

# Multifractional case: either a function
if (is.function(h)) {mat.h = h(X,Y)}
else
{
  # or kx*ky-matrix
    if (is.matrix(h) && nrow(h)==kx && ncol(h)==ky) {mat.h = h}
    else
      {
        # Fractional case: one value for h provided by the user
        if (length(h)==1) {mat.h = matrix(rep(h,kx*ky),nrow=kx,ncol=ky)}
        else stop("Wrong input for regularity")
      }
  }

init = list(h=mat.h,tx=X,ty=Y)
  
 #  Simulation through C function core-2D.c
  
  out.simul=
    .C("core_2d",PACKAGE="FracSim",
       as.double(init$h),
       as.double(X),
       as.double(Y),
       as.integer(n),
       as.integer(length(X)),
       as.integer(length(Y)),
       res = double(length(X)*length(Y)))$res
  
 # Output of the fracsim.1d function
  out = list(process=matrix(out.simul,nrow=kx,ncol=ky),simul.h=mat.h,X=X,Y=Y)
  out
}

