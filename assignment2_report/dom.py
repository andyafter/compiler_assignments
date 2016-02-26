import networkx as nx
import graphviz as gv


dom = {
 1: 0,
 2: 1,
 3: 31,
 4: 3,
 5: 4,
 6: 4,
 7: 3,
 8: 1,
 9: 8,
 10: 9,
 11: 10,
 12: 10,
 13: 12,
 14: 13,
 15: 14,
 16: 15,
 17: 33,
 18: 16,
 19: 34,
 21: 18,
 31: 1,
 33: 16,
 34: 18,
 100: 21}
gimdom = gv.Digraph(format='jpg')
nodes = []
t = {}
for i in dom:
    if i not in nodes:
        nodes.append(i)
    if dom[i] not in nodes:
        nodes.append(dom[i])
for i in nodes:
    gimdom.node(str(i))

for i in dom:
    gimdom.edge( str(dom[i]), str(i))
gimdom.render(filename='img/imdom')

gexam = gv.Digraph(format = 'jpg')

nodes = [1,2,3,4,5,6,7, 8,9]

edges = [(1,2),
         (2,3),
         (2,4),
         (3,5),
         (4,5),
         (5,2),
         (2,6),
         (6,7),
         (3,8),
         (7,9),
         (8,9)
]
for i in nodes:
    gexam.node(str(i))
for i in edges:
    gexam.edge(str(i[0]),str(i[1]))

gexam.render(filename='img/example')
