import numpy as np
from scipy.optimize import fsolve
import matplotlib.pyplot as plt

def f(N, d):
    return N/(np.log(N) **((d-1)/2)) - np.power(2*np.sqrt(np.pi), d) / np.power(d, 1.5)

d = np.arange(3,10,1)
N = np.zeros(len(d))
for i in range(len(d)):
    x_0 = np.power(2*np.sqrt(np.pi), d[i]) / np.power(d[i], 1.5)
    N[i] = fsolve(lambda x: f(x, d[i]), [x_0])[0]
print(N)
plt.yscale("log")
plt.plot(d, N)
plt.show()
# the bound of sample size is not tight
# as shown in this experiment