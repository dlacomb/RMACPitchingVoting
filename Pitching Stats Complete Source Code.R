> ###Pitching Stats R Script
> library(readr)
> Pitching_Stats <- read_csv("E:/Grad School/Practicum 2/Pitching Stats.csv", 
                             +     col_types = cols(`2b ` = col_number(), 
                                                    +         `3b ` = col_number(), ConfStanding = col_number(), 
                                                    +         Year = col_number(), `ab ` = col_number(), 
                                                    +         app = col_number(), `bavg ` = col_number(), 
                                                    +         `bb ` = col_number(), `bk ` = col_number(), 
                                                    +         `cg ` = col_number(), csho = col_number(), 
                                                    +         `er ` = col_number(), `era ` = col_number(), 
                                                    +         `gs ` = col_number(), `h ` = col_number(), 
                                                    +         `hbp ` = col_number(), `hr ` = col_number(), 
                                                    +         `ip ` = col_number(), `isho ` = col_number(), 
                                                    +         `l ` = col_number(), `r ` = col_number(), 
                                                    +         `so ` = col_number(), `sv ` = col_number(), 
                                                    +         w = col_number(), `wp ` = col_number()), 
                             +     locale = locale(encoding = "ASCII"))
> View(Pitching_Stats)
> ps <- Pitching_Stats
> summary(ps)
> ps <- as.data.frame(ps)

> ###Fix NA values through knn Imputation
> install.packages("DMwR")
> library(DMwR)
> ps_complete <- knnImputation(ps[,4:28], k = 5, meth = "weighAvg")
> View(ps_complete)

> ###Import Pitching Stats Full Dataset
> library(readr)
> Pitching_Stats_Full_Dataset <- read_csv("E:/Grad School/Practicum 2/Pitching Stats Full Dataset.csv", 
                                          +     col_types = cols(`2b ` = col_number(), 
                                                                 +         `3b ` = col_number(), Award = col_number(), 
                                                                 +         ConfStanding = col_number(), Year = col_number(), 
                                                                 +         `ab ` = col_number(), app = col_number(), 
                                                                 +         `bavg ` = col_number(), `bb ` = col_number(), 
                                                                 +         `bk ` = col_number(), `cg ` = col_number(), 
                                                                 +         csho = col_number(), `er ` = col_number(), 
                                                                 +         `era ` = col_number(), `gs ` = col_number(), 
                                                                 +         `h ` = col_number(), `hbp ` = col_number(), 
                                                                 +         `hr ` = col_number(), `ip ` = col_number(), 
                                                                 +         `isho ` = col_number(), `l ` = col_number(), 
                                                                 +         `r ` = col_number(), `so ` = col_number(), 
                                                                 +         `sv ` = col_number(), w = col_number(), 
                                                                 +         `wp ` = col_number()), locale = locale(encoding = "ASCII"))
> View(Pitching_Stats_Full_Dataset)
> psfd <- Pitching_Stats_Full_Dataset

> ###Exploratory Data Analysis
> install.packages("dplyr")
> library(dplyr)
> first <- filter(psfd, psfd$Award == 1)
> second <- filter(psfd, psfd$Award == 2)
> noteam <- filter(psfd, psfd$Award == 0)
> AveStats_FirstTeam = aggregate(first[,5:28], list(first$Position), FUN=mean)
> AveStats_SecondTeam = aggregate(second[,5:28], list(second$Position), FUN=mean)
> AveStats_NoTeam = aggregate(noteam[,5:28], list(noteam$Position), FUN=mean)
> AveStats_FirstTeam <- as.matrix(AveStats_FirstTeam[,2:25])
> AveStats_SecondTeam <- as.matrix(AveStats_SecondTeam[,2:25])
> AveStats_NoTeam <- as.matrix(AveStats_NoTeam[,2:25])
> compareAwards <- rbind(AveStats_FirstTeam, AveStats_SecondTeam, AveStats_NoTeam)
> barplot(compareAwards, beside = TRUE, xlab = "Pitching Metric", ylab = "Performance Value", main = "Mean Pitcher Statistics Comparison between 1st, 2nd, and No Team", col = c("gold", "grey", "brown"), cex.names = .5)
> legend("topright", c("1st Team","2nd Team", "No Team"), pch=15, col=c("gold","grey", "brown"), bty="n")

> ###Correlation plot between numeric variables
> install.packages("corrplot")
> library(corrplot)
> psfd_cor <- cor(psfd[,4:29])
> corrplot(psfd_cor, method = "circle")
> corrplot(psfd_cor, method = "number")

> ###Balance Dataset with SMOTE Algorithm
> psfd$`Player ` <- as.factor(psfd$`Player `)
> psfd$Position <- as.factor(psfd$Position)
> psfd$Team <- as.factor(psfd$Team)
> psfd$Award <- as.factor(psfd$Award)
> psfd <- as.data.frame(psfd)
> balanced_ps <- SMOTE(Award ~ ., psfd, perc.over = 650, perc.under = 2500)
> summary(balanced_ps)
> write.csv(balanced_ps, "Pitching Stats Balanced Data.csv")

> ###Import Balanced Data Set
> library(readr)
> Pitching_Stats_Balanced_Data <- read_csv("E:/Grad School/Practicum 2/Pitching Stats Balanced Data.csv", 
                                         +     col_types = cols(ConfStanding = col_number(), 
                                                                +         Year = col_number(), ab = col_number(), 
                                                                +         app = col_number(), bavg = col_number(), 
                                                                +         bb = col_number(), bk = col_number(), 
                                                                +         cg = col_number(), csho = col_number(), 
                                                                +         double = col_number(), er = col_number(), 
                                                                +         era = col_number(), gs = col_number(), 
                                                                +         h = col_number(), hbp = col_number(), 
                                                                +         hr = col_number(), ip = col_number(), 
                                                                +         isho = col_number(), l = col_number(), 
                                                                +         r = col_number(), so = col_number(), 
                                                                +         sv = col_number(), triple = col_number(), 
                                                                +         w = col_number(), wp = col_number()), 
                                         +     locale = locale(encoding = "ASCII"))
> View(Pitching_Stats_Balanced_Data)
> psbd <- Pitching_Stats_Balanced_Data
> psbd$Player <- as.factor(psbd$Player)
> psbd$Position <- as.factor(psbd$Position)
> psbd$Team <- as.factor(psbd$Team)
> psbd$Award <- as.factor(psbd$Award)
> psbd <- as.data.frame(psbd)
> summary(psbd)

> ###Machine Learning Algorithms
> ##Data Partitioning into Training and Test Sets
> ps_sets <- psbd[,2:29]
> ind <- sample(2, nrow(ps_sets), replace = TRUE, prob = c(0.8,0.2))
> trainps <- ps_sets[ind == 1,]
> testps <- ps_sets[ind == 2,]

> ##RandomForest
> install.packages("randomForest")
> library(randomForest)
> fit <- randomForest(Award ~ ., data = trainps, method="class")
> print(fit)
> #Accuracy = 98%
> summary(fit)
> importance(fit)
> #Variable Importance Order
> # 1.) Strikeouts 2.) Wins 3.) Earned Run Average 4.) At Bats 5.) Innings Pitched 6.) Batting Average Against 7.) Team 8.) Runs 9.) Hits 10.) Doubles 11.) Earned Runs 12.) Appearances 13.) Combined Shutouts 14.) Walks 15.) Conference Standing 16.) Games Started 17.) Saves 18.) Complete Games 19.) Hit Batters 20.) Losses 21.) Year 22.) Homeruns 23.) Wild Pitches 24.) Triples 25.) Balks 26.) Individual Shutouts 27.) Position
> varImpPlot(fit)
> library(caret)
> Prediction <- predict(fit, testps, type = "class")
> confusionMatrix(Prediction, testps$Award)
> #Accuracy = 98%

> ##KNN
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
> #K = 8
> bps_pred <- knn(train = trainps[,-1], test = testps[,-1], cl = trainpslabels, k = 8)
> CrossTable(x = testpslabels, y = bps_pred, prop.chisq = FALSE)
> #Accuracy = 78%
> #K = 5
> bps_pred <- knn(train = trainps[,-1], test = testps[,-1], cl = trainpslabels, k = 5)
> CrossTable(x = testpslabels, y = bps_pred, prop.chisq = FALSE)
> #Accuracy = 82%
> #K = 3
> bps_pred <- knn(train = trainps[,-1], test = testps[,-1], cl = trainpslabels, k = 3)
> CrossTable(x = testpslabels, y = bps_pred, prop.chisq = FALSE)
> #Accuracy = 87%
> #K = 2
> bps_pred <- knn(train = trainps[,-1], test = testps[,-1], cl = trainpslabels, k = 2)
> CrossTable(x = testpslabels, y = bps_pred, prop.chisq = FALSE)
> #Accuracy = 90%
  
> ###SVM
> str(psbd)
> psbd$Team <- as.numeric(psbd$Team)
> psbd$Position <- as.numeric(psbd$Position)
> pssvm <- psbd[,2:29]
> library(e1071)
> library(caret)
> #Training and Testing Set
> ind <- sample(2, nrow(pssvm), replace = TRUE, prob = c(0.8,0.2))
> trainps <- pssvm[ind == 1,]
> testps <- pssvm[ind == 2,]

> #Regular SVM Model
> svm.model <- svm(Award ~ ., data = trainps, kernal = "radial", cost = 1, gamma = 1/ncol(trainps), scale = FALSE)
> summary(svm.model)
> svm.pred <- predict(svm.model, testps)
> confusionMatrix(svm.pred, testps$Award)
> #Accuracy = 78%

> #Linear SVM Model
> svm.model.linear <- svm(Award ~ ., data = trainps, kernal = "linear", cost = 1, scale = FALSE)
> summary(svm.model.linear)
> svm.pred.linear <- predict(svm.model.linear, testps)
> confusionMatrix(svm.pred.linear, testps$Award)
> #Accuracy = 78%

> #Polynomial SVM Model
> svm.model.polynomial <- svm(Award ~ ., data = trainps, kernal = 'polynomial', cost = 1, degree = 3, coef0 = 0, gamma = 1/ncol(trainps), scale = FALSE)
> summary(svm.model.polynomial)
> svm.pred.polynomial <- predict(svm.model.polynomial, testps)
> confusionMatrix(svm.pred.polynomial, testps$Award)
> #Accuracy = 78%
  
> ###Binomial Classification
> library(readr)
> Pitching_Stats_Full_Dataset <- read_csv("E:/Grad School/Practicum 2/Pitching Stats Full Dataset.csv", 
                                          +  col_types = cols(`2b ` = col_number(), 
                                                              +  `3b ` = col_number(), Award = col_number(), 
                                                              +   ConfStanding = col_number(), Year = col_number(), 
                                                              +   `ab ` = col_number(), app = col_number(), 
                                                              + `bavg ` = col_number(), `bb ` = col_number(), 
                                                              +  `bk ` = col_number(), `cg ` = col_number(), 
                                                              + csho = col_number(), `er ` = col_number(), 
                                                              + `era ` = col_number(), `gs ` = col_number(), 
                                                              + `h ` = col_number(), `hbp ` = col_number(), 
                                                              + `hr ` = col_number(), `ip ` = col_number(), 
                                                              + `isho ` = col_number(), `l ` = col_number(), 
                                                              + `r ` = col_number(), `so ` = col_number(), 
                                                              + `sv ` = col_number(), w = col_number(), 
                                                              + `wp ` = col_number()), locale = locale(encoding = "ASCII"))
> psfd <- Pitching_Stats_Full_Dataset
> psfd$`Player ` <- as.factor(psfd$`Player `)
> psfd$Position <- as.factor(psfd$Position)
> psfd$Team <- as.factor(psfd$Team)
> psfd$Award <- as.factor(psfd$Award)
> psfd <- as.data.frame(psfd)
> psb <- psfd
> ###Change Target Variable to Binomial Classification 
> levels(psb$Award)
[1] "0" "1" "2"
> levels(psb$Award)[1] <- "No"
> levels(psb$Award)[2] <- "Yes"
> levels(psb$Award)[3] <- "Yes"
> summary(psb)

#Balance Binomial Classification Dataset
> library(DMwR)
> balanced_ps <- SMOTE(Award ~ ., psb, perc.over = 490, perc.under = 125)
> summary(balanced_ps)
> psbd <- balanced_ps

> #Binary Classification Model Analysis
> ###KNN
> library(class)
> library(gmodels)
> str(psbd)
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
> #K = 8
> bps_pred <- knn(train = trainps[,-1], test = testps[,-1], cl = trainpslabels, k = 8)
> CrossTable(x = testpslabels, y = bps_pred, prop.chisq = FALSE)
> #Accuracy = 95%
> #K = 5
> ps_pred <- knn(train = trainps[,-1], test = testps[,-1], cl = trainpslabels, k = 5)
> CrossTable(x = testpslabels, y = bps_pred, prop.chisq = FALSE)
> #Accuracy = 95%
> #K = 7
> bps_pred <- knn(train = trainps[,-1], test = testps[,-1], cl = trainpslabels, k = 7)
> CrossTable(x = testpslabels, y = bps_pred, prop.chisq = FALSE)
> #Accuracy = 96%
> #K = 6
> bps_pred <- knn(train = trainps[,-1], test = testps[,-1], cl = trainpslabels, k = 6)
> CrossTable(x = testpslabels, y = bps_pred, prop.chisq = FALSE)
> #Accuracy = 96%

> #Binomial Classification SVM
> psbd <- balanced_ps
> str(psbd)
> psbd$Team <- as.numeric(psbd$Team)
> psbd$Position <- as.numeric(psbd$Position)
> pssvm <- psbd[,2:29]
> library(e1071)
> library(caret)
> ### Training and Testing Set
> ind <- sample(2, nrow(pssvm), replace = TRUE, prob = c(0.8,0.2))
> trainps <- pssvm[ind == 1,]
> testps <- pssvm[ind == 2,]
> ### Regular SVM Model
> svm.model <- svm(Award ~ ., data = trainps, kernal = "radial", cost = 1, gamma = 1/ncol(trainps), scale = FALSE)
> summary(svm.model)
> svm.pred <- predict(svm.model, testps)
> confusionMatrix(svm.pred, testps$Award)
> #Accuracy = 80%
> ### Linear SVM Model
> svm.model.linear <- svm(Award ~ ., data = trainps, kernal = "linear", cost = 1, scale = FALSE)
> summary(svm.model.linear)
> svm.pred.linear <- predict(svm.model.linear, testps)
> confusionMatrix(svm.pred.linear, testps$Award)
> #Accuracy = 80%
> ### Polynomial SVM Model
> svm.model.polynomial <- svm(Award ~ ., data = trainps, kernal = 'polynomial', cost = 1, degree = 3, coef0 = 0, gamma = 1/ncol(trainps), scale = FALSE)
> summary(svm.model.polynomial)
> svm.pred.polynomial <- predict(svm.model.polynomial, testps)
> confusionMatrix(svm.pred.polynomial, testps$Award)
> #Accuracy = 80%


  
