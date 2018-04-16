```**RMAC Pitching Voting**```

Analysis and Evaluation of Rocky Mountain Athletic Conference (RMAC) Baseball Coaches Voting on All-Conference Pitchers from 2008-2017. 

The purpose of this topic study is to discover if there are correlations between voting on all-conference pitchers with statistical metrics or is there enough evidence to prove that players are voted on due to a subjective judgment based on coaches who have evaluated a player’s statistical performance and immeasurable tangibles, such as character, attitude, effort, and/or competitiveness.  Within the analysis, all-conference winners will be decided based on statistical performance and will be analyzed against the winner of that year.

**Data Collection**

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

**Data Cleaning**

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

**Exploratory Data Analysis (EDA)**

I performed Exploratory Data Analysis Visualizations to see visual comparisons of statistics between 1st Team, 2nd Team, and No winners.  Below is a Visualization Comparison for each set of comparison.

**Balancing Data**

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

**Model Analysis**
