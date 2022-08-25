import numpy as np
from scipy.integrate import quad
from scipy.special import beta
c = 0.5
d = 4
b = 1
a = c

f = lambda t: 2*(1+t*t)/(1-t*t)**2 / np.sqrt(c*c-t*t)
print(quad(f, 0, c)[0])
print(np.pi / (1-c*c)**1.5)

f = lambda t: (a-b*t*t)**((d-3)/2) * (1/(1-t)**(d-1) + 1/(1+t)**(d-1))
print((b-a)**((d-1)/2) * quad(f, 0, np.sqrt(a/b))[0])
print(beta((d-1)/2, 0.5) * a **((d-2)/2) * b **((d-2)/2))