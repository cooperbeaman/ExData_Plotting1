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

## MAKES PLOT 3
with(dat0,{
        plot(Sub_metering_1~Datetime,type="l",
             ylab="Energy sub metering",xlab=NA)
        lines(Sub_metering_2~Datetime,col="Red")
        lines(Sub_metering_3~Datetime,col="Blue")
})

## ADDS LEGEND TO PLOT 3
legend("topright",col=c("black", "red", "blue"),lty=1,lwd=2,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## CONVERTS SCREEN PLOT 3 TO PNG
dev.copy(png,"plot3.png",width=480,height=480)
dev.off()
rm(list = ls())