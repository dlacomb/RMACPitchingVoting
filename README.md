# **RMAC Pitching Voting**

Analysis and Evaluation of Rocky Mountain Athletic Conference (RMAC) Baseball Coaches Voting on All-Conference Pitchers from 2008-2017. 

The purpose of this topic study is to discover if there are correlations between voting on all-conference pitchers with statistical metrics or is there enough evidence to prove that players are voted on due to a subjective judgment based on coaches who have evaluated a player’s statistical performance and immeasurable tangibles, such as character, attitude, effort, and/or competitiveness.  Within the analysis, all-conference winners will be decided based on statistical performance and will be analyzed against the winner of that year.

## **Data Collection**

<p align="center"> Pitching Stats Data

Information from 2008-2017 including 1,075 players, 30 features (3 categorical, 25 numerical, 2 target), and 1,090 missing values:

**Player:** Player's Last Name

**Position:** P = Pitcher

**Team:** ASU = Adams State University, CCU = Colorado Christian University, CMU = Colorado Mesa University, CSM = Colorado School of Mines, CSUP = Colorado State University Pueblo, MSUD = Metro State University Denver, NMHU = New Mexico Highlands University, RU = Regis University, UCCS = University Colorado Colorado Springs, UNK = University Nebraska Kearney

**Year:** 2008-2017

**ConfStanding:** Conference Standing - That player's team finish in the conference (1-9)

**era:** Earned Run Average 

**w:** Wins

**l:** Losses

**app:** Appearances

**gs:** Games Started

**cg:** Complete Games

**isho:** Individual Shutouts

**csho:** Combined Shutouts

**sv:** Saves 

**ip:** Innings Pitched

**h:** Hits

**r:** Runs

**er:** Earned Runs

**bb:** Walks

**so:** Strikeouts

**2b:** Doubles

**3b:** Triples

**hr:** Homeruns

**ab:** At Bats

**bavg:** Batting Average Against

**wp:** Wild Pitches

**hbp:** Hit Batters

**bk:** Balks

**1st Team:** Yes or No, Target Variable, Player wins 1st Team All Conference or not (51 winners, *Note: Some years there are ties)

**2nd Team:** Yes or No, Target Variable, Player wins 2nd Team All Conference or not (49 winners, *Note: Some years there are ties) 

## **Data Cleaning**

Majority of the data organizing was performed in Excel.  Data handling was dealt with in R.  I needed to handle missing data in order to have a full dataset.  The Pitching Stats Dataset had over 1,000 missing data entries which was fixed through knn imputation.  After knn imputation was performed, I transfered the new dataset into a csv that could be better managed in Excel.  After some data cleaning in Excel and condensing the target variables into one multiclassification problem, the dataset Pitching Stats Full Dataset was imported back into R.  

<p align="center"> Pitching Stats Full Dataset Data

Information from 2008-2017 including 1,075 players, 29 features (3 categorical, 25 numerical, 1 target), and 0 missing values:

**Player:** Player's Last Name

**Position:** P = Pitcher

**Team:** ASU = Adams State University, CCU = Colorado Christian University, CMU = Colorado Mesa University, CSM = Colorado School of Mines, CSUP = Colorado State University Pueblo, MSUD = Metro State University Denver, NMHU = New Mexico Highlands University, RU = Regis University, UCCS = University Colorado Colorado Springs, UNK = University Nebraska Kearney

**Year:** 2008-2017

**ConfStanding:** Conference Standing - That player's team finish in the conference (1-9)

**era:** Earned Run Average 

**w:** Wins

**l:** Losses

**app:** Appearances

**gs:** Games Started

**cg:** Complete Games

**isho:** Individual Shutouts

**csho:** Combined Shutouts

**sv:** Saves 

**ip:** Innings Pitched

**h:** Hits

**r:** Runs

**er:** Earned Runs

**bb:** Walks

**so:** Strikeouts

**2b:** Doubles

**3b:** Triples

**hr:** Homeruns

**ab:** At Bats

**bavg:** Batting Average Against

**wp:** Wild Pitches

**hbp:** Hit Batters

**bk:** Balks

**Award:** 0 = No Winner, 1 = 1st Team, 2 = 2nd Team: Target Variable (Frequency: 0 = 976 losers, 1 = 51 winners 2 = 49 winners, *Note: Some years there are ties)

## **Exploratory Data Analysis (EDA)**

I performed Exploratory Data Analysis Visualizations to see visual comparisons of statistics between 1st Team, 2nd Team, and No winners.  Below is a Visualization Comparison for each team.

![all 3](https://user-images.githubusercontent.com/36368488/39374953-dc11bc86-4a09-11e8-98d4-45158972c142.png)

Performance metrics such as Conference Standing, era, hits, runs, earned runs, and walks on average are lower for 1st Team All Conference winners because a lower value is better.  From viewing the large difference in bar height from 2nd Team All Conference to No winners, one can assume that the conference winners drastically pitched more on average compared to the losers.

Next, I used the corrplot package to visually see correlations between variables in the Pitching Stats Full Dataset. The first plot shows correlations based on size and darkness of the circle, and the second plot shows the correlation value between each variable.

![corplot](https://user-images.githubusercontent.com/36368488/38881150-a4480cb6-4224-11e8-9939-af29aa5175a8.png)

Visually, one can conclude there are correlations between games started, innings pitched, and hits compared with at bats faced.

![cor number](https://user-images.githubusercontent.com/36368488/39317813-c3acb432-4939-11e8-8aa2-a1028765f927.png)

Numerically, the two variables that show the highest correlation are runs and earned runs, and innings pitched and at bats, both with a 99% correlation.

## **Balancing Data**

In order to perform supervised learning maching learning algorithms on this multiclassification problem I first needed to balance the dataset through the use of the SMOTE Algorithm.  I performed the SMOTE function to oversample the dataset so I can get a 1/3 representation of each target value.  One of the main goals was to keep the dataset close in size, therefore I oversampled all of the classes to get 350 cases of 1st Team winners and 369 cases of 2nd Team winners.  I exported the new dataset into a csv file where I manipulated the majority class and removed the weakest players to have 350 cases of no winners.  After creating a balanced dataset in Excel, I imported the Pitching Stats Balanced Data back into R.

<p align="center"> Pitching Stats Balanced Data

Information from 2008-2017 including 1,069 players, 29 features (3 categorical, 25 numerical, 1 target), and 0 missing values:

**Player:** Player's Last Name

**Position:** P = Pitcher

**Team:** ASU = Adams State University, CCU = Colorado Christian University, CMU = Colorado Mesa University, CSM = Colorado School of Mines, CSUP = Colorado State University Pueblo, MSUD = Metro State University Denver, NMHU = New Mexico Highlands University, RU = Regis University, UCCS = University Colorado Colorado Springs, UNK = University Nebraska Kearney

**Year:** 2008-2017

**ConfStanding:** Conference Standing - That player's team finish in the conference (1-9)

**era:** Earned Run Average 

**w:** Wins

**l:** Losses

**app:** Appearances

**gs:** Games Started

**cg:** Complete Games

**isho:** Individual Shutouts

**csho:** Combined Shutouts

**sv:** Saves 

**ip:** Innings Pitched

**h:** Hits

**r:** Runs

**er:** Earned Runs

**bb:** Walks

**so:** Strikeouts

**double:** Doubles (The column name was changed due to spacing issues for model analysis)

**triple:** Triples (The column name was changed due to spacing issues for model analysis)

**hr:** Homeruns

**ab:** At Bats

**bavg:** Batting Average Against

**wp:** Wild Pitches

**hbp:** Hit Batters

**bk:** Balks

**Award:** 0 = No Winner, 1 = 1st Team, 2 = 2nd Team: Target Variable (Frequency: 0 = 350 losers, 1 = 350 winners 2 = 369 winners)

## **Model Analysis**

<p align="center"> Multiclassification Analysis

Random Forest: Accuracy = 98%

Variable Importance: 1.) Strikeouts 2.) Wins 3.) Earned Run Average 4.) At Bats 5.) Innings Pitched 6.) Batting Average Against 7.) Team 8.) Runs 9.) Hits 10.) Doubles 11.) Earned Runs 12.) Appearances 13.) Combined Shutouts 14.) Walks 15.) Conference Standing 16.) Games Started 17.) Saves 18.) Complete Games 19.) Hit Batters 20.) Losses 21.) Year 22.) Homeruns 23.) Wild Pitches 24.) Triples 25.) Balks 26.) Individual Shutouts 27.) Position

![var importance](https://user-images.githubusercontent.com/36368488/39150099-780cb334-46fe-11e8-8cb2-250381286289.png)

<p align="center"> Binomial Classification Analysis

KNN 

K = 5: Accuracy = 95%

K = 6: Accuracy = 96%

K = 7: Accuracy = 96%

K = 8: Accuracy = 95%

## **Conclusion/Interpretation of Results**

The original dataset of pitching statistics contained 975 losers, 50 2nd Team All Conference, and 50 1st Team All Conference.  This means that over a 10 year period 91% of the players do not win an award.  Therefore, with this information we must only take the models that perform an accuracy value over 91%.  For the multiclassification problem I performed a Random Forest, KNN, and SVM test on the balanced dataset.  Only the Random Forest model performed an accuracy rating over 91%.  The Random Forest model performed at a 98% accuracy rating for both the train and test set.  Also, it computed the variable importance of dictating who won an award or not.  The top 5 variables which dictate award winners are strikeouts, wins, earned run average, at bats, and innings pitched.  With this data I have done further exploratory data analysis to find players who were the top candidates each year based on these categories.  Below are the candidates.

<p align="center"> Comparison of Award Winners vs Statistical Winners for Each Year based on so, w, era, ab, and ip

![2008 and 2009](https://user-images.githubusercontent.com/36368488/39411897-d87f9d0a-4bcf-11e8-89b3-f16ce12972d6.png)

![2010 and 2011](https://user-images.githubusercontent.com/36368488/39411900-de71d124-4bcf-11e8-8065-e5dcdb28392b.png)

![2012 and 2013](https://user-images.githubusercontent.com/36368488/39411901-e17fd096-4bcf-11e8-939a-de3f4f32083f.png)

![2014 and 2015](https://user-images.githubusercontent.com/36368488/39411903-e4475006-4bcf-11e8-866f-8412b648afe8.png)

![2016 and 2017](https://user-images.githubusercontent.com/36368488/39411904-e7044254-4bcf-11e8-8674-3de32c7f6e12.png)

Candidates were calculated by taking the summary statistics of 1st Team All Conference winners and filtering a subset of pitchers who met the minimum mark of the 1st quartile values for wins, innings pitched, strikeouts, and at bats.  The pitchers must also hold an era lower than the 3rd quartile value of 1st Team All Conference winners. From this subset I was able to find a range of 0 to 4 candidates for 1st Team All Conference who did not win that award for that given year.  Above you will see the award winners based on Coach's Voting.  Next, for each statistic I ranked all the players who won awards along with the potential candidates.  After calculating their weighted score I ranked statistical on those five metrics the best pitchers in order.  As you can see above, the statistical winners differ from the coach's votes.  The overall combined coach's voting on purely statistical metrics was 63% accurate in voting the correct 1st and 2nd Team winners. 

Some important findings from this analysis show that being on a winning team is helpful and hurtful.  Also, relief pitchers are at a disadvantage in voting based on their statistics.  Over a 10 year period there were 3 statistical all conference winners who did not win an award, which one thing those pitchers shared in common was a low Conference Standing.  On the other hand, coaches may feel its immoral to vote for many pitchers from the best team.  In 2013, Colorado Mesa the best team in the Conference had 3 all conference winners, but statistically speaking they had 3 more players who should have competed for a 1st Team All Conference selection. Second, with an accuracy voting of 63% one can conclude that coach's must weigh in subjective judgment on immeasurable tangibles. For numerous years relief pitchers did not make the top 8 statistically because they did not have enough wins and innings pitched which affected strikeouts and at bats.  However, they did lead the conference most times in era.  

Putting all of this into consideration, it is important to conclude that pitchers who pitch the most and play on the best teams have the best chance to be considered for 1st Team All Conference.  More innings pitched allows for pitchers to face more batters that may end in strikeouts.  By playing on better teams with better defense and offense, pitchers are more likely to have a lower era and more wins. 

<p align="center"> Resources

SMOTE - https://www.r-bloggers.com/handling-class-imbalance-with-r-and-caret-an-introduction/ - https://www.rdocumentation.org/packages/DMwR/versions/0.4.1/topics/SMOTE - https://www.analyticsvidhya.com/blog/2016/03/practical-guide-deal-imbalanced-classification-problems/

Random Forest - https://www.r-bloggers.com/random-forests-in-r/

SVM - https://www.rdocumentation.org/packages/e1071/versions/1.6-8/topics/svm

KNN - https://www.analyticsvidhya.com/blog/2015/08/learning-concept-knn-algorithms-programming/

Corrplot - https://cran.r-project.org/web/packages/corrplot/vignettes/corrplot-intro.html
