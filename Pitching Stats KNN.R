> ####KNN
  > library(class)
> library(gmodels)
> knnps <- psbd[,2:29]
> knnps$Position <- as.numeric(knnps$Position)
> knnps$Team <- as.numeric(knnps$Team)
> #Normalize Data
  > normalize <- function(x) {return ((x - min(x)) / (max(x) - min(x)))}
  > bps_n <- as.data.frame(lapply(knnps[1:27], normalize))
  > #Training and Testing Sets
    > ind <- sample(2, nrow(bps_n), replace = TRUE, prob = c(0.8,0.2))
    > trainps <- bps_n[ind == 1,]
    > testps <- bps_n[ind == 2,]
    > trainpslabels <- knnps[ind == 1, 28]
    > testpslabels <- knnps[ind == 2, 28]
    > bps_pred <- knn(train = trainps[,-1], test = testps[,-1], cl = trainpslabels, k = 8)
    > CrossTable(x = testpslabels, y = bps_pred, prop.chisq = FALSE)
    
    
    Cell Contents
    |-------------------------|
      |                       N |
      |           N / Row Total |
      |           N / Col Total |
      |         N / Table Total |
      |-------------------------|
      
      
      Total Observations in Table:  195 
    
    
    | bps_pred 
    testpslabels |         0 |         1 |         2 | Row Total | 
      -------------|-----------|-----------|-----------|-----------|
      0 |        58 |         0 |        13 |        71 | 
      |     0.817 |     0.000 |     0.183 |     0.364 | 
      |     0.906 |     0.000 |     0.143 |           | 
      |     0.297 |     0.000 |     0.067 |           | 
      -------------|-----------|-----------|-----------|-----------|
      1 |         2 |        40 |        23 |        65 | 
      |     0.031 |     0.615 |     0.354 |     0.333 | 
      |     0.031 |     1.000 |     0.253 |           | 
      |     0.010 |     0.205 |     0.118 |           | 
      -------------|-----------|-----------|-----------|-----------|
      2 |         4 |         0 |        55 |        59 | 
      |     0.068 |     0.000 |     0.932 |     0.303 | 
      |     0.062 |     0.000 |     0.604 |           | 
      |     0.021 |     0.000 |     0.282 |           | 
      -------------|-----------|-----------|-----------|-----------|
      Column Total |        64 |        40 |        91 |       195 | 
      |     0.328 |     0.205 |     0.467 |           | 
      -------------|-----------|-----------|-----------|-----------|
      > #Accuracy = 78%
      
      
      > bps_pred <- knn(train = trainps[,-1], test = testps[,-1], cl = trainpslabels, k = 5)
    > CrossTable(x = testpslabels, y = bps_pred, prop.chisq = FALSE)
    
    
    Cell Contents
    |-------------------------|
      |                       N |
      |           N / Row Total |
      |           N / Col Total |
      |         N / Table Total |
      |-------------------------|
      
      
      Total Observations in Table:  195 
    
    
    | bps_pred 
    testpslabels |         0 |         1 |         2 | Row Total | 
      -------------|-----------|-----------|-----------|-----------|
      0 |        62 |         0 |         9 |        71 | 
      |     0.873 |     0.000 |     0.127 |     0.364 | 
      |     0.984 |     0.000 |     0.100 |           | 
      |     0.318 |     0.000 |     0.046 |           | 
      -------------|-----------|-----------|-----------|-----------|
      1 |         1 |        42 |        22 |        65 | 
      |     0.015 |     0.646 |     0.338 |     0.333 | 
      |     0.016 |     1.000 |     0.244 |           | 
      |     0.005 |     0.215 |     0.113 |           | 
      -------------|-----------|-----------|-----------|-----------|
      2 |         0 |         0 |        59 |        59 | 
      |     0.000 |     0.000 |     1.000 |     0.303 | 
      |     0.000 |     0.000 |     0.656 |           | 
      |     0.000 |     0.000 |     0.303 |           | 
      -------------|-----------|-----------|-----------|-----------|
      Column Total |        63 |        42 |        90 |       195 | 
      |     0.323 |     0.215 |     0.462 |           | 
      -------------|-----------|-----------|-----------|-----------|
      > #Accuracy = 82%
      
      
      > bps_pred <- knn(train = trainps[,-1], test = testps[,-1], cl = trainpslabels, k = 3)
    > CrossTable(x = testpslabels, y = bps_pred, prop.chisq = FALSE)
    
    
    Cell Contents
    |-------------------------|
      |                       N |
      |           N / Row Total |
      |           N / Col Total |
      |         N / Table Total |
      |-------------------------|
      
      
      Total Observations in Table:  195 
    
    
    | bps_pred 
    testpslabels |         0 |         1 |         2 | Row Total | 
      -------------|-----------|-----------|-----------|-----------|
      0 |        67 |         0 |         4 |        71 | 
      |     0.944 |     0.000 |     0.056 |     0.364 | 
      |     0.971 |     0.000 |     0.053 |           | 
      |     0.344 |     0.000 |     0.021 |           | 
      -------------|-----------|-----------|-----------|-----------|
      1 |         2 |        51 |        12 |        65 | 
      |     0.031 |     0.785 |     0.185 |     0.333 | 
      |     0.029 |     1.000 |     0.160 |           | 
      |     0.010 |     0.262 |     0.062 |           | 
      -------------|-----------|-----------|-----------|-----------|
      2 |         0 |         0 |        59 |        59 | 
      |     0.000 |     0.000 |     1.000 |     0.303 | 
      |     0.000 |     0.000 |     0.787 |           | 
      |     0.000 |     0.000 |     0.303 |           | 
      -------------|-----------|-----------|-----------|-----------|
      Column Total |        69 |        51 |        75 |       195 | 
      |     0.354 |     0.262 |     0.385 |           | 
      -------------|-----------|-----------|-----------|-----------|
      > #Accuracy = 87%
      
      
      > bps_pred <- knn(train = trainps[,-1], test = testps[,-1], cl = trainpslabels, k = 2)
    > CrossTable(x = testpslabels, y = bps_pred, prop.chisq = FALSE)
    
    
    Cell Contents
    |-------------------------|
      |                       N |
      |           N / Row Total |
      |           N / Col Total |
      |         N / Table Total |
      |-------------------------|
      
      
      Total Observations in Table:  195 
    
    
    | bps_pred 
    testpslabels |         0 |         1 |         2 | Row Total | 
      -------------|-----------|-----------|-----------|-----------|
      0 |        68 |         0 |         3 |        71 | 
      |     0.958 |     0.000 |     0.042 |     0.364 | 
      |     0.971 |     0.000 |     0.041 |           | 
      |     0.349 |     0.000 |     0.015 |           | 
      -------------|-----------|-----------|-----------|-----------|
      1 |         2 |        52 |        11 |        65 | 
      |     0.031 |     0.800 |     0.169 |     0.333 | 
      |     0.029 |     1.000 |     0.151 |           | 
      |     0.010 |     0.267 |     0.056 |           | 
      -------------|-----------|-----------|-----------|-----------|
      2 |         0 |         0 |        59 |        59 | 
      |     0.000 |     0.000 |     1.000 |     0.303 | 
      |     0.000 |     0.000 |     0.808 |           | 
      |     0.000 |     0.000 |     0.303 |           | 
      -------------|-----------|-----------|-----------|-----------|
      Column Total |        70 |        52 |        73 |       195 | 
      |     0.359 |     0.267 |     0.374 |           | 
      -------------|-----------|-----------|-----------|-----------|
      > #Accuracy = 90%
      
      > #Binary Classification Model Analysis
      > ####KNN
      > library(class)
    > library(gmodels)
    > str(psbd)
    > knnps <- psbd[,2:29]
    > knnps$Position <- as.numeric(knnps$Position)
    > knnps$Team <- as.numeric(knnps$Team)
    > #Normalize Data
      > normalize <- function(x) {return ((x - min(x)) / (max(x) - min(x)))}
    > bps_n <- as.data.frame(lapply(knnps[1:27], normalize))
    > 
      > #Training and Testing Sets
      > ind <- sample(2, nrow(bps_n), replace = TRUE, prob = c(0.8,0.2))
    > trainps <- bps_n[ind == 1,]
    > testps <- bps_n[ind == 2,]
    > trainpslabels <- knnps[ind == 1, 28]
    > testpslabels <- knnps[ind == 2, 28]
    > bps_pred <- knn(train = trainps[,-1], test = testps[,-1], cl = trainpslabels, k = 8)
    > CrossTable(x = testpslabels, y = bps_pred, prop.chisq = FALSE)
    
    
    Cell Contents
    |-------------------------|
      |                       N |
      |           N / Row Total |
      |           N / Col Total |
      |         N / Table Total |
      |-------------------------|
      
      
      Total Observations in Table:  220 
    
    
    | bps_pred 
    testpslabels |        No |       Yes | Row Total | 
      -------------|-----------|-----------|-----------|
      No |       101 |         7 |       108 | 
      |     0.935 |     0.065 |     0.491 | 
      |     0.971 |     0.060 |           | 
      |     0.459 |     0.032 |           | 
      -------------|-----------|-----------|-----------|
      Yes |         3 |       109 |       112 | 
      |     0.027 |     0.973 |     0.509 | 
      |     0.029 |     0.940 |           | 
      |     0.014 |     0.495 |           | 
      -------------|-----------|-----------|-----------|
      Column Total |       104 |       116 |       220 | 
      |     0.473 |     0.527 |           | 
      -------------|-----------|-----------|-----------|
      
      
      > #Accuracy = 95%
      > ps_pred <- knn(train = trainps[,-1], test = testps[,-1], cl = trainpslabels, k = 5)
    > CrossTable(x = testpslabels, y = bps_pred, prop.chisq = FALSE)
    
    
    Cell Contents
    |-------------------------|
      |                       N |
      |           N / Row Total |
      |           N / Col Total |
      |         N / Table Total |
      |-------------------------|
      
      
      Total Observations in Table:  220 
    
    
    | bps_pred 
    testpslabels |        No |       Yes | Row Total | 
      -------------|-----------|-----------|-----------|
      No |       101 |         7 |       108 | 
      |     0.935 |     0.065 |     0.491 | 
      |     0.971 |     0.060 |           | 
      |     0.459 |     0.032 |           | 
      -------------|-----------|-----------|-----------|
      Yes |         3 |       109 |       112 | 
      |     0.027 |     0.973 |     0.509 | 
      |     0.029 |     0.940 |           | 
      |     0.014 |     0.495 |           | 
      -------------|-----------|-----------|-----------|
      Column Total |       104 |       116 |       220 | 
      |     0.473 |     0.527 |           | 
      -------------|-----------|-----------|-----------|
      
      
      > #Accuracy = 95%
      > bps_pred <- knn(train = trainps[,-1], test = testps[,-1], cl = trainpslabels, k = 7)
    > CrossTable(x = testpslabels, y = bps_pred, prop.chisq = FALSE)
    
    
    Cell Contents
    |-------------------------|
      |                       N |
      |           N / Row Total |
      |           N / Col Total |
      |         N / Table Total |
      |-------------------------|
      
      
      Total Observations in Table:  220 
    
    
    | bps_pred 
    testpslabels |        No |       Yes | Row Total | 
      -------------|-----------|-----------|-----------|
      No |       102 |         6 |       108 | 
      |     0.944 |     0.056 |     0.491 | 
      |     0.981 |     0.052 |           | 
      |     0.464 |     0.027 |           | 
      -------------|-----------|-----------|-----------|
      Yes |         2 |       110 |       112 | 
      |     0.018 |     0.982 |     0.509 | 
      |     0.019 |     0.948 |           | 
      |     0.009 |     0.500 |           | 
      -------------|-----------|-----------|-----------|
      Column Total |       104 |       116 |       220 | 
      |     0.473 |     0.527 |           | 
      -------------|-----------|-----------|-----------|
      
      
      > #Accuracy = 96%
      > bps_pred <- knn(train = trainps[,-1], test = testps[,-1], cl = trainpslabels, k = 6)
    > CrossTable(x = testpslabels, y = bps_pred, prop.chisq = FALSE)
    
    
    Cell Contents
    |-------------------------|
      |                       N |
      |           N / Row Total |
      |           N / Col Total |
      |         N / Table Total |
      |-------------------------|
      
      
      Total Observations in Table:  220 
    
    
    | bps_pred 
    testpslabels |        No |       Yes | Row Total | 
      -------------|-----------|-----------|-----------|
      No |       101 |         7 |       108 | 
      |     0.935 |     0.065 |     0.491 | 
      |     0.981 |     0.060 |           | 
      |     0.459 |     0.032 |           | 
      -------------|-----------|-----------|-----------|
      Yes |         2 |       110 |       112 | 
      |     0.018 |     0.982 |     0.509 | 
      |     0.019 |     0.940 |           | 
      |     0.009 |     0.500 |           | 
      -------------|-----------|-----------|-----------|
      Column Total |       103 |       117 |       220 | 
      |     0.468 |     0.532 |           | 
      -------------|-----------|-----------|-----------|
      
      
      > #Accuracy = 96%