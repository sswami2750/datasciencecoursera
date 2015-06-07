# Exploratory Data Analysis Course Programming Assignment 1
# Problem 4
# Dr. Sumanth Swaminathan
# 06/07/2015 

plot4 <- function()
  
library(data.table) #load data.table library
par(mar=c(5,5,2,2), mfrow=c(2,2)) #Initialize a 2 by 2 matrix of plots

#Read Data and create a DateTime collumn
powdata <-read.table("household_power_consumption.txt", nrows=100000, sep=";", header=TRUE) #Read complete data table
powdata$DateTime <- paste(powdata$Date, powdata$Time) #create new column with both date and time
powdata$DateTime <- as.Date(powdata$DateTime, format = "%d/%m/%Y %H:%M:%S") #Establish time data in the appropriate format

#Subset data to dates of interest (Two day period between 2007-02-01 and 2007-02-02)
subsetted <- filter(powdata, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00")) #subset data for the relevant periods

#First plot in top left corner
with(subsetted, plot(as.numeric(as.character(subsetted$Global_active_power)), xaxt="n", type='l', xlab="", ylab="Global Active Power"))
axis(1, c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))

#Second plot in top right corner 
with(subsetted, plot(as.numeric(as.character(subsetted$Voltage)), xaxt="n", type='l', xlab="datetime", ylab="Voltage"))
axis(1, c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))

#Third plot in bottom left corner 
with(subsetted, plot(as.numeric(as.character(subsetted$Sub_metering_1)), xaxt="n", type='l', xlab="", ylab="Energy sub metering"))
lines(as.numeric(as.character(subsetted$Sub_metering_2)), col="red")
lines(as.numeric(as.character(subsetted$Sub_metering_3)), col="blue")
axis(1, c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
legend("topright", lwd=1, box.lwd=0, col=c("black","red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Fourth plot in bottom right corner
with(subsetted, plot(as.numeric(as.character(subsetted$Global_reactive_power)), xaxt="n", type='l', xlab="datetime", ylab="Voltage"))
axis(1, c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))

#Write figure to png file for submission
dev.copy(png, file="plot4.png", width=580, height=480) #Copy my plot to a PNG file
dev.off() #close dev environment