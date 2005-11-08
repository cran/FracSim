#include <stdlib.h>
#include <math.h>
#include <time.h>

void core_1d(double *H, double *t, int *n, int *k , double *res)
{
  /* Local variables */
  int i,l;
  double tmp1,tmp2,tmp3,tmp,R,theta,U;
  
  R=0;
  srand(time(NULL));
  
  /* Loop over the terms of the sum (de 0 to n-1) */
  for (l=0;l<*n;l++)
    {
      theta = rand()/(float)RAND_MAX;
      U = 1;
      if ((rand()/(float)RAND_MAX) < 0.5) {U=-1;}
      R = R - log(rand()/(float)RAND_MAX);
      /* Loop over each discretization points (0 à k-1) */
      for (i=0;i<*k;i++)
	{
	  tmp1 = cos(2*M_PI*theta)*(cos(t[i]*R*U)-1);
	  tmp2 = sin(2*M_PI*theta)*sin(-t[i]*R*U);
	  tmp3 = pow(R,0.5+H[i]);
	  tmp = (tmp1-tmp2)/tmp3;
	  res[i] = res[i] + tmp;
	  if (l == *n-1) {res[i]=res[i]*2;}
	} /* end loop i */
      } /* end loop l */
} /* end function core_1d */
