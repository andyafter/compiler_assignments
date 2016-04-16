import operator

tiling = open("./output/tiling.s", 'r')
tilist = tiling.read().split()
tiling_set = set(tilist)
print tiling_set

result = {}
for i in tilist:
    if i not in result:
        result[i] = 1
    else:
        result[i] += 1

sorted_result = sorted(result.items(), key=operator.itemgetter(1))        
