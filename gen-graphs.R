
#graph 1
data <- read.csv(file = "household_power_consumption.txt", sep = ";")
DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data <- cbind(DateTime, data)
png("plot1.png",width=480,height=480,units="px")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

#graph 2
png("plot2.png",width=480,height=480,units="px")
plot(data$Global_active_power, type="l", pch="", ylab = "Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(side=1,at=c(1, 1441, nrow(data)), labels = c("Thu", "Fri", "Sat"))
dev.off()

#graph 3
png("plot3.png",width=480,height=480,units="px")
plot(data$Sub_metering_1, type="l", pch="", ylab = "Energy sub metering", xlab="", xaxt="n")
axis(side=1,at=c(1, 1441, nrow(data)), labels = c("Thu", "Fri", "Sat"))
lines(data$Sub_metering_2, type="l", pch="", col="red")
lines(data$Sub_metering_3, type="l", pch="", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black", "blue","red"), lwd=1, pch = c(NA, NA, NA))
dev.off()


# graph 4
png("plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2))

# GAP
plot(data$Global_active_power, type="l", pch="", ylab = "Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(side=1,at=c(1, 1441, nrow(data)), labels = c("Thu", "Fri", "Sat"))

# voltage graph
plot(data$Voltage, type="l", pch="", ylab = "Voltage", xlab="", xaxt="n")
axis(side=1,at=c(1, 1441, nrow(data)), labels = c("Thu", "Fri", "Sat"))

# submetering
plot(data$Sub_metering_1, type="l", pch="", ylab = "Energy sub metering", xlab="", xaxt="n")
axis(side=1,at=c(1, 1441, nrow(data)), labels = c("Thu", "Fri", "Sat"))
lines(data$Sub_metering_2, type="l", pch="", col="red")
lines(data$Sub_metering_3, type="l", pch="", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black", "blue","red"), lwd=1, pch = c(NA, NA, NA))

## global reactive power
plot(data$Global_reactive_power, type="l", pch="", xlab="", xaxt="n")
axis(side=1,at=c(1, 1441, nrow(data)), labels = c("Thu", "Fri", "Sat"))
dev.off()
