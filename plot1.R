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
png(filename = "plot1.png", width=480, height=480)
hist(subData$Global_active_power, breaks=15, col="red", main='Global Active Power', xlab='Global Active Power (kilowatts)', ylim=c(0,1200))
dev.off()

