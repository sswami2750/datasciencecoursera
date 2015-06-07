# Exploratory Data Analysis Course Programming Assignment 1
# Problem 3
# Dr. Sumanth Swaminathan
# 06/07/2015 

plot3 <- function()
  
library(data.table) #load data.table library
par(mar=c(5,5,2,2), mfrow=c(1,1)) #Establish Plot Margins

#Read Data and create a DateTime collumn
powdata <-read.table("household_power_consumption.txt", nrows=100000, sep=";", header=TRUE) #Read complete data table
powdata$DateTime <- paste(powdata$Date, powdata$Time) #create new column with both date and time
powdata$DateTime <- as.Date(powdata$DateTime, format = "%d/%m/%Y %H:%M:%S") #Establish time data in the appropriate format

#Subset data to dates of interest (Two day period between 2007-02-01 and 2007-02-02)
subsetted <- filter(powdata, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00")) #subset data for the relevant periods

#Create one plot for Sub_metering_1 and use lines() function to plot the other two sub_metering plots on the same plot
with(subsetted, plot(as.numeric(as.character(subsetted$Sub_metering_1)), xaxt="n", type='l', xlab="", ylab="Energy sub metering"))
lines(as.numeric(as.character(subsetted$Sub_metering_2)), col="red")
lines(as.numeric(as.character(subsetted$Sub_metering_3)), col="blue")
axis(1, c(0,1440,2880), labels=c("Thu", "Fri", "Sat")) # split axis labels based on total number of points (2880)
legend("topright", lwd=1, col=c("black","red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Write figure to png file for submission
dev.copy(png, file="plot3.png", width=580, height=480) #Copy my plot to a PNG file
dev.off() #close dev environment
