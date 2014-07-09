# This script produces the fourth plot in Assignment 1 of the Exploratory Data Analysis
# course from Coursera.  

# read file 

power<-read.table("household_power_consumption.txt", header=T, sep=";")

# separate out only February dates

power2<- power[(as.Date(power$Date, '%d/%m/%Y')=="2007-02-01"| as.Date(power$Date, '%d/%m/%Y')=="2007-02-02"),]

x<-strptime(paste(power2$Date, power2$Time), "%d/%m/%Y %H:%M")

png(file="plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))

# Plot Global Active Power over time
y4<-as.numeric(as.character(power2$Global_active_power))
plot(x,y4, xlab="", ylab="Global Active Power", type="l")

# Plot Voltage over time
y5<-as.numeric(as.character(power2$Voltage))
plot(x,y5, type="l", xlab="datetime",ylab="Voltage")

# Plot Energy Sub Metering over time
y1<-as.numeric(as.character(power2$Sub_metering_1))
y2<-as.numeric(as.character(power2$Sub_metering_2))
y3<-power2$Sub_metering_3
plot(x,y1, xlab="", ylab="Energy sub metering", type="l")
points(x,y2, col="red",type="l")
points(x,y3, col="blue",type="l")
legend("topright", bty="n", pch="____", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

# Plot Global reactive power over time
y<-as.numeric(as.character(power2$Global_reactive_power))
plot(x,y, type="l", xlab="datetime",ylab="Global_reactive_power")

# close device

dev.off()
