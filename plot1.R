plot1 <- function()

library(data.table) #load libraries
par(mar=c(5,4,2,1)) #Establish Plot Margins

powdata <-read.table("household_power_consumption.txt", nrows=100000, sep=";", header=TRUE) #Read complete data table
powdata$DateTime <- paste(powdata$Date, powdata$Time) #create new column with both date and time
powdata$DateTime <- as.Date(powdata$DateTime, format = "%d/%m/%Y %H:%M:%S") #Establish time data in the appropriate format

subsetted <- filter(powdata, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00")) #subset data for the relevant periods

plotdata=as.numeric(as.character(subsetted$Global_active_power)) #convert factor data to character data and subsequently to numeric data
hist(plotdata,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1") #Copy my plot to a PNG file
dev.off() #close dev environment