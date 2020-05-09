#creating functions in R
MyMode <- function(myVector)
{
  return(myVector)
}

#load Excel .xlsx files
#install.packages("gdata")
libary(gdata)
read.xls()

#get results of a webpage
getURL()

#fromJSON
fromJSON()

#creatning maps using ggplot2
ggplot() + geom_map() + expand_limits() + coord_map()

#text mining package - tm package
#install.packages("tm")
library(tm)
words.vec<-VectorSource(sba)
words.corpus<-Corpus(words.vec)
tm_map

#create word clouds
wordcloud()

#association rules - arules package
#install.packages("arules")
library(arules)

#supporting vector machines in R
#install.packages("kernlab")
library(kernlab)

#creating web apps in R
#click Shiny Web Apps