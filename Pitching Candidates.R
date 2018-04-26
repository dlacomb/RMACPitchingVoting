> ###Random Forest top 5 variables based on importance: strikeouts, wins, earned run average, at bats, and innings pitched
  > ###Find players who have same minimum amount of strikeouts, wins, earned run average, at bats, and innings pitched as award winners
  > Pitching_Stats_Full_Dataset <- read_csv("E:/Grad School/Practicum 2/Pitching Stats Full Dataset.csv", 
                                            + col_types = cols(`2b ` = col_number(), 
                                                               +  `3b ` = col_number(), Award = col_number(), 
                                                               + ConfStanding = col_number(), Year = col_number(), 
                                                               +  `ab ` = col_number(), app = col_number(), 
                                                               + `bavg ` = col_number(), `bb ` = col_number(), 
                                                               +  `bk ` = col_number(), `cg ` = col_number(), 
                                                               +  csho = col_number(), `er ` = col_number(), 
                                                               +  `era ` = col_number(), `gs ` = col_number(), 
                                                               +  `h ` = col_number(), `hbp ` = col_number(), 
                                                               +  `hr ` = col_number(), `ip ` = col_number(), 
                                                               +  `isho ` = col_number(), `l ` = col_number(), 
                                                               +  `r ` = col_number(), `so ` = col_number(), 
                                                               + `sv ` = col_number(), w = col_number(), 
                                                               + `wp ` = col_number()), locale = locale(encoding = "ASCII"))
  > psfd <- Pitching_Stats_Full_Dataset
  > library(dplyr)
  > first <- filter(psfd, psfd$Award == 1)
  > second <- filter(psfd, psfd$Award == 2)
  > noteam <- filter(psfd, psfd$Award == 0)
  > summary(psfd)
  > psfd$Award <- as.factor(psfd$Award)
  > summary(first)
  > ###Stat Requirements needed for 1st Team: strikeouts >= 45, wins >= 6, earned run average <= 4.287, at bats >= 228, innings pitched >= 60.83
    > firstteamcandidates <- filter(psfd, psfd$Award == 0 | psfd$Award == 2)
  > ftc_stats <- filter(firstteamcandidates, firstteamcandidates$`so ` >= 45 &  firstteamcandidates$w >= 6 & firstteamcandidates$`era ` <= 4.287 & firstteamcandidates$`ab ` >= 228 & firstteamcandidates$`ip ` >= 60.83)
  > View(ftc_stats)
  > write.csv(ftc_stats, "First Team Candidates.csv")