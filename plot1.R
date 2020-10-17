## DATA PREPARATION
setwd("C:/Users/Cooper/Documents/R/coursera/ExData_Plotting1")
## ASSUMES "household_power_consumption.txt" DOWNLOADED AND 
## UNZIPPED IN WORKING DIRECTORY
data<-read.csv("household_power_consumption.txt",header=T,sep=';',na.strings="?",
               nrows=2075259,check.names=F,stringsAsFactors=F,comment.char="",quote='\"')
dat0<-subset(data,Date%in%c("1/2/2007","2/2/2007"))
dat0$Date<-as.Date(data1$Date,format="%d/%m/%Y")

## MAKES PLOT 1
hist(dat0$Global_active_power,main="Global Active Power",
     xlab="Global Active Power (kilowatts)",ylab="Frequency",col="Red")

## CONVERTS SCREEN PLOT 1 TO PNG
dev.copy(png,"plot1.png",width=480,height=480)
dev.off()
rm(list = ls())