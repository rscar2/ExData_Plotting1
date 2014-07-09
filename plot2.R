# This script produces the second plot in Assignment 1 of the Exploratory Data Analysis
# course from Coursera.  

# read file 

power<-read.table("household_power_consumption.txt", header=T, sep=";")

# separate out only February dates

power2<- power[(as.Date(power$Date, '%d/%m/%Y')=="2007-02-01"| as.Date(power$Date, '%d/%m/%Y')=="2007-02-02"),]

# Plot Global Active Power over time

png(file="plot2.png",width = 480, height = 480)

x<-strptime(paste(power2$Date, power2$Time), "%d/%m/%Y %H:%M")
y<-as.numeric(as.character(power2$Global_active_power))
plot(x,y, xlab="", ylab="Global Active Power (kilowatts)", type="l")

# close device

dev.off()
