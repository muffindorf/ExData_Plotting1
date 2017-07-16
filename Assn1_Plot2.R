# Plot 2 - Trendline

hpc_data <- read.table("Exploratory Data Analysis/household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
hpc_wanted <- hpc_data[hpc_data$Date %in% c("1/2/2007","2/2/2007"), ]

datetime <- strptime(paste(hpc_wanted$Date, hpc_wanted$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(hpc_wanted$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()