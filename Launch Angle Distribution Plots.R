# The goal of this is to create a plot showing launch an

# Install required packages
#install.packages("ggplot2")

setwd("/Users/daniel/Desktop/R Practice")
getwd()

require(ggplot2)
#install.packages("dplyr")
require(dplyr)
install.packages("devtools")
require(devtools)
install_github("BillPetti/baseballr")
require(baseballr)

# Need to find player's MLBAMID
# Example: JD Martinez
playerid_lookup("Martinez")
# It gives a huge table with every player for some reason, but his MLBAMID is 502110

# We want to scrape Christian Yelich's data from 2017 and 2018
playerid_lookup("Yelich")
# Yelich = 592885

# Scrape Yelich's data for 2017
# Discovered that unwanted columns can be removed in same command
# Manually looked up when Yelich's season's started/ended (Apr3/Oct1)
# There's probably a quicker way to do it
Yel171 <- scrape_statcast_savant_batter(start_date = "2017-04-03",
                            end_date = "2017-04-09", 
                            batterid = 592885) %>% 
                              filter(type == "X") %>%
                              select(55)


Yel172 <- scrape_statcast_savant_batter(start_date = "2017-04-10",
                                        end_date = "2017-04-16", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)



Yel173 <- scrape_statcast_savant_batter(start_date = "2017-04-17",
                                        end_date = "2017-04-23", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)



Yel174 <- scrape_statcast_savant_batter(start_date = "2017-04-24",
                                        end_date = "2017-04-30", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)



Yel175 <- scrape_statcast_savant_batter(start_date = "2017-05-01",
                                        end_date = "2017-05-07", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel176 <- scrape_statcast_savant_batter(start_date = "2017-05-08",
                                                end_date = "2017-05-14", 
                                                batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel177 <- scrape_statcast_savant_batter(start_date = "2017-05-15",
                                                end_date = "2017-05-21", 
                                                batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel178 <- scrape_statcast_savant_batter(start_date = "2017-05-22",
                                        end_date = "2017-05-28", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel179 <- scrape_statcast_savant_batter(start_date = "2017-05-29",
                                        end_date = "2017-06-03", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1710 <- scrape_statcast_savant_batter(start_date = "2017-06-04",
                                        end_date = "2017-06-10", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1711 <- scrape_statcast_savant_batter(start_date = "2017-06-11",
                                        end_date = "2017-06-17", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1712 <- scrape_statcast_savant_batter(start_date = "2017-06-18",
                                        end_date = "2017-06-24", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1713 <- scrape_statcast_savant_batter(start_date = "2017-06-25",
                                         end_date = "2017-06-30", 
                                         batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1714 <- scrape_statcast_savant_batter(start_date = "2017-07-01",
                                        end_date = "2017-07-07", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1715 <- scrape_statcast_savant_batter(start_date = "2017-07-08",
                                        end_date = "2017-07-14", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1716 <- scrape_statcast_savant_batter(start_date = "2017-07-15",
                                        end_date = "2017-07-21", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1717 <- scrape_statcast_savant_batter(start_date = "2017-07-22",
                                        end_date = "2017-07-28", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)

Yel1718 <- scrape_statcast_savant_batter(start_date = "2017-07-29",
                                        end_date = "2017-08-03", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)

Yel1719 <- scrape_statcast_savant_batter(start_date = "2017-08-04",
                                        end_date = "2017-08-10", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)

Yel1720 <- scrape_statcast_savant_batter(start_date = "2017-08-11",
                                        end_date = "2017-08-17", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)

Yel1721 <- scrape_statcast_savant_batter(start_date = "2017-08-18",
                                        end_date = "2017-08-24", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)

Yel1722 <- scrape_statcast_savant_batter(start_date = "2017-08-25",
                                        end_date = "2017-08-31", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)

Yel1723 <- scrape_statcast_savant_batter(start_date = "2017-09-01",
                                        end_date = "2017-09-07", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)

Yel1724 <- scrape_statcast_savant_batter(start_date = "2017-09-08",
                                        end_date = "2017-09-14", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1725 <- scrape_statcast_savant_batter(start_date = "2017-09-15",
                                        end_date = "2017-09-21", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1726 <- scrape_statcast_savant_batter(start_date = "2017-09-22",
                                        end_date = "2017-09-28", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1727 <- scrape_statcast_savant_batter(start_date = "2017-09-29",
                                         end_date = "2017-10-01", 
                                         batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)

# Combine them all
Yelich17 <- rbind(Yel171, Yel172, Yel173, Yel174, Yel175, Yel176, Yel177, Yel178,
                  Yel179, Yel1710, Yel1711, Yel1712, Yel1713, Yel1714, Yel1715, 
                  Yel1716, Yel1717, Yel1718, Yel1719, Yel1720, Yel1721, Yel1722, 
                  Yel1723, Yel1724, Yel1725, Yel1726, Yel1727)
#################################################################################

# Scrape 2018 Data
Yel181 <- scrape_statcast_savant_batter(start_date = "2018-03-29",
                                        end_date = "2018-04-02", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel182 <- scrape_statcast_savant_batter(start_date = "2018-04-03",
                                        end_date = "2018-04-09", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel183 <- scrape_statcast_savant_batter(start_date = "2018-04-10",
                                        end_date = "2018-04-16", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)



Yel184 <- scrape_statcast_savant_batter(start_date = "2018-04-17",
                                        end_date = "2018-04-23", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)



Yel185 <- scrape_statcast_savant_batter(start_date = "2018-04-24",
                                        end_date = "2018-04-30", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)



Yel186 <- scrape_statcast_savant_batter(start_date = "2018-05-01",
                                        end_date = "2018-05-07", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel187 <- scrape_statcast_savant_batter(start_date = "2018-05-08",
                                        end_date = "2018-05-14", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel188 <- scrape_statcast_savant_batter(start_date = "2018-05-15",
                                        end_date = "2018-05-21", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel189 <- scrape_statcast_savant_batter(start_date = "2018-05-22",
                                        end_date = "2018-05-28", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1810 <- scrape_statcast_savant_batter(start_date = "2018-05-29",
                                        end_date = "2018-06-03", 
                                        batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1811 <- scrape_statcast_savant_batter(start_date = "2018-06-04",
                                         end_date = "2018-06-10", 
                                         batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1812 <- scrape_statcast_savant_batter(start_date = "2018-06-11",
                                         end_date = "2018-06-17", 
                                         batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1813 <- scrape_statcast_savant_batter(start_date = "2018-06-18",
                                         end_date = "2018-06-24", 
                                         batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1814 <- scrape_statcast_savant_batter(start_date = "2018-06-25",
                                         end_date = "2018-06-30", 
                                         batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1815 <- scrape_statcast_savant_batter(start_date = "2018-07-01",
                                         end_date = "2018-07-07", 
                                         batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1816 <- scrape_statcast_savant_batter(start_date = "2018-07-08",
                                         end_date = "2018-07-14", 
                                         batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1817 <- scrape_statcast_savant_batter(start_date = "2018-07-15",
                                         end_date = "2018-07-21", 
                                         batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1818 <- scrape_statcast_savant_batter(start_date = "2018-07-22",
                                         end_date = "2018-07-28", 
                                         batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)

Yel1819 <- scrape_statcast_savant_batter(start_date = "2018-07-29",
                                         end_date = "2018-08-03", 
                                         batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)

Yel1820 <- scrape_statcast_savant_batter(start_date = "2018-08-04",
                                         end_date = "2018-08-10", 
                                         batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)

Yel1821 <- scrape_statcast_savant_batter(start_date = "2018-08-11",
                                         end_date = "2018-08-17", 
                                         batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)

Yel1822 <- scrape_statcast_savant_batter(start_date = "2018-08-18",
                                         end_date = "2018-08-24", 
                                         batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)

Yel1823 <- scrape_statcast_savant_batter(start_date = "2018-08-25",
                                         end_date = "2018-08-31", 
                                         batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)

Yel1824 <- scrape_statcast_savant_batter(start_date = "2018-09-01",
                                         end_date = "2018-09-07", 
                                         batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)

Yel1825 <- scrape_statcast_savant_batter(start_date = "2018-09-08",
                                         end_date = "2018-09-14", 
                                         batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1826 <- scrape_statcast_savant_batter(start_date = "2018-09-15",
                                         end_date = "2018-09-21", 
                                         batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1827 <- scrape_statcast_savant_batter(start_date = "2018-09-22",
                                         end_date = "2018-09-28", 
                                         batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


Yel1828 <- scrape_statcast_savant_batter(start_date = "2018-09-29",
                                         end_date = "2018-10-01", 
                                         batterid = 592885) %>% 
  filter(type == "X") %>%
  select(55)


# Combine them all
Yelich18 <- rbind(Yel181, Yel182, Yel183, Yel184, Yel185, Yel186, Yel187,
                  Yel188, Yel189, Yel1810, Yel1811, Yel1812, Yel1813, Yel1814,
                  Yel1815, Yel1816, Yel1817, Yel1818, Yel1819, Yel1820, Yel1821,
                  Yel1822, Yel1823, Yel1824, Yel1825, Yel1826, Yel1827, Yel1828)
###############################################################################

# Add percentiles and years
Yelich17 <- mutate(Yelich17, Rank = percent_rank(Yelich17$launch_angle))
# Add year
Yelich17 <- mutate(Yelich17, Year = 2017)

# 2018
Yelich18 <- mutate(Yelich18, Rank = percent_rank(Yelich18$launch_angle))
# Add year
Yelich18 <- mutate(Yelich18, Year = 2018)


# Create dataset with Yelich numbers from both 2017 and 2018

Yelich <- rbind(Yelich17, Yelich18)
###############################################################################

# Make Year a factor
Yelich$Year <- as.factor(Yelich$Year)

# Plot
ggplot(Yelich, aes(Rank, launch_angle))+geom_point()

# W/ color
ggplot(Yelich, aes(Rank, launch_angle, color = Year))+geom_point()
ggplot(Yelich, aes(Rank, launch_angle, color = Year))+geom_smooth()


# Zoom in on middle to get a better picture
Yel50 <- filter(Yelich, Rank >= .35)
Yel50 <- filter(Yel50, Rank <= .85)

# Middle 60%
Yel60 <- filter(Yelich, Rank >= .2)
Yel60 <- filter(Yel60, Rank <= .8)

# Plot it
ggplot(Yel50, aes(Rank, launch_angle, color=Year))+geom_point()
ggplot(Yel50, aes(Rank, launch_angle, color=Year))+geom_smooth()
# W lines showing great LA
#### This plot shows that even w/ same avg launch angle
#### Yelich had higher % of balls in play at ideal LAs
ggplot(Yel50, aes(Rank, launch_angle, color=Year))+geom_point()+geom_hline(aes(yintercept=8),col="red")+geom_hline(aes(yintercept=24),col="red")


