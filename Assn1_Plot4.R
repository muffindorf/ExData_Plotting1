# Plot 4 - Parallel Plots

hpc_data <- read.table("Exploratory Data Analysis/household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
hpc_wanted <- hpc_data[hpc_data$Date %in% c("1/2/2007","2/2/2007"), ]

datetime <- strptime(paste(hpc_wanted$Date, hpc_wanted$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(hpc_wanted$Global_active_power)
globalReactivePower <- as.numeric(hpc_wanted$Global_reactive_power)
voltage <- as.numeric(hpc_wanted$Voltage)
subMetering1 <- as.numeric(hpc_wanted$Sub_metering_1)
subMetering2 <- as.numeric(hpc_wanted$Sub_metering_2)
subMetering3 <- as.numeric(hpc_wanted$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()