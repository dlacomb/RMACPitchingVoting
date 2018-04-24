###Pitching Stats R Script
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
> 
  > ###Import Pitching Stats full dataset
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
> 