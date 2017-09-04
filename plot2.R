library(plyr)
setwd("~/Desktop/Coursera Exploratory Data Analysis/Week 1")
d = read.table("household_power_consumption.txt", 
               header=T, sep=";", na.strings = "?")
d201702 = mutate(subset(d, Date %in% c("1/2/2007", "2/2/2007")), Time=strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"),
               Date=as.Date(Date, format="%d/%m/%Y")
            )

png(filename="plot2.png")

plot(d201702$Time, d201702$Global_active_power, pch=NULL,
     main="", 
     xlab="",
     ylab="Global Active Power (kilowatts)", type="n")
lines(d201702$Time[order(d201702$Time)], d201702$Global_active_power[order(d201702$Time)], pch=16)

dev.off()

