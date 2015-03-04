library(dplyr)
library(gridExtra) # also loads grid
library(lattice)

setwd("C:\\Users\\Chris\\Dropbox\\School\\Coursera\\ExploritoryDataAnalysis")

fileName <- "household_power_consumption.txt"
data <- read.table(fileName, header = TRUE, sep = ";",na.strings = "?")

data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time) , "%d/%m/%Y %H:%M:%S"))
data$Date2 <- as.Date(data$Date, format = "%d/%m/%Y")

subsetted <- filter(data, Date2 >= as.Date("2007-02-01 00:00:00"), Date2 < as.Date("2007-02-03 00:00:00"))


x <- subsetted$DateTime

#windows()
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

#plot top right
plot(x,subsetted$Global_active_power, type = 'l', ylab = "Global Active Power (kilowatts)", xlab = "")

#plot top left
plot(x,subsetted$Voltage, type = 'l', ylab = "Voltage", xlab = "datetime")

#plot bottom right
plot(x,subsetted$Sub_metering_1, type = 'l', ylab = "Energy sub metering", xlab = "")
lines(x,subsetted$Sub_metering_2, type = 'l', col = "red")
lines(x, subsetted$Sub_metering_3, type = 'l', col = "blue")
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'), lty = 1, bty='n' )

#plot bottom right
plot(x,subsetted$Global_reactive_power, type = 'l', ylab = "Global_reactive_power", xlab = "datetime")

dev.off()

