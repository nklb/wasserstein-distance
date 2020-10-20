[![View Wasserstein distance on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://uk.mathworks.com/matlabcentral/fileexchange/75228-wasserstein-distance)

# Wasserstein distance code for Matlab
This is a compact Matlab code to compute the 1- and 2-Wasserstein distances for one dimensional probability distributions.

Refer to [Wikipedia](https://en.wikipedia.org/wiki/Wasserstein_metric) for a general definition of the Wasserstein distance ![w_p](https://render.githubusercontent.com/render/math?math=w_p). This implementation is based on the fact that for given distributions _u_ and _v_ the 1-Wasserstein distance can be written as

![w_1(u,v) = \int_{-\infty}^\infty \left|U_\text{cdf}(x)-V_\text{cdf}(x)\right|\,dx](https://render.githubusercontent.com/render/math?math=w_1(u%2Cv)%20%3D%20%5Cint_%7B-%5Cinfty%7D%5E%5Cinfty%20%5Cleft%7CU_%5Ctext%7Bcdf%7D(x)-V_%5Ctext%7Bcdf%7D(x)%5Cright%7C%5C%2Cdx)

and the 2-Wasserstein distance as

![w_2(u,v)^2 = \int_{0}^1 \left(U_\text{icdf}(p)-V_\text{icdf}(p)\right)^2\,dp.](https://render.githubusercontent.com/render/math?math=w_2(u%2Cv)%5E2%20%3D%20%5Cint_%7B0%7D%5E1%20%5Cleft(U_%5Ctext%7Bicdf%7D(p)-V_%5Ctext%7Bicdf%7D(p)%5Cright)%5E2%5C%2Cdp.)

Here ![U_\text{cdf}](https://render.githubusercontent.com/render/math?math=U_%5Ctext%7Bcdf%7D) and ![V_\text{cdf}](https://render.githubusercontent.com/render/math?math=V_%5Ctext%7Bcdf%7D) refer to the cumulative density functions of _u_ and _v_ and ![U_\text{icdf}](https://render.githubusercontent.com/render/math?math=U_%5Ctext%7Bicdf%7D) and ![V_\text{icdf}](https://render.githubusercontent.com/render/math?math=V_%5Ctext%7Bicdf%7D) to the corresponding pseudo inverse cumulative density functions defined by

![U_\text{icdf}(p) = \inf\{x: \, U_\text{cdf}(x) > p\}.](https://render.githubusercontent.com/render/math?math=U_%5Ctext%7Bicdf%7D(p)%20%3D%20%5Cinf%5C%7Bx%3A%20%5C%2C%20U_%5Ctext%7Bcdf%7D(x)%20%3E%20p%5C%7D.)

The code assumes (unlike for instance the [bioconductor function](https://www.bioconductor.org/packages/devel/bioc/vignettes/waddR/inst/doc/wasserstein_metric.html)) that _u_ and _v_ are discrete and uniform probability distribution. In this case there are samples ![u_1, u_2, \dots, u_N](https://render.githubusercontent.com/render/math?math=u_1%2C%20u_2%2C%20%5Cdots%2C%20u_N) such that any _u_ distributed random variable ![X_u](https://render.githubusercontent.com/render/math?math=X_u) satisfies ![P(X_u = u_k)=1/N](https://render.githubusercontent.com/render/math?math={P(X_u=u_k)=1/N}) for all _k_. These samples are the inputs of the function, let's assume without loss of generality that they are increasingly sorted then the cumulative distribution function and its pseudo inverse are given by the step functions

![U_\text{cdf}(x) = \frac{\max\{i: \, u_i \leq x\}}{N}, \quad U_\text{icdf}(p)=u_{\left \lfloor{p/N} \right \rfloor + 1}\,.](https://render.githubusercontent.com/render/math?math=U_%5Ctext%7Bcdf%7D(x)%20%3D%20%5Cfrac%7B%5Cmax%5C%7Bi%3A%20%5C%2C%20u_i%20%5Cleq%20x%5C%7D%7D%7BN%7D%2C%20%5Cquad%20U_%5Ctext%7Bicdf%7D(p)%3Du_%7B%5Cleft%20%5Clfloor%7Bp%2FN%7D%20%5Cright%20%5Crfloor%20%2B%201%7D%5C%2C.)

The code has been tested in Matlab R2017a and checked against the [scipy Wasserstein distance](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.wasserstein_distance.html) (in case of the 1-Wasserstein distance) and the [earth mover distance code on Matlab Central File Exchange](https://www.mathworks.com/matlabcentral/fileexchange/22962-the-earth-mover-s-distance). The latter code allows for computations of the general p-Wasserstein distance but is computationally more complex than the present code for the described situation.

### Some references
Carrillo, J.A. and G. Toscani. „Wasserstein Metric and Large-Time Asymptotics of Nonlinear Diffusion Equations“. In New Trends in Mathematical Physics, 234–44. Naples, Italy: WORLD SCIENTIFIC, 2005. https://doi.org/10.1142/9789812702319_0022.

Kantorovich, L. V. „On the Translocation of Masses“. Journal of Mathematical Sciences 133, No. 4 (March 2006): 1381–82. https://doi.org/10.1007/s10958-006-0049-2.
