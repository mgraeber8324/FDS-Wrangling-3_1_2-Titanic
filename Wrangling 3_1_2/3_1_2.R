#FDS Wrangling 3_1_2 Titanic

library(tidyr)
library(dplyr)

#Load data into R
titanic_original <- read.csv("~/FDS/Wrangling 3_1_2/titanic_original.csv")

#inspect data (commented out for submission)
#View(titanic_original)
#ls.str(titanic_original)

#discovered last row is garbage, remove it
titanic_original <- titanic_original[-nrow(titanic_original),]

#fill in blank EMBARK values with S
titanic_original$embarked[titanic_original$embarked==""] <- "S"

#fill in missing AGE values
titanic_original$age[is.na(titanic_original$age)] <- mean(titanic_original$age, na.rm = TRUE)
#could subset the data by sex or fare and use subset means for age. seems to be a trivial difference

#fill missing BOAT values with NA
titanic_original$boat[titanic_original$boat==""] <- "NA"

#new binary column indicating has a cabin
titanic_original$has_cabin_number <- ifelse(titanic_original$cabin=="",0,1)

write.csv(titanic_original,file="~/FDS/Wrangling 3_1_2/titanic_clean.csv")