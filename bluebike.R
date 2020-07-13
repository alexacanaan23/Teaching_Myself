#load the data
dat.bike<-read.csv("~/Desktop/202006-bluebikes-tripdata.csv")
View(dat.bike)

#format dates
library(lubridate)
#set strings to time
dat.bike$starttime<-ymd_hms(dat.bike$starttime)
dat.bike$stoptime<-ymd_hms(dat.bike$stoptime)
#get day
library(tidyverse)
dat.bike$day<-as_date(dat.bike$starttime)
summary(dat.bike$day)

datday<-data.frame(prop.table(table(dat.bike$day)))
names(datday)<-c("Day", "Frequency")
ggplot(data = datday, aes(x=Day, y = Frequency))+
  geom_bar(stat = "identity")+
  theme_bw()+
  xlab("Day")+
  ggtitle("Popular Bike Days")+
  geom_hline(yintercept = 0)

#add days of the week
dat.bike <- dat.bike %>%
  mutate(weekday = weekdays(day)) %>%
  mutate(typeofday = "Weekday")
#add weekday vs. weekend
dat.bike$typeofday <- as.factor(ifelse(dat.bike$weekday 
                                       %in% c("Saturday", "Sunday"), 
                                       "Weekend", "Weekday"))
datday<-data.frame(prop.table(table(dat.bike$day)))
names(datday)<-c("Day", "Frequency")
as.character(datday$Day)
datday$Weekday<-c('Weekday', 'Weekday', 'Weekday', 'Weekday', 'Weekday', 'Weekend', 'Weekend',
                  'Weekday', 'Weekday', 'Weekday', 'Weekday', 'Weekday', 'Weekend', 'Weekend',
                  'Weekday', 'Weekday', 'Weekday', 'Weekday', 'Weekday', 'Weekend', 'Weekend',
                  'Weekday', 'Weekday', 'Weekday', 'Weekday', 'Weekday', 'Weekend', 'Weekend',
                  'Weekday', 'Weekday')
datday$dow<-day(datday$Day)
ggplot(data = datday, aes(x=dow, y = Frequency, fill = Weekday))+
  geom_bar(stat = "identity")+
  theme_bw()+
  xlab("Day")+
  ggtitle("Popular Bike Days")+
  geom_hline(yintercept = 0)

#trip duration is in seconds
summary(dat.bike$tripduration)
dat.bike$tripduration<-as.numeric(dat.bike$tripduration)
library(ggplot2)
ggdat<-data.frame(dat.bike$tripduration)
names(ggdat)<-c("tripduration")
ggplot(data = ggdat, aes(x=tripduration)) +
  geom_density(aes(y=..density..))+
  theme_bw()+
  xlab("Trip Duration")+
  ggtitle("Trip Duration Spread")+
  geom_hline(yintercept = 0)

#fix range according to summary
ggdatextra<- filter(ggdat, tripduration >= 50000)
names(ggdatextra)<-c("tripduration")
ggplot(data = ggdatextra, aes(x=tripduration)) +
  geom_density(aes(y=..density..))+
  theme_bw()+
  xlab("Trip Duration")+
  ggtitle("Trip Duration Spread")+
  geom_hline(yintercept = 0)

ggdat1<-filter(ggdat, tripduration < 50000)
names(ggdat1)<-c("tripduration")
ggplot(data = ggdat1, aes(x=tripduration)) +
  geom_density(aes(y=..density..))+
  theme_bw()+
  xlab("Trip Duration")+
  ggtitle("Trip Duration Spread")+
  geom_hline(yintercept = 0)

ggdat2<-filter(ggdat, tripduration < 15000)
names(ggdat2)<-c("tripduration")
ggplot(data = ggdat2, aes(x=tripduration)) +
  geom_density(aes(y=..density..))+
  theme_bw()+
  xlab("Trip Duration")+
  ggtitle("Trip Duration Spread")+
  geom_hline(yintercept = 0)

ggdat3<-filter(ggdat, tripduration < 10000)
names(ggdat3)<-c("tripduration")
ggplot(data = ggdat3, aes(x=tripduration)) +
  geom_density(aes(y=..density..))+
  theme_bw()+
  xlab("Trip Duration")+
  ggtitle("Trip Duration Spread")+
  geom_hline(yintercept = 0)

ggdat4<-filter(ggdat, tripduration < 5000)
names(ggdat4)<-c("tripduration")
ggplot(data = ggdat4, aes(x=tripduration)) +
  geom_density(aes(y=..density..))+
  theme_bw()+
  xlab("Trip Duration")+
  ggtitle("Trip Duration Spread")+
  geom_hline(yintercept = 0)

#start station
dat.startstat<-data.frame(prop.table(table(dat.bike$start.station.name)))
names(dat.startstat)<-c("startstation", "Frequency")
ggplot(data = dat.startstat, aes(x=reorder(startstation, -Frequency), y=Frequency))+
  geom_bar(stat = "identity")+
  theme_bw()+
  xlab("Start Station")+
  ggtitle("Start Station Popularity")+
  geom_hline(yintercept = 0)

#end station
dat.endstat<-data.frame(prop.table(table(dat.bike$end.station.name)))
names(dat.endstat)<-c("endstation", "Frequency")
ggplot(data = dat.endstat, aes(x=reorder(endstation, -Frequency), y=Frequency))+
  geom_bar(stat = "identity")+
  theme_bw()+
  xlab("End Station")+
  ggtitle("End Station Popularity")+
  geom_hline(yintercept = 0)
