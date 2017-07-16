## Plot 1 - histogram

hpc_data <- read.table("Exploratory Data Analysis/household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
hpc_wanted <- hpc_data[hpc_data$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(hpc_wanted$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()