# The goal of this project is to create heatmaps and/or contour plots showing
# the probability of a strike being called in each location around the plate

rm(list = ls())

setwd("/Users/daniel/Desktop/R Practice")
getwd()


#install.packages("dplyr")
#install.packages("ggplot2")
#install.packages("mgcv")

require(dplyr)
require(ggplot2)
require(mgcv)


# Could later make it scrape data with BaseballR, for now use SC database
pitch <- read.csv("/Users/daniel/Desktop/R Practice/statcastall.csv")

# Try to do it with no smoothing/modeling first
# See if 2015, 2016, 2017 have enough pitches combined
#### Looks like it will be much easier to smooth it, I'll do that

pitch <- mutate(pitch, iscall = ifelse(description == "ball" | description == "called_strike", "call", "noncall"))
isocall <- filter(pitch, iscall == "call")
# Don't use counts w/ 2 strikes, umpires/hitters may have different habits w/ 2Ks
isocall <- filter(isocall, strikes <= 1)
# Could save this as a CSV w/
write.csv(isocall, "isocall.csv")

# Take only needed collumns
umpcall <- select(isocall, description, zone, type, pfx_x, pfx_z, sz_top, sz_bot)
write.csv(umpcall, "umpcall.csv")



#### Load umpcall data directly
umpcall <- read.csv("/Users/daniel/Desktop/R Practice/statcastall.csv")


# define the strike zone
topKzone <- 3.5
botKzone <- 1.6
inKzone <- -0.95
outKzone <- 0.95
kZone <- data.frame(
  x=c(inKzone, inKzone, outKzone, outKzone, inKzone),
  y=c(botKzone, topKzone, topKzone, botKzone, botKzone))


# implement the GAM fit (logistic link)
fit <- gam(type ~ s(pfx_x, pfx_z), family=binomial, data=umpcall)

# find predicted probabilities over a 50 x 50 grid
x <- seq(-1.5, 1.5, length.out=50)
y <- seq(0.5, 5, length.out=50)
data.predict <- data.frame(X = c(outer(x, y * 0 + 1)),
                           Z = c(outer(x * 0 + 1, y)))

call.predict <- predict(fit, umpcall)

umpcall$Probability <- exp(call.predict) / (1 + exp(call.predict))


ggplot(kZone, aes(x, y)) +
  geom_tile(data=umpcall, 
            aes(x=pfx_x, y=pfx_z, fill= Probability)) +
  scale_fill_distiller(palette = "Spectral") +
  geom_path(lwd=1.5, col="black") +
  coord_fixed()

