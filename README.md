[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.10912241.svg)](https://doi.org/10.5281/zenodo.10912241)
[![View Wasserstein distance on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://uk.mathworks.com/matlabcentral/fileexchange/75228-wasserstein-distance)

# Wasserstein distance code for Matlab
This is a compact Matlab code to compute the 1- and 2-Wasserstein distances for one dimensional probability distributions.

Refer to [Wikipedia](https://en.wikipedia.org/wiki/Wasserstein_metric) for a general definition of the Wasserstein distance $w_p$. This implementation is based on the fact that for given distributions $u$ and $v$ the 1-Wasserstein distance can be written as

$$ w_1(u,v) = \int_{-\infty}^\infty \left|U_\text{cdf}(x)-V_\text{cdf}(x)\right| dx $$

and the 2-Wasserstein distance as

$$ w_2(u,v)^2 = \int_{0}^1 \left(U_\text{icdf}(p)-V_\text{icdf}(p)\right)^2 dp.$$

Here $U_\text{cdf}$ and $V_\text{cdf}$ refer to the cumulative density functions of $u$ and $v$ and $U_\text{icdf}$ and $V_\text{icdf}$ to the corresponding pseudo inverse cumulative density functions defined by

$$ U_\text{icdf}(p) = \inf \\{ x:  U_\text{cdf}(x) > p \\}. $$

The code assumes (unlike for instance the [bioconductor function](https://www.bioconductor.org/packages/devel/bioc/vignettes/waddR/inst/doc/wasserstein_metric.html)) that $u$ and $v$ are discrete and uniform probability distribution. In this case there are samples $u_1, u_2, \dots, u_N$ such that any $u$ distributed random variable $X_u$ satisfies $P(X_u = u_k)=1/N$ for all $k$. These samples are the inputs of the function, let's assume without loss of generality that they are increasingly sorted then the cumulative distribution function and its pseudo inverse are given by the step functions

$$ U_\text{cdf}(x) = \frac{\max\\{i: u_i \leq x\\}}{N}, \qquad U_\text{icdf}(p)=u_{\left \lfloor{p/N} \right \rfloor + 1}. $$

The code has been tested in Matlab R2017a and checked against the [scipy Wasserstein distance](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.wasserstein_distance.html) (in case of the 1-Wasserstein distance) and the [earth mover distance code on Matlab Central File Exchange](https://www.mathworks.com/matlabcentral/fileexchange/22962-the-earth-mover-s-distance). The latter code allows for computations of the general p-Wasserstein distance but is computationally more complex than the present code for the described situation.

### Some references
Carrillo, J.A. and G. Toscani. „Wasserstein Metric and Large-Time Asymptotics of Nonlinear Diffusion Equations“. In New Trends in Mathematical Physics, 234–44. Naples, Italy: WORLD SCIENTIFIC, 2005. https://doi.org/10.1142/9789812702319_0022.

Kantorovich, L. V. „On the Translocation of Masses“. Journal of Mathematical Sciences 133, No. 4 (March 2006): 1381–82. https://doi.org/10.1007/s10958-006-0049-2.
