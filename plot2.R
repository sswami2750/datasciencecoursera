plot2 <- function()
  
  library(data.table) #load libraries
par(mar=c(5,5,2,2)) #Establish Plot Margins

powdata <-read.table("household_power_consumption.txt", nrows=100000, sep=";", header=TRUE) #Read complete data table
powdata$DateTime <- paste(powdata$Date, powdata$Time) #create new column with both date and time
powdata$DateTime <- as.Date(powdata$DateTime, format = "%d/%m/%Y %H:%M:%S") #Establish time data in the appropriate format

subsetted <- filter(powdata, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00")) #subset data for the relevant periods

plotdata=as.numeric(as.character(subsetted$Global_active_power)) #convert factor data to character data and subsequently to numeric data
with(subsetted, plot(as.numeric(as.character(subsetted$Global_active_power)), xaxt="n", type='l', xlab="", ylab="Global Active Power (kilowatts)"))
axis(1, c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
dev.copy(png, file="plot2.png") #Copy my plot to a PNG file
dev.off() #close dev environment
