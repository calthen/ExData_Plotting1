library(dplyr)

setwd("C:\\Users\\Chris\\Dropbox\\School\\Coursera\\ExploritoryDataAnalysis")

fileName <- "household_power_consumption.txt"
data <- read.table(fileName, header = TRUE, sep = ";",na.strings = "?")

data$DateTime <- paste(data$Date, data$Time) 
data$DateTime <- as.Date(data$DateTime, format = "%d/%m/%Y %H:%M:%S")


subsetted <- filter(data, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))


png("plot1.png", width = 480, height = 480)
hist(subsetted$Global_active_power, col = "Red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", freq = TRUE)
dev.off()

