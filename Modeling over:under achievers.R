setwd("~Desktop/R Practice")
getwd()

#install.packages("Lahman")
#install.packages("dplyr")
require(Lahman)
require(dplyr)

rm(list = ls())


bat <- Batting

bat <- filter(bat, yearID == 2016)
bat <- filter(bat, AB >= 100)

# Isolate names
names <- select(Master, playerID, nameFirst, nameLast)

# Merge statement
bat <- merge(names, bat, by = "playerID")

#### Calc runs accounted for metric
bat$raf <- (bat$R + bat$RBI)

cor(bat$raf, bat$HR)
cor(bat$raf, bat$SB)
cor(bat$raf, bat$AB)
cor(bat$raf, bat$X2B)
cor(bat$raf, bat$SF)
cor(bat$raf, bat$BB)

# Simple model
rafmod1 <- lm(raf ~ HR + AB + X2B, data=bat)
summary(rafmod1)

# Predict statement
bat$rafmod1 <- predict(rafmod1)

# Find over/under achievers
bat$rafdif <- (bat$raf - bat$rafmod1)

bat <- mutate(bat, rafstatus = ifelse(rafdif > 0, "Over", "Under"))

#### Predict Runs
# Check correlations

cor(bat$R, bat$HR)
cor(bat$R, bat$BB)
cor(bat$R, bat$H)
cor(bat$R, bat$X2B)
cor(bat$R, bat$SB)

rmod1 <- lm(R ~ H + HR + BB, data=bat)
summary(rmod1)


#### Predict RBIs
cor(bat$RBI, bat$HR)
cor(bat$RBI, bat$H)
cor(bat$RBI, bat$X2B)
cor(bat$RBI, bat$BB)
cor(bat$RBI, bat$SF)

rbimod1 <- lm(RBI ~ HR + H + X2B + SF, data=bat)
summary(rbimod1)


# Get expected totals for Rs, RBIs
bat$xR <- predict(rmod1)
bat$xRBI <- predict(rbimod1)

require(ggplot2)
ggplot(bat, aes(xR, xRBI, color = rafstatus))+geom_point()

ggplot(bat, aes(R, xR))+geom_point()
ggplot(bat, aes(RBI, xRBI))+geom_point()
ggplot(bat, aes(raf, rafmod1, color=rafstatus))+geom_point()
ggplot(bat, aes(raf, rafmod1, color=lgID))+geom_point()

#####################################################################
# Everything beyond here is just experimenting with factors like height and weight
# Not very important
#####################################################################

size <- select(Master, playerID, height, weight)
bat <- merge(bat, size, by = "playerID")


# Next step: merge team wins in w/ bat data and plot w vs over/under achievers
Teams <- Teams
Teams <- filter(Teams, yearID == 2016)
Teams$tR <- Teams$R

team <- select(Teams, teamID, Rank, W, DivWin, WCWin, LgWin, WSWin, tR)
bat <- merge(bat, team, by = "teamID")
bat <- mutate(bat, team = ifelse(W >= 81, "Good", "Bad"))
bat <- mutate(bat, rdif = (R - xR))
ggplot(bat, aes(raf, rafmod1, color=team))+geom_point()
ggplot(bat, aes(tR, rafdif, color="red"))+geom_point()
ggplot(bat, aes(tR, rafdif))+geom_smooth()+geom_point()
cor(bat$tR, bat$rafdif)


bat100 <- filter(bat, rafmod1 >= 100)
ggplot(bat, aes(tR, rafmod1))+geom_point()
cor(bat$rafdif, bat$rafmod1)

bat100 <- mutate(bat100, team = ifelse(tR <= 700, "Bad", ifelse(tR >= 800, "Good", "Avg")))
bat <- mutate(bat, team = ifelse(tR <= 700, "Bad", ifelse(tR >= 800, "Good", "Avg")))

# This might be a good graph
ggplot(bat100, aes(raf, rafmod1, color=team))+geom_smooth()
ggplot(bat, aes(raf, rafmod1, color=team))+geom_smooth()

# THis one also
ggplot(bat100, aes(raf, rafdif, color=team))+geom_smooth()
ggplot(bat, aes(raf, rafdif, color=team))+geom_point()

ggplot(bat, aes(team, rafdif, color=team))+geom_boxplot()


#trafdif <- lm(rafdif ~ raf + HR + AB, data=bat)
#bat$xrafdif <- predict(trafdif)
#ggplot(bat, aes(xrafdif, rafdif))+geom_point()
#cor(bat$xrafdif, bat$rafdif)
#summary(trafdif)

#sizerafdif <- lm(rafdif ~ height + weight, data=bat)
#bat$xsizerafdif <- predict(sizerafdif)
#summary(sizerafdif)
#cor(bat$HRPA, bat$raf)

#bat$PA <- (bat$AB + bat$BB + bat$HBP)
#bat$HRPA <- (bat$HR / bat$PA)
#rafmod2 <- lm(raf ~ HR + X2B + BB + H, data=bat)
#summary(rafmod2)
#bat$xraf <- predict(rafmod2)
#ggplot(bat, aes(rafmod1, xraf))+geom_point()
#cor(bat$rafmod1, bat$xraf)


# Make a linear model for 300+ ab players from 2010 - 16
require(Lahman)
bmodel <- Batting
bmodel <- filter(bmodel, yearID >= 2010)
bmodel <- filter(bmodel, AB >= 300)

bmodel$raf <- (bmodel$R + bmodel$RBI)
rafmod2 <- lm(raf ~ AB + HR + H, data=bmodel)
summary(rafmod2)

bmodel$xraf <- predict(rafmod2, bmodel)
bmodel$rafdif <- (bmodel$xraf - bmodel$raf)
bmodel$rafdifpct <- (bmodel$xraf / bmodel$raf)
bmodel$rafdifplus <- (bmodel$rafdifpct * 100)

bmodel16 <- filter(bmodel, yearID == 2016)

bmodel16$xraf <- predict(rafmod2, bmodel16)
bmodel16$rafdif <- (bmodel16$xraf - bmodel16$raf)
bmodel16$rafdifpct <- (bmodel16$xraf / bmodel16$raf)
bmodel16$rafdifplus <- (bmodel16$rafdifpct * 100)

teamfx <- lm(rafdifplus ~ teamID, data=bmodel16)
summary(teamfx)
