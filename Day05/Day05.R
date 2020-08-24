setwd("C:/Users/PMA2020/Desktop/delete/R")

getwd()

library(tm)

#create corpus

docs <- Corpus(DirSource("C:/Users/PMA2020/Desktop/delete/R"))

docs

length(docs)

#inspect a particular document 
writeLines(as.character(docs[[1]]))

writeLines(as.character(docs[[3]]))


dtm <- DocumentTermMatrix(docs)
dtm

#i
inspect(dtm[1:3,100:105])

m <- as.matrix(dtm)

write.csv(m,file ="3docs2.csv")

#distance matrix
#Euclidean Distance 

distMatrix <- dist(m , method = "euclidean")
distMatrix


group <- hclust(distMatrix, method = "ward.D")
plot(group , cex=1.2, hang = -1)

rect.hclust(group , k=2)

View(group)

#agglomartivte 
#dendrogram 

###################twitter analysis 


