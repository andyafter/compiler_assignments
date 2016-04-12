# this is the test for loop analysis
#X[3*j+k, i+2*j+k, 2*j+3*k] = ... X[2*i+4*k, 5*j+7*k, 3*i+5*j]
import numpy as np
m1 = np.matrix([[0, 1, 0],[3,2,2],[1,1,3]])
m2 = np.matrix([[2,0,3], [0,5,5], [4,7,0]])
for i in range(1,11):
    for j in range(1, 51):
        for k in range(1, 21):
            s = np.matrix([i, j, k])*(m1)
            t = np.matrix([i,j,k])*(m2)
            if np.sum(s-t, axis=1)!=0:
                continue
            print s-t
