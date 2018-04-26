**```RMAC Pitching Voting```**

Analysis and Evaluation of Rocky Mountain Athletic Conference (RMAC) Baseball Coaches Voting on All-Conference Pitchers from 2008-2017. 

The purpose of this topic study is to discover if there are correlations between voting on all-conference pitchers with statistical metrics or is there enough evidence to prove that players are voted on due to a subjective judgment based on coaches who have evaluated a player’s statistical performance and immeasurable tangibles, such as character, attitude, effort, and/or competitiveness.  Within the analysis, all-conference winners will be decided based on statistical performance and will be analyzed against the winner of that year.

**```Data Collection```**

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

**```Data Cleaning```**

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

**```Exploratory Data Analysis (EDA)```**

I performed Exploratory Data Analysis Visualizations to see visual comparisons of statistics between 1st Team, 2nd Team, and No winners.  Below is a Visualization Comparison for each team.

![all 3](https://user-images.githubusercontent.com/36368488/39085388-c1da1522-453e-11e8-8763-c5efb478c9fc.png)

Performance metrics such as Conference Standing, era, hits, runs, earned runs, and walks on average are lower for 1st Team All Conference winners because a lower value is better.  From viewing the large difference in bar height from 2nd Team All Conference to No winners, one can assume that the conference winners drastically pitched more on average compared to the losers.

Next, I used the corrplot package to visually see correlations between variables in the Pitching Stats Full Dataset. The first plot shows correlations based on size and darkness of the circle, and the second plot shows the correlation value between each variable.

![corplot](https://user-images.githubusercontent.com/36368488/38881150-a4480cb6-4224-11e8-9939-af29aa5175a8.png)

Visually, one can conclude there are correlations between games started, innings pitched, and hits compared with at bats faced.

![cor number](https://user-images.githubusercontent.com/36368488/39317813-c3acb432-4939-11e8-8aa2-a1028765f927.png)

Numerically, the two variables that show the highest correlation are runs and earned runs, and innings pitched and at bats, both with a 99% correlation.

**```Balancing Data```**

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

**```Model Analysis```**

**Multiclassification Analysis**

Random Forest: Accuracy = 98%

Variable Importance: 1.) Strikeouts 2.) Wins 3.) Earned Run Average 4.) At Bats 5.) Innings Pitched 6.) Batting Average Against 7.) Team 8.) Runs 9.) Hits 10.) Doubles 11.) Earned Runs 12.) Appearances 13.) Combined Shutouts 14.) Walks 15.) Conference Standing 16.) Games Started 17.) Saves 18.) Complete Games 19.) Hit Batters 20.) Losses 21.) Year 22.) Homeruns 23.) Wild Pitches 24.) Triples 25.) Balks 26.) Individual Shutouts 27.) Position

![var importance](https://user-images.githubusercontent.com/36368488/39150099-780cb334-46fe-11e8-8cb2-250381286289.png)

**Binomial Classification Analysis**

KNN 

K = 5: Accuracy = 95%

K = 6: Accuracy = 96%

K = 7: Accuracy = 96%

K = 8: Accuracy = 95%

**```Conclusion/Interpretation of Results```**

The original dataset of pitching statistics contained 975 losers, 50 2nd Team All Conference, and 50 1st Team All Conference.  This means that over a 10 year period 91% of the players do not win an award.  Therefore, with this information we must only take the models that perform an accuracy value over 91%.  For the multiclassification problem I performed a Random Forest, KNN, and SVM test on the balanced dataset.  Only the Random Forest model performed an accuracy rating over 91%.  The Random Forest model performed at a 98% accuracy rating for both the train and test set.  Also, it computed the variable importance of dictating who won an award or not.  The top 5 variables which dictate award winners are strikeouts, wins, earned run average, at bats, and innings pitched.  With this data I have done further exploratory data analysis to find players who were the top candidates each year based on these categories.  Below are the candidates.

1st Team All Conference Candidates who did not win 1st Team All Conference

2008: Kaiser CCU

2009: None

2010: Evins NMHU

2011: Perry MSUD, Metter UNK

2012: Harms RU, McElreath RU

2013: Danner CMU, Davis CMU, Snell CMU, Struble CSUP

2014: Davis CMU

2015: Soto CSUP

2016: Gotsis RU, Quackenbush RU, Allen CMU

2017: Ramirez CMU, Gotsis RU

2nd Team All Conference Candidates who did not win 2nd Team All Conference

2008: Kaiser CCU

2009: None

2010: Evins NMHU

2011: Perry MSUD, Metter UNK

2012: Harms RU, McElreath RU

2013: Danner CMU, Davis CMU, Snell CMU, Struble CSUP

2014: Davis CMU

2015: Soto CSUP

2016: Gotsis RU, Quackenbush RU, Allen CMU

2017: Ramirez CMU, Gotsis RU

