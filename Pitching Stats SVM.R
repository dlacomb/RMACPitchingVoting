> ###SVM
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

Call:
  svm(formula = Award ~ ., data = trainps, kernal = "radial", cost = 1, gamma = 1/ncol(trainps), scale = FALSE)


Parameters:
  SVM-Type:  C-classification 
SVM-Kernel:  radial 
cost:  1 
gamma:  0.03571429 

>##Binary SVM
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

Call:
  svm(formula = Award ~ ., data = trainps, kernal = "radial", cost = 1, gamma = 1/ncol(trainps), scale = FALSE)


Parameters:
  SVM-Type:  C-classification 
SVM-Kernel:  radial 
cost:  1 
gamma:  0.03571429 

Number of Support Vectors:  771

( 381 390 )


Number of Classes:  2 

Levels: 
  No Yes



> svm.pred <- predict(svm.model, testps)
> confusionMatrix(svm.pred, testps$Award)
Confusion Matrix and Statistics

Reference
Prediction No Yes
No  47   0
Yes 39  95

Accuracy : 0.7845          
95% CI : (0.7174, 0.8421)
No Information Rate : 0.5249          
P-Value [Acc > NIR] : 4.131e-13       

Kappa : 0.5585          
Mcnemar's Test P-Value : 1.166e-09       

Sensitivity : 0.5465          
Specificity : 1.0000          
Pos Pred Value : 1.0000          
Neg Pred Value : 0.7090          
Prevalence : 0.4751          
Detection Rate : 0.2597          
Detection Prevalence : 0.2597          
Balanced Accuracy : 0.7733          

'Positive' Class : No              

> ### Linear SVM Model
> svm.model.linear <- svm(Award ~ ., data = trainps, kernal = "linear", cost = 1, scale = FALSE)
> summary(svm.model.linear)

Call:
svm(formula = Award ~ ., data = trainps, kernal = "linear", cost = 1, scale = FALSE)


Parameters:
SVM-Type:  C-classification 
SVM-Kernel:  radial 
cost:  1 
gamma:  0.03703704 

Number of Support Vectors:  773

( 382 391 )


Number of Classes:  2 

Levels: 
No Yes



> svm.pred.linear <- predict(svm.model.linear, testps)
> confusionMatrix(svm.pred.linear, testps$Award)
Confusion Matrix and Statistics

Reference
Prediction No Yes
No  46   0
Yes 40  95

Accuracy : 0.779           
95% CI : (0.7115, 0.8372)
No Information Rate : 0.5249          
P-Value [Acc > NIR] : 1.346e-12       

Kappa : 0.5469          
Mcnemar's Test P-Value : 6.984e-10       

Sensitivity : 0.5349          
Specificity : 1.0000          
Pos Pred Value : 1.0000          
Neg Pred Value : 0.7037          
Prevalence : 0.4751          
Detection Rate : 0.2541          
Detection Prevalence : 0.2541          
Balanced Accuracy : 0.7674          

'Positive' Class : No              

> ### Polynomial SVM Model
  > svm.model.polynomial <- svm(Award ~ ., data = trainps, kernal = 'polynomial', cost = 1, degree = 3, coef0 = 0, gamma = 1/ncol(trainps), scale = FALSE)
> summary(svm.model.polynomial)

Call:
  svm(formula = Award ~ ., data = trainps, kernal = "polynomial", cost = 1, degree = 3, coef0 = 0, gamma = 1/ncol(trainps), 
      scale = FALSE)


Parameters:
  SVM-Type:  C-classification 
SVM-Kernel:  radial 
cost:  1 
gamma:  0.03571429 

Number of Support Vectors:  771

( 381 390 )


Number of Classes:  2 

Levels: 
  No Yes



> svm.pred.polynomial <- predict(svm.model.polynomial, testps)
> confusionMatrix(svm.pred.polynomial, testps$Award)
Confusion Matrix and Statistics

Reference
Prediction No Yes
No  47   0
Yes 39  95

Accuracy : 0.7845          
95% CI : (0.7174, 0.8421)
No Information Rate : 0.5249          
P-Value [Acc > NIR] : 4.131e-13       

Kappa : 0.5585          
Mcnemar's Test P-Value : 1.166e-09       

Sensitivity : 0.5465          
Specificity : 1.0000          
Pos Pred Value : 1.0000          
Neg Pred Value : 0.7090          
Prevalence : 0.4751          
Detection Rate : 0.2597          
Detection Prevalence : 0.2597          
Balanced Accuracy : 0.7733          

'Positive' Class : No  

Number of Support Vectors:  622

( 254 270 98 )


Number of Classes:  3 

Levels: 
  0 1 2


#Binomial Classification SVM
> svm.pred <- predict(svm.model, testps)
> confusionMatrix(svm.pred, testps$Award)
Confusion Matrix and Statistics

Reference
Prediction  0  1  2
0 35  0  0
1 46 77  0
2  0  0 77

Overall Statistics

Accuracy : 0.8043         
95% CI : (0.7477, 0.853)
No Information Rate : 0.3447         
P-Value [Acc > NIR] : < 2.2e-16      

Kappa : 0.7078         
Mcnemar's Test P-Value : NA             

Statistics by Class:

Class: 0 Class: 1 Class: 2
Sensitivity            0.4321   1.0000   1.0000
Specificity            1.0000   0.7089   1.0000
Pos Pred Value         1.0000   0.6260   1.0000
Neg Pred Value         0.7700   1.0000   1.0000
Prevalence             0.3447   0.3277   0.3277
Detection Rate         0.1489   0.3277   0.3277
Detection Prevalence   0.1489   0.5234   0.3277
Balanced Accuracy      0.7160   0.8544   1.0000
> ### Linear SVM Model
> svm.model.linear <- svm(Award ~ ., data = trainps, kernal = "linear", cost = 1, scale = FALSE)
> summary(svm.model.linear)

Call:
svm(formula = Award ~ ., data = trainps, kernal = "linear", cost = 1, scale = FALSE)


Parameters:
SVM-Type:  C-classification 
SVM-Kernel:  radial 
cost:  1 
gamma:  0.03703704 

Number of Support Vectors:  623

( 254 270 99 )


Number of Classes:  3 

Levels: 
0 1 2



> svm.pred.linear <- predict(svm.model.linear, testps)
> confusionMatrix(svm.pred.linear, testps$Award)
Confusion Matrix and Statistics

Reference
Prediction  0  1  2
0 34  0  0
1 47 77  0
2  0  0 77

Overall Statistics

Accuracy : 0.8             
95% CI : (0.7431, 0.8492)
No Information Rate : 0.3447          
P-Value [Acc > NIR] : < 2.2e-16       

Kappa : 0.7014          
Mcnemar's Test P-Value : NA              

Statistics by Class:
  
  Class: 0 Class: 1 Class: 2
Sensitivity            0.4198   1.0000   1.0000
Specificity            1.0000   0.7025   1.0000
Pos Pred Value         1.0000   0.6210   1.0000
Neg Pred Value         0.7662   1.0000   1.0000
Prevalence             0.3447   0.3277   0.3277
Detection Rate         0.1447   0.3277   0.3277
Detection Prevalence   0.1447   0.5277   0.3277
Balanced Accuracy      0.7099   0.8513   1.0000
> ### Polynomial SVM Model
> svm.model.polynomial <- svm(Award ~ ., data = trainps, kernal = 'polynomial', cost = 1, degree = 3, coef0 = 0, gamma = 1/ncol(trainps), scale = FALSE)
> summary(svm.model.polynomial)

Call:
  svm(formula = Award ~ ., data = trainps, kernal = "polynomial", cost = 1, degree = 3, coef0 = 0, gamma = 1/ncol(trainps), 
      scale = FALSE)


Parameters:
  SVM-Type:  C-classification 
SVM-Kernel:  radial 
cost:  1 
gamma:  0.03571429 

Number of Support Vectors:  622

( 254 270 98 )


Number of Classes:  3 

Levels: 
  0 1 2



> svm.pred.polynomial <- predict(svm.model.polynomial, testps)
> confusionMatrix(svm.pred.polynomial, testps$Award)
Confusion Matrix and Statistics

Reference
Prediction  0  1  2
0 35  0  0
1 46 77  0
2  0  0 77

Overall Statistics

Accuracy : 0.8043         
95% CI : (0.7477, 0.853)
No Information Rate : 0.3447         
P-Value [Acc > NIR] : < 2.2e-16      

Kappa : 0.7078         
Mcnemar's Test P-Value : NA             

Statistics by Class:

Class: 0 Class: 1 Class: 2
Sensitivity            0.4321   1.0000   1.0000
Specificity            1.0000   0.7089   1.0000
Pos Pred Value         1.0000   0.6260   1.0000
Neg Pred Value         0.7700   1.0000   1.0000
Prevalence             0.3447   0.3277   0.3277
Detection Rate         0.1489   0.3277   0.3277
Detection Prevalence   0.1489   0.5234   0.3277
Balanced Accuracy      0.7160   0.8544   1.0000