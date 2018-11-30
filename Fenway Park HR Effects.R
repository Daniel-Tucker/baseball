rm(list = ls())

setwd("/Users/daniel/Desktop/R Practice")
getwd()

# Required packages
require(ggplot2)
require(dplyr)
require(mgcv)
#install.packages("devtools")
require(devtools)
#install_github("BillPetti/baseballr")
require(baseballr)

##############################################################################
##############################################################################
##############################################################################

#### Scrape data from 2015-2018
# April 3rd - October 1st

# Scrape 2018 Data

MLB181 <- scrape_statcast_savant(start_date = "2018-04-01",
                                 end_date = "2018-04-02") %>%
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110)  %>%
  select(9, 20, 38, 39, 53:55)


MLB182 <- scrape_statcast_savant(start_date = "2018-04-03",
                                 end_date = "2018-04-09") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)


MLB183 <- scrape_statcast_savant(start_date = "2018-04-10",
                                 end_date = "2018-04-16") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)



MLB184 <- scrape_statcast_savant(start_date = "2018-04-17",
                                 end_date = "2018-04-23") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)



MLB185 <- scrape_statcast_savant(start_date = "2018-04-24",
                                 end_date = "2018-04-30") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)



MLB186 <- scrape_statcast_savant(start_date = "2018-05-01",
                                 end_date = "2018-05-07") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)


MLB187 <- scrape_statcast_savant(start_date = "2018-05-08",
                                 end_date = "2018-05-14") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)


MLB188 <- scrape_statcast_savant(start_date = "2018-05-15",
                                 end_date = "2018-05-21") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)


MLB189 <- scrape_statcast_savant(start_date = "2018-05-22",
                                 end_date = "2018-05-28") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)


MLB1810 <- scrape_statcast_savant(start_date = "2018-05-29",
                                  end_date = "2018-06-03") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)


MLB1811 <- scrape_statcast_savant(start_date = "2018-06-04",
                                  end_date = "2018-06-10") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)


MLB1812 <- scrape_statcast_savant(start_date = "2018-06-11",
                                  end_date = "2018-06-17") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)


MLB1813 <- scrape_statcast_savant(start_date = "2018-06-18",
                                  end_date = "2018-06-24") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)


MLB1814 <- scrape_statcast_savant(start_date = "2018-06-25",
                                  end_date = "2018-06-30") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)


MLB1815 <- scrape_statcast_savant(start_date = "2018-07-01",
                                  end_date = "2018-07-07") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)


MLB1816 <- scrape_statcast_savant(start_date = "2018-07-08",
                                  end_date = "2018-07-14") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)


MLB1817 <- scrape_statcast_savant(start_date = "2018-07-15",
                                  end_date = "2018-07-21") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)


MLB1818 <- scrape_statcast_savant(start_date = "2018-07-22",
                                  end_date = "2018-07-28") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)

MLB1819 <- scrape_statcast_savant(start_date = "2018-07-29",
                                  end_date = "2018-08-03") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)

MLB1820 <- scrape_statcast_savant(start_date = "2018-08-04",
                                  end_date = "2018-08-10") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)

MLB1821 <- scrape_statcast_savant(start_date = "2018-08-11",
                                  end_date = "2018-08-17") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)

MLB1822 <- scrape_statcast_savant(start_date = "2018-08-18",
                                  end_date = "2018-08-24") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)

MLB1823 <- scrape_statcast_savant(start_date = "2018-08-25",
                                  end_date = "2018-08-31") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)

MLB1824 <- scrape_statcast_savant(start_date = "2018-09-01",
                                  end_date = "2018-09-07") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)

MLB1825 <- scrape_statcast_savant(start_date = "2018-09-08",
                                  end_date = "2018-09-14") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)


MLB1826 <- scrape_statcast_savant(start_date = "2018-09-15",
                                  end_date = "2018-09-21") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)


MLB1827 <- scrape_statcast_savant(start_date = "2018-09-22",
                                  end_date = "2018-09-28") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)


MLB1828 <- scrape_statcast_savant(start_date = "2018-09-29",
                                  end_date = "2018-09-30") %>% 
  filter(type == "X") %>% filter(launch_angle >= 15) %>% filter(launch_angle <= 45) %>% filter(launch_speed >= 90) %>% filter(launch_speed <= 110) %>%
  select(9, 20, 38, 39, 53:55)

###############################################################################

# Combine them all
MLB <- rbind(MLB181, MLB182, MLB183, MLB184, MLB185, MLB186, MLB187,
               MLB188, MLB189, MLB1810, MLB1811, MLB1812, MLB1813, MLB1814,
               MLB1815, MLB1816, MLB1817, MLB1818, MLB1819, MLB1820, MLB1821,
               MLB1822, MLB1823, MLB1824, MLB1825, MLB1826, MLB1827, MLB1828)



# OLD (15-18) MLB - dataset of batted balls 90-110 MPH at LA of 15-45
# 96,795 pitches

# MLB dataset has 24,979 obs

# Eliminate Coors/Chase
MLB <- filter(MLB, home_team != "COL")
# 24166
MLB <- filter(MLB, home_team != "ARI")
#23315

# Need > 110 MPH batted balls for later, eliminate them for now
#MLB <- filter(MLB, launch_speed <= 110)

MLB <- mutate(MLB, isHR = ifelse(events == "home_run", 1, 0))

HRmod <- gam(isHR ~ s(launch_speed, launch_angle), family=binomial, data=MLB)

x <- seq(95, 110, length.out=50)
y <- seq(15, 45, length.out=50)
HR.predict <- data.frame(launch_speed = c(outer(x, y * 0 + 1)),
                           launch_angle = c(outer(x * 0 + 1, y)))

lp <- predict(HRmod, HR.predict)
HR.predict$HRChance <- exp(lp) / (1 + exp(lp))


ggplot(HR.predict, aes(launch_speed, launch_angle, color=HRChance)) + geom_point()



ggplot(HR.predict, aes(x, y)) +
  geom_tile(data=HR.predict, 
            aes(x=launch_speed, y=launch_angle, fill= HRChance)) +
  scale_fill_distiller(palette = "Spectral")

ggplot(HR.predict, aes(x, y)) +
  geom_tile(data=HR.predict, 
            aes(x=launch_speed, y=launch_angle, fill= HRChance)) +
  scale_fill_distiller(palette = "Spectral") + geom_raster(aes(x=launch_speed, y=launch_angle, fill = HRChance), hjust=0.5, vjust=0.5, interpolate=TRUE)


#### Build Fenway Model

Fenway <- filter(MLB, home_team == "BOS")

FenwayHRmod <- gam(isHR ~ s(launch_speed, launch_angle), family=binomial, data=Fenway)

Fenway.predict <- data.frame(launch_speed = c(outer(x, y * 0 + 1)),
                         launch_angle = c(outer(x * 0 + 1, y)))

Fenwaylp <- predict(FenwayHRmod, Fenway.predict)
Fenway.predict$HRChance <- exp(Fenwaylp) / (1 + exp(Fenwaylp))


# Plot Fenway

ggplot(Fenway.predict, aes(x, y)) +
  geom_tile(data=Fenway.predict, 
            aes(x=launch_speed, y=launch_angle, fill= HRChance)) +
  scale_fill_distiller(palette = "Spectral")

ggplot(Fenway.predict, aes(x, y)) +
  geom_tile(data=Fenway.predict, 
            aes(x=launch_speed, y=launch_angle, fill= HRChance)) +
  scale_fill_distiller(palette = "Spectral") + geom_raster(aes(x=launch_speed, y=launch_angle, fill = HRChance), hjust=0.5, vjust=0.5, interpolate=TRUE)


#### Attempt to make a plot showing differences

HR.predict$FenwayChance <- exp(Fenwaylp) / (1 + exp(Fenwaylp))
HR.predict$FenwayEffect <- (HR.predict$FenwayChance - HR.predict$HRChance)
# Positive = higher chance at Fenway, negative = lower chance at Fenway


# Plot differences - SEE NOTE BELOW

ggplot(HR.predict, aes(x, y)) +
  geom_tile(data=HR.predict, 
            aes(x=launch_speed, y=launch_angle, fill= FenwayEffect)) +
  scale_fill_distiller(palette = "Spectral")

# NOTE: smoothing with geom_raster does NOT work on this data.  Creates very misleading heatmap.


##############################
# Create Spray Angle X Launch Angle HR prob chart

# Need to create new model using spray angle/launch angle on whatever ev range
# Also need to re-scrape data (only once, not when code is re-run)

# Get MLB data unedited
MLB2 <- rbind(MLB181, MLB182, MLB183, MLB184, MLB185, MLB186, MLB187,
             MLB188, MLB189, MLB1810, MLB1811, MLB1812, MLB1813, MLB1814,
             MLB1815, MLB1816, MLB1817, MLB1818, MLB1819, MLB1820, MLB1821,
             MLB1822, MLB1823, MLB1824, MLB1825, MLB1826, MLB1827, MLB1828)

# Remove Coors/Chase?  I will for now, maybe not in future?
MLB2 <- filter(MLB, home_team != "COL")
MLB2 <- filter(MLB, home_team != "ARI")

# Consider playing around w/ EV/LA range in future
# 813 batted balls added from last dataset (hit over 110 MPH)

MLB2 <- mutate(MLB2, isHR = ifelse(events == "home_run", 1, 0))

# Calulate Spray Angle
MLB2$spray_angle <- with(MLB2, round((atan((hc_x-125.42)/(198.27-hc_y))*180/pi),1))

# Keep all batted balls in model, none are actually >45/<-45, but I think removing
# them would skew it?
# I'll keep 50 => -50 for now

# Try only looking at 100 MPH+
#MLB3 <- MLB2
#### Choose what EV range to use:

# >= 100
MLB2 <- filter(MLB3, launch_speed >= 100)
#MLB2 <- MLB3
# >= 95 (considered "hard hit" by MLBAM)

# Using 100+ gets rid of 14,568 batted balls, but I think I still have plenty
# May be a problem for single stadiums, ex. Fenway has only 398 for 2018

Anglemod <- gam(isHR ~ s(spray_angle, launch_angle), family=binomial, data=MLB2)

x2 <- seq(-50, 50, length.out=50)
y2 <- seq(15, 45, length.out=50)
SprayHR.predict <- data.frame(spray_angle = c(outer(x2, y2 * 0 + 1)),
                         launch_angle = c(outer(x2 * 0 + 1, y2)))

HRlp2 <- predict(Anglemod, SprayHR.predict)
SprayHR.predict$HRChance <- exp(HRlp2) / (1 + exp(HRlp2))

# Plot 28 MLB stadiums (excluding Coors/Chase) together

ggplot(SprayHR.predict, aes(x, y)) +
  geom_tile(data=SprayHR.predict, 
            aes(x=spray_angle, y=launch_angle, fill= HRChance)) +
  scale_fill_distiller(palette = "Spectral")

# Model and plot only Fenway
Fenway2 <- filter(MLB2, home_team == "BOS")

FenwayAnglemod <- gam(isHR ~ s(spray_angle, launch_angle), family=binomial, data=Fenway2)

x2 <- seq(-50, 50, length.out=50)
y2 <- seq(15, 45, length.out=50)
FenwaySprayHR.predict <- data.frame(spray_angle = c(outer(x2, y2 * 0 + 1)),
                              launch_angle = c(outer(x2 * 0 + 1, y2)))

FHRlp2 <- predict(FenwayAnglemod, FenwaySprayHR.predict)
FenwaySprayHR.predict$HRChance <- exp(FHRlp2) / (1 + exp(FHRlp2))

ggplot(FenwaySprayHR.predict, aes(x, y)) +
  geom_tile(data=FenwaySprayHR.predict, 
            aes(x=spray_angle, y=launch_angle, fill= HRChance)) +
  scale_fill_distiller(palette = "Spectral")

# Plot Fenway vs. All

SprayHR.predict$FenwayChance <- FenwaySprayHR.predict$HRChance
SprayHR.predict$FenwayEffect <- (SprayHR.predict$FenwayChance - SprayHR.predict$HRChance)

ggplot(SprayHR.predict, aes(Spray_Angle, Launch_Angle)) +
  geom_tile(data=SprayHR.predict, 
            aes(x=spray_angle, y=launch_angle, fill= FenwayEffect)) +
  scale_fill_distiller(palette = "Spectral")


# Yankees Stadium?
# Fenway vs. YS?


# Other ideas to try:
# Heatmap of ev/la to only balls hit to left half, left third, or at Green Monster (by spray angle)




ggplot(Fenway2, aes(hc_x, hc_y, color = isHR))+geom_point()



# Could find xFBHR at Fenway or overall by finding frequency of each EV/LA combo
# Could even do this for individual hitters
# Could use this to quanitfy luck for pitchers beyond just HRFB ratio


