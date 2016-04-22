time = {}
block = {}
time[10]=[
    0.019401,
    0.019391,
    0.019324,
    0.019189,
    0.019327,
    0.019190,
    0.019142,
    0.019195,
    0.019171,
    0.019201,
    0.019284,
    0.018212,
    0.018573,
    0.018146,
    0.018515,
    0.018724,
    0.018644,
    0.019081
]
time[20]=[
    0.068748,
    0.068539,
    0.068461,
    0.069008,
    0.068382,
    0.068419,
    0.069132,
    0.068487,
    0.068379,
    0.069335,
    0.068664,
    0.068535,
    0.069660,
    0.069373,
    0.067614,
    0.068182,
    0.068424
]
time[40]=[
    0.271265,
    0.271552,
    0.271238,
    0.272995,
    0.273866,
    0.271639,
    0.269792,
    0.274544,
    0.275781,
    0.271199,
    0.270836,
    0.271017,
    0.269949
]
time[50]=[
    0.410881,
    0.420394,
    0.412181,
    0.410422,
    0.410469,
    0.408864,
    0.410139,
    0.410002,
    0.415037,
    0.411892,
    0.411449,
    0.411115,
    0.409252,
    0.411690,
    0.412626,
    0.410460,
    0.415772
]
time[80]=[
    1.059171,
    1.066519,
    1.060632,
    1.057624,
    1.069446,
    1.059531,
    1.058178,
    1.063080,
    1.061074,
    1.063350,
    1.062774,
    1.059117,
    1.059466,
    1.067738,
    1.059504
]
time[100]=[
    1.643494,
    1.655093,
    1.647605,
    1.650819,
    1.655349,
    1.650722,
    1.649118,
    1.646889,
    1.656435,
    1.644136,
    1.653128,
    1.645834,
    1.652798
]
time[200]=[
    6.553487,
    6.548619,
    6.543576,
    6.552081,
    6.543057,
    6.559109,
    6.553459,
    6.554619,
    6.547317,
    6.537931,
    6.538285,
    6.542483,
    6.541550,
    6.551809,
    6.536963
]
time[500]=[
    40.708686,
40.717635
]
time[1000]=[
    163.347254,
    163.499974,
    163.322831
]

block[10]= 8000000
block[20]= 2000000
block[40]= 500000
block[50]= 320000
block[80]= 125000 
block[100]= 80000
block[200]= 20000
block[500]= 3200
block[1000]= 800

total = {}
for i in time:
    l = len(time[i])
    s = sum(time[i])
    total[i] = block[i]*s/l

for i in total:
    print i, total[i]

    
import numpy as np
import matplotlib.pyplot as plt
x = []
y = []
x.append(10)
x.append(20)
x.append(40)
x.append(50)
x.append(80)
x.append(100)
x.append(200)
x.append(500)
x.append(1000)
for i in x:
    y.append(total[i])

plt.plot(x, y, 'k-')

