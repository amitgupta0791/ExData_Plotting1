##Plot 3
library(sqldf)
filename="household_power_consumption.txt"

## Read the file
data<-read.csv.sql(filename,sep=";",sql='select * from file where Date="1/2/2007" OR Date="2/2/2007"')

## convert date
data$Date<-strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

## PLot
png("plot3.png")
plot(data$Date, data$Sub_metering_1, type = "line", ylab = "Energy sub metering", xlab = "")
lines(data$Date, data$Sub_metering_2, col="red")
lines(data$Date, data$Sub_metering_3, col="blue")

## Add the legend
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
