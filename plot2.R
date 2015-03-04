library(dplyr)

setwd("C:\\Users\\Chris\\Dropbox\\School\\Coursera\\ExploritoryDataAnalysis")

fileName <- "household_power_consumption.txt"
data <- read.table(fileName, header = TRUE, sep = ";",na.strings = "?")

data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time) , "%d/%m/%Y %H:%M:%S"))
data$Date2 <- as.Date(data$Date, format = "%d/%m/%Y")

subsetted <- filter(data, Date2 >= as.Date("2007-02-01 00:00:00"), Date2 < as.Date("2007-02-03 00:00:00"))


x <- subsetted$DateTime
y <- subsetted$Global_active_power
#windows()
png("plot2.png", width = 480, height = 480)
plot(x,y, type = 'l', ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
