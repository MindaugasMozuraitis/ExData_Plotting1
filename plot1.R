library(plyr)
setwd("~/Desktop/Coursera Exploratory Data Analysis/Week 1")
d = read.table("household_power_consumption.txt", 
               header=T, sep=";", na.strings = "?")
d201702 = mutate(subset(d, Date %in% c("1/2/2007", "2/2/2007")), Time=strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"),
               Date=as.Date(Date, format="%d/%m/%Y")
            )

png(filename="plot1.png")
hist(d201702$Global_active_power, col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()

