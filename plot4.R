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

## MAKES PLOT 4

## SPECIFIES GLOBAL GRAPHICS PARAMETERS
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))

## RECONSTRUCTS PLOTS 2-3 AND MAKES TWO NEW PLOTS
with(dat0,{
        ## RECONSTRUCTS PLOT 2 IN UPPER LEFT
        plot(Global_active_power~Datetime,type="l",
             ylab="Global Active Power",xlab=NA)
        ## CONSTRUCTS NEW PLOT 1 IN UPPER RIGHT
        plot(Voltage~Datetime,type="l", 
             ylab="Voltage",xlab="datetime")
        ## RECONSTRUCTS PLOT 3 IN LOWER LEFT
        plot(Sub_metering_1~Datetime,type="l",
             ylab="Energy sub metering",xlab=NA)
        lines(Sub_metering_2~Datetime,col="Red")
        lines(Sub_metering_3~Datetime,col="Blue")
        legend("topright",col=c("black", "red", "blue"),lty=1,lwd=2,cex=0.6,
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        ## CONSTRUCTS NEW PLOT 2 IN LOWER RIGHT
        plot(Global_reactive_power~Datetime,type="l", 
             ylab="Global_reactive_power",xlab="datetime")
})

## CONVERTS SCREEN PLOT 4 TO PNG
dev.copy(png,"plot4.png",width=480,height=480)
dev.off()
rm(list = ls())