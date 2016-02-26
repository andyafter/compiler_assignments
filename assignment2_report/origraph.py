import graphviz as gv


# all the nodes
IDs = [0,100] # 0 and 100 are start and end
for i in range(1,20):
    IDs.append(i)

IDs = IDs + [21,31,33,34]
edges = []
with open('edges.txt') as fedges:
    for line in fedges:
        e = line.split()
        edges.append((int(e[0]),int(e[1])))


graph= gv.Digraph(format='jpg')

n = 1
for i in IDs:
    graph.node(str(i))

for i in edges:
    graph.edge(str(i[0]), str(i[1]) )

graph.render(filename='img/graph')
