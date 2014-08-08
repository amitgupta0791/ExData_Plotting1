##Plot 4
library(sqldf)
filename="household_power_consumption.txt"

## Read the file
data<-read.csv.sql(filename,sep=";",sql='select * from file where Date="1/2/2007" OR Date="2/2/2007"')

## convert date
data$Date<-strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")


## PLot
png("plot4.png", width = 1000, height = 1000)

## set the device
par(mfcol= c(2,2))
## first 

plot(data$Date, data$Global_active_power, type = "line", ylab = "Gloabal Active Power (killowatts)", xlab = "")

## Second 

plot(data$Date, data$Sub_metering_1, type = "line", ylab = "Energy sub metering", xlab = "")
lines(data$Date, data$Sub_metering_2, col="red")
lines(data$Date, data$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Third

plot(data$Date, data$Voltage, type = "line", ylab = "Voltage", xlab = "datetime")

## forth
plot(data$Date, data$Global_reactive_power, type = "line", ylab = "Global_reactive_power", xlab = "datetime")


dev.off()