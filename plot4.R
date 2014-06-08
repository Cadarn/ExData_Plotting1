##Read in the data
data <- read.csv('household_power_consumption.txt', sep=';', colClasses="character")
  
## Convert Date column into R date format and filter to appropriate date range
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subData <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

##Combine data and time into new variable DateTime
subData$DateTime <- strptime(paste(subData$Date, subData$Time), "%Y-%m-%d %H:%M:%S")

##Create numeric columns 
subData$Global_active_power <- as.numeric(subData$Global_active_power)
subData$Global_reactive_power <- as.numeric(subData$Global_reactive_power)
subData$Voltage <- as.numeric(subData$Voltage)
subData$Global_intensity <- as.numeric(subData$Global_intensity)
subData$Sub_metering_1 <- as.numeric(subData$Sub_metering_1)
subData$Sub_metering_2 <- as.numeric(subData$Sub_metering_2)
subData$Sub_metering_3 <- as.numeric(subData$Sub_metering_3)
  
#Setup PNG output and save plot
png(filename = "plot4.png", width=480, height=480)
attach(mtcars)
par(mfrow=c(2,2))
plot(subData$DateTime, subData$Global_active_power, type='S', ylab='Global Active Power', xlab='')
plot(subData$DateTime, subData$Voltage, type='S', ylab='Voltage', xlab='datetime')
plot(subData$DateTime, subData$Sub_metering_1, type='S', ylab='Energy Sub Metering', xlab='')
lines(subData$DateTime, subData$Sub_metering_2, type='S', col="red")
lines(subData$DateTime, subData$Sub_metering_3, type='S', col="blue")
legend("topright", c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c("black","red", "blue"), lty=c(1,1,1), bty='n')
plot(subData$DateTime, subData$Global_reactive_power, type='S', ylab='Global_reactive_power', xlab='datetime')
dev.off()

