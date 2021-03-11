library(igraph)
library(ForceAtlas2)
library(readxl)

Matriz_Incidente <- read_excel("C:/Users/guilh/Downloads/Matriz Incidente.xlsx", 
                               col_names = FALSE)
Matriz_Adjacente <- read_excel("C:/Users/guilh/Downloads/Matriz Adjacente.xlsx", 
                               col_names = FALSE)

TIncidence <- data.frame(Matriz_Incidente)
MIncidence <- data.matrix(TIncidence)
MIncidence

networkI <- graph_from_incidence_matrix(MIncidence)
#layoutI <- layout.forceatlas2(networkI, iterations=2000, plotstep=100)
plot(networkI)


TAdjacency <- data.frame(Matriz_Adjacente)
MAdjacency <- data.matrix(TAdjacency)
MAdjacency


networkA <- graph_from_adjacency_matrix(MAdjacency, mode = "undirected")
#layoutA <- layout.forceatlas2(networkA, iterations=2000, plotstep=100)


degree <- degree(networkA, mode="all")

degree

hist(degree)

plot(networkA, vertex.size=degree*3, vertex.color=rgb(0.1,0.7,0.8,0.5))

