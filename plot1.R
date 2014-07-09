# This script produces the first plot in Assignment 1 of the Exploratory Data Analysis
# course from Coursera.  

# read file 

power<-read.table("household_power_consumption.txt", header=T, sep=";")

# separate out only February dates

power2<- power[(as.Date(power$Date, '%d/%m/%Y')=="2007-02-01"| as.Date(power$Date, '%d/%m/%Y')=="2007-02-02"),]

# Plot Global Active Power

png(file="plot1.png",width = 480, height = 480)

hist(as.numeric(as.character(power2$Global_active_power)), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

# close device

dev.off()
