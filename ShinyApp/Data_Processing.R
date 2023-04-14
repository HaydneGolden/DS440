library(tidyr)
library("plyr")
library(readr)
cc <- read_csv("codes.csv")

names(cc)[1] ="LOCATION"
names(cc)[6] ="Y"
names(cc)[5] ="X"
names(cc)[3] ="LOCATIONCODE"


keep <- subset(cc, select = c("LOCATION", "X", "Y", "LOCATIONCODE"))
df_codes <- keep[-c(187,195,196,241,248),]
df_codes$X <- gsub("\"","",df_codes$X)
df_codes$Y <- gsub("\"","",df_codes$Y)
df_codes$LOCATIONCODE <- gsub("\"","",df_codes$LOCATIONCODE)

