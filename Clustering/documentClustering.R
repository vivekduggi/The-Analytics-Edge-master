---
  title: "Document Clustering"
output: html_notebook
---
  
  
  ### Loading dataset
  
  ```{r}
documents = read.csv("dailykos.csv")
```

### Calculating distances

```{r}
distances = dist(documents, method = "euclidean")
```

### Performing hierarchical clustering

```{r}
clusterDocs = hclust(distances, method = "ward.D")
```

```{r}
plot(clusterDocs)
```

### Assigning labels to datapoints

```{r}
DocumentsGroups = cutree(clusterDocs,k = 7)
spl = split(documents, DocumentsGroups)
```

```{r}
cluster1 = spl[[1]]
cluster2 = spl[[2]]
cluster3 = spl[[3]]
cluster4 = spl[[4]]
cluster5 = spl[[5]]
cluster6 = spl[[6]]
cluster7 = spl[[7]]
```

```{r}
lapply(spl,nrow)
```

* We can see that cluster1 has highest number of observations and cluster4 has fewest number  
of observations.


### Most frequent word in cluster1

```{r}
tail(sort(colMeans(cluster1)))
```

### Most frequent word in cluster2

```{r}
tail(sort(colMeans(cluster2)))
```

### Cluster related to *iraq war*
```{r}
tail(sort(colMeans(cluster5)))
```

### Cluster corresponding to *Democartic Party*

```{r}
tail(sort(colMeans(cluster7)))
```

### Performing k-means clustering

```{r}
k = 7
set.seed(1000)
```

```{r}
KMC = kmeans(documents, centers = k)
```

```{r}
documentClusters = KMC$cluster
```

```{r}
Kclusters = split(documents, documentClusters)
```

```{r}
lapply(Kclusters,nrow)
```

```{r}
tail(sort(colMeans(Kclusters[[2]])))
```


