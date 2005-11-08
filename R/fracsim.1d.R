"fracsim.1d" <-
function(h,n,k,m=1)
  {

# k-vector of discretization points
if (length(k)==1) {t = seq(from=0,to=1,length=k)}
else t=k

# Multifractional case: either a function
if (is.function(h)) {vect.h = h(t)}
else
{
  # or length(t)-vector
  if (length(h)==length(t)) {vect.h = h}
  else {
# Fractional case: one value for h provided by the user
    if (length(h)==1) {vect.h = rep(h,length(t))}
    else stop("Wrong input for regularity")
  	}
}


# Simulation through C function core-1D.c

out.simul=
  .C("core_1d",PACKAGE="FracSim",
       as.double(vect.h),
       as.double(t),
       as.integer(n),
       as.integer(length(t)),
       res = double(length(t)))$res

# Output of the fracsim.1d function

out = list(process=out.simul,simul.h=vect.h,t=t)
out

}

