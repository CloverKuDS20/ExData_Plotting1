## Construct Plot 4

## Read and subset data
powerDat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?"
                       , colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
powerDat$DT <- paste(powerDat$Date, powerDat$Time, sep = "-") # Create a new column with both Date and Time info

powerDat$DT <- strptime(powerDat$DT, "%d/%m/%Y-%H:%M:%S") # convert DT into datetime format

# Store the start and end dates we want to look at
startdate <- strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S")
enddate <- strptime("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S")

powerDat2 <- powerDat[(powerDat$DT >= startdate & powerDat$DT <= enddate),] # subset the data rows needed


## Construct Plot 4
# Split graphing area into 4
par(mfrow = c(2,2), omr = c(0, 0, 0, 0), mar = c(4, 4, 2, 1))

# Add Plot 1
plot(powerDat2$DT, powerDat2$Global_active_power, cex.axis = 0.8, type = "l", xlab = "", ylab = "Global Active Power")

# Add Plot 2
plot(powerDat2$DT, powerDat2$Voltage, cex.axis = 0.8, type = "l", xlab = "datetime", ylab = "Voltage")

# Add Plot 3
# Set up the plot area
with(powerDat2, plot(DT, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering", cex.axis = 0.8))
# Plot Sub_metering_1
with(powerDat2, points(DT, Sub_metering_1, type = "l"))
# Plot Sub_metering_2
with(powerDat2, points(DT, Sub_metering_2, type = "l", col = "red"))
# Plot Sub_metering_3
with(powerDat2, points(DT, Sub_metering_3, type = "l", col = "blue"))
# Add legend
legend("topright", pt.cex = 1, cex = 0.8, bty = "n", lty = 1 , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Add Plot 4
plot(powerDat2$DT, powerDat2$Global_reactive_power, cex.axis = 0.8, ylim = c(0, 0.5), type = "l", xlab = "datetime", ylab = "Global_reactive_power")

