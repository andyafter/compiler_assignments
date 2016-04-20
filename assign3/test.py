result = {}

x = {}
for i in range(1,11):
    for j in range(1,51):
        for k in range(1,21):
            key = 3*j+k, i+2*j+k, 2*j+3*k
            val = 2*i+4*k, 5*j+7*k, 3*i+5*j
            if val in x:
                print key, val
                print i,j,k
            x[key] = val
            
                
