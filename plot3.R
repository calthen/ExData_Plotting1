library(dplyr)

setwd("C:\\Users\\Chris\\Dropbox\\School\\Coursera\\ExploritoryDataAnalysis")

fileName <- "household_power_consumption.txt"
data <- read.table(fileName, header = TRUE, sep = ";",na.strings = "?")

data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time) , "%d/%m/%Y %H:%M:%S"))
data$Date2 <- as.Date(data$Date, format = "%d/%m/%Y")

subsetted <- filter(data, Date2 >= as.Date("2007-02-01 00:00:00"), Date2 < as.Date("2007-02-03 00:00:00"))


x <- subsetted$DateTime

#windows()
png("plot3.png", width = 480, height = 480)
plot(x,subsetted$Sub_metering_1, type = 'l', ylab = "Energy sub metering", xlab = "")
lines(x,subsetted$Sub_metering_2, type = 'l', col = "red")
lines(x,subsetted$Sub_metering_3, type = 'l', col = "blue")
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'), lty = 1)

dev.off()
