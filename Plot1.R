##Plot 1
library(sqldf)

filename="household_power_consumption.txt"
## Read the file only for 1/2/2007 and 2/2/2007
data<-read.csv.sql(filename,sep=";",sql='select * from file where Date="1/2/2007" OR Date="2/2/2007"')

## Transform dates
data$Date<-as.Date(data$Date, "%d/%m/%Y")

## Create the Histogram
png("plot1.png")
hist(data$Global_active_power, col = "red", xlab = "Global Active Power(killowatts)", main = "Global Active Power")
dev.off()




