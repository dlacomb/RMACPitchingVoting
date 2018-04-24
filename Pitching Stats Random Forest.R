> ###Data Partitioning into Training and Test Sets
> ps_sets <- psbd[,2:29]
> ind <- sample(2, nrow(ps_sets), replace = TRUE, prob = c(0.8,0.2))
> trainps <- ps_sets[ind == 1,]
> testps <- ps_sets[ind == 2,]
> #RandomForest
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
Confusion Matrix and Statistics

Reference
Prediction  0  1  2
0 73  0  0
1  0 76  0
2  4  0 67

Overall Statistics

Accuracy : 0.9818         
95% CI : (0.9541, 0.995)
No Information Rate : 0.35           
P-Value [Acc > NIR] : < 2.2e-16      

Kappa : 0.9727         
Mcnemar's Test P-Value : NA             

Statistics by Class:

Class: 0 Class: 1 Class: 2
Sensitivity            0.9481   1.0000   1.0000
Specificity            1.0000   1.0000   0.9739
Pos Pred Value         1.0000   1.0000   0.9437
Neg Pred Value         0.9728   1.0000   1.0000
Prevalence             0.3500   0.3455   0.3045
Detection Rate         0.3318   0.3455   0.3045
Detection Prevalence   0.3318   0.3455   0.3227
Balanced Accuracy      0.9740   1.0000   0.9869
