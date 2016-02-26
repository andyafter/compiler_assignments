import networkx as nx
import matplotlib.pyplot as plt
import tarjan

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



# creating the graph from edges.txt
graph=nx.DiGraph()
graph.add_nodes_from(IDs)
graph.add_edges_from(edges)
dftree = nx.dfs_tree(graph,0)

#tree = nx.dfs_edges(graph)
imdom = sorted(nx.immediate_dominators(graph, 0).items()) # immediante dominance


dom_tree = nx.DiGraph()
#dom_tree.add_nodes_from(IDs)
dom_tree.add_edges_from(imdom)

fdomtree = open("domtree.txt",'w')
fdomtree.write('\n'.join('%s %s' % (str(x[0]), str(x[1])) for x in dftree.edges()))

fdomtree.close()
#nx.draw_graphviz(dftree, with_labels = True)

# drawings
# nx.draw_networkx(dom_tree, with_labels = True)
#nx.draw(graph)
#plt.show()
