# assumes zip file exisit and has been extracted
setwd("C:/Users/scucchb/Exploring_Data/ExData_Plotting1")
library(dplyr)
library(data.table)
datapull <- fread("household_power_consumption.txt", na.strings="?",stringsAsFactors = FALSE)
data <- filter(datapull, grep("^[1,2]/2/2007", Date))


# convert to numeric
globalActivePower <- as.numeric(as.character(data$Global_active_power))
global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
voltage <- as.numeric(as.character(data$Voltage))

#Create object that combines date and time data 
timestamp <-paste(data$Date, data$Time)

#setup histo for Global Active Power
png("plot2.png", width =480, height = 480)
plot(strptime(timestamp, "%d/%m/%Y %H:%M:%S"), data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()