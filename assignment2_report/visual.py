import graphviz as gv



##
dom_tree = []
with open('domtree.txt') as fe:
    for line in fe:
        e = line.split()
        dom_tree.append((e[0],e[1]))


f = open('dfnum.txt', 'w')
print dom_tree[0][0]
f.write('(' + str(1) + ', '+ str(dom_tree[0][0])+ ')' + '\n')
n = 1
for i in dom_tree:
    n+=1
    f.write('('+str(n)+', '+ str(i[1])+ ')' + '\n')
    print i[1]

f.close()
t = {}
for i in dom_tree:
    for j in i:
        if j not in t:
            t[j] = 0

nodes = [x for x in t]
dfsgraph= gv.Graph(format='jpg')
for i in nodes:
    dfsgraph.node(str(i))
for i in dom_tree:
    dfsgraph.edge(str(i[0]),str(i[1]))

dfsgraph.render(filename='img/dfsgraph')

cdg =gv.Digraph(format='jpg')
for i in nodes:
    cdg.node(str(i))


cdg.edge('2', '31')
cdg.edge('2', '7')
cdg.edge('2', '3')
cdg.edge('3', '6')
cdg.edge('31', '6')
cdg.edge('3', '4')
cdg.edge('4', '5')
cdg.edge('16', '33')
cdg.edge('33', '17')
cdg.edge('16', '17')
cdg.edge('10', '11')
cdg.edge('18', '34')
cdg.edge('18', '19')
cdg.render(filename='img/cdg')
