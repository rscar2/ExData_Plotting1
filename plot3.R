# This script produces the third plot in Assignment 1 of the Exploratory Data Analysis
# course from Coursera.  

# read file 

power<-read.table("household_power_consumption.txt", header=T, sep=";")

# separate out only February dates

power2<- power[(as.Date(power$Date, '%d/%m/%Y')=="2007-02-01"| as.Date(power$Date, '%d/%m/%Y')=="2007-02-02"),]

# Plot Energy Sub Metering over time

x<-strptime(paste(power2$Date, power2$Time), "%d/%m/%Y %H:%M")
y1<-as.numeric(as.character(power2$Sub_metering_1))
y2<-as.numeric(as.character(power2$Sub_metering_2))
y3<-power2$Sub_metering_3

png(file="plot3.png",width = 480, height = 480)

plot(x,y1, xlab="", ylab="Energy sub metering", type="l")
points(x,y2, col="red",type="l")
points(x,y3, col="blue",type="l")
legend("topright", pch="____", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

# close device

dev.off()
