import numpy as np
from scipy.integrate import quad
c = 0.5

f = lambda t: 2*(1+t*t)/(1-t*t)**2 / np.sqrt(c*c-t*t)
print(quad(f, 0, c)[0])
print(np.pi / (1-c*c)**1.5)
