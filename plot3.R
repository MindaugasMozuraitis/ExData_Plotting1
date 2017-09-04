library(plyr)
setwd("~/Desktop/Coursera Exploratory Data Analysis/Week 1")
d = read.table("household_power_consumption.txt", 
               header=T, sep=";", na.strings = "?")
d201702 = mutate(subset(d, Date %in% c("1/2/2007", "2/2/2007")), Time=strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"),
               Date=as.Date(Date, format="%d/%m/%Y")
            )
names(d)
png(filename="plot3.png")

plot(d201702$Time, d201702$Sub_metering_1, 
     main="", 
     xlab="",
     ylab="Energy sub metering", 
     type="n")
lines(d201702$Time[order(d201702$Time)], d201702$Sub_metering_1[order(d201702$Time)])
lines(d201702$Time[order(d201702$Time)], d201702$Sub_metering_2[order(d201702$Time)], col="red")
lines(d201702$Time[order(d201702$Time)], d201702$Sub_metering_3[order(d201702$Time)], col="blue")

dev.off()

