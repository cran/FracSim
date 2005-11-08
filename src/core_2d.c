#include <stdlib.h>
#include <math.h>
#include <time.h>

void core_2d(double *H, double *X, double *Y, int *n, int *kx ,int *ky, double *res)
{
  /* Local variables */
  int i,j,l,ij;
  double R,thetaU,thetaZ;
  double tmp1,tmp2,tmp3,tmp;

  R = 0; 
  srand(time(NULL));

  /* Loop over the terms of the sum (from 0 to n-1) */
  for (l=0;l<*n;l++)
    {
      thetaU = rand()/(float)RAND_MAX;
      thetaZ = rand()/(float)RAND_MAX;
      R = R - log(rand()/(float)RAND_MAX);
      ij = 0;
      /* Loop over the rows of the grid (from 0 to kx-1) */
      for (i=0;i<*kx;i++)
	{
	  /* Loop over the columns of the grid (from 0 to ky-1) */
	  for (j=0;j<*ky;j++)
	    {
	      tmp1 = sqrt(R/M_PI)*(X[i]*cos(2*M_PI*thetaU)+Y[j]*sin(2*M_PI*thetaU));
	      tmp2 = (cos(tmp1)-1)*cos(2*M_PI*thetaZ)+sin(tmp1)*sin(2*M_PI*thetaZ);
	      tmp3 = pow(R,(1+H[ij])/2);
	      tmp = tmp2/tmp3;
	      res[ij] = res[ij] + tmp;
	      ij++;
	      if (l == *n-1) {res[ij] = res[ij] * 2*pow(M_PI,0.5*(1+H[ij]));}
	    } /* end loop j */
	} /* end loop i */
    } /* end loop l */
} /* end function core_2d */
