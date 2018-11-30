# Try it with scraping data from Baseball Savant

require(ggplot2)
require(dplyr)
require(mgcv)
#install.packages("devtools")
require(devtools)
#install_github("BillPetti/baseballr")
require(baseballr)

# Scrape 2 weeks of data

wk1 <- scrape_statcast_savant(start_date = "2017-03-03",
                                        end_date = "2017-04-04") %>% 
  filter(description == "ball" | description == "called_strike") %>%
  select(type, plate_x, plate_z, description)


wk2 <- scrape_statcast_savant(start_date = "2017-04-5",
                                        end_date = "2017-04-11") %>% 
  filter(description == "ball" | description == "called_strike") %>%
  select(type, plate_x, plate_z, description)

calldata <- rbind(wk1, wk2)


# define the strike zone
topKzone <- 3.5
botKzone <- 1.6
inKzone <- -0.95
outKzone <- 0.95
kZone <- data.frame(
  x=c(inKzone, inKzone, outKzone, outKzone, inKzone),
  y=c(botKzone, topKzone, topKzone, botKzone, botKzone)
)


# define the 1/0 response variable
####calldata <- mutate(calldata, sprob = ifelse(type == S), 1, 0)

calldata$type <- as.factor(calldata$type)

# implement the GAM fit (logistic link)
fit <- gam(type ~ s(plate_x, plate_z), family=binomial, data=calldata)

# find predicted probabilities over a 50 x 50 grid
x <- seq(-1.5, 1.5, length.out=50)
y <- seq(0.5, 5, length.out=50)
data.predict <- data.frame(plate_x = c(outer(x, y * 0 + 1)),
                           plate_z = c(outer(x * 0 + 1, y)))


lp <- predict(fit, data.predict)
data.predict$Probability <- exp(lp) / (1 + exp(lp))

# construct the plot
#### Plot 1
ggplot(kZone, aes(x, y)) +
  geom_tile(data=data.predict, 
            aes(x=plate_x, y=plate_z, fill= Probability)) +
  scale_fill_distiller(palette = "Spectral") +
  geom_path(lwd=1.5, col="black") +
  coord_fixed()

#### Plot 2 w/ 50% contour line and no kzone


#ggplot(kZone, aes(x, y)) +
#  geom_tile(data=data.predict, 
#            aes(x=plate_x, y=plate_z, fill= Probability)) + geom_contour(data=data.predict, aes(x=plate_x, y=plate_z, z=Probability, linetype = Probability >= .5)) +
#  coord_fixed()



#### Got it to work
ggplot(data.predict, aes(plate_x, plate_z)) +
  geom_tile(data=data.predict, 
            aes(x=plate_x, y=plate_z, fill= Probability)) + geom_contour(bins = 1, breaks = .5, color = "red", aes(z = Probability)) + scale_fill_distiller(palette = "Spectral") + coord_fixed()






