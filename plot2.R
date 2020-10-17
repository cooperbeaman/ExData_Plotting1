## DATA PREPARATION
setwd("C:/Users/Cooper/Documents/R/coursera/ExData_Plotting1")
## ASSUMES "household_power_consumption.txt" DOWNLOADED AND 
## UNZIPPED IN WORKING DIRECTORY
data<-read.csv("household_power_consumption.txt",header=T,sep=';',na.strings="?",
               nrows=2075259,check.names=F,stringsAsFactors=F,comment.char="",quote='\"')
dat0<-subset(data,Date%in%c("1/2/2007","2/2/2007"))
dat0$Date<-as.Date(data1$Date,format="%d/%m/%Y")
date_time<-paste(as.Date(dat0$Date),dat0$Time)
dat0$Datetime<-as.POSIXct(date_time)

## MAKES PLOT 2
with(dat0,{
        plot(Global_active_power~Datetime,type="l",
             ylab="Global Active Power (kilowatts)",xlab=NA)
})

## CONVERTS SCREEN PLOT 2 TO PNG
dev.copy(png,"plot2.png",width=480,height=480)
dev.off()
rm(list = ls())