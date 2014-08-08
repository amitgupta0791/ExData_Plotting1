##Plot 2
library(sqldf)
filename="household_power_consumption.txt"

## Read the file 
data<-read.csv.sql(filename,sep=";",sql='select * from file where Date="1/2/2007" OR Date="2/2/2007"')

## Combine date and time in a single field.
data$Date<-strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

## Create the line plot
png("plot2.png")
plot(data$Date, data$Global_active_power, type = "line", ylab = "Gloabal Active Power (killowatts)", xlab = "")
dev.off()