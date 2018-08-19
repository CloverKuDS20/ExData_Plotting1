## Construct Plot 3

## Read and subset data
powerDat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?"
                       , colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
powerDat$DT <- paste(powerDat$Date, powerDat$Time, sep = "-") # Create a new column with both Date and Time info

powerDat$DT <- strptime(powerDat$DT, "%d/%m/%Y-%H:%M:%S") # convert DT into datetime format

# Store the start and end dates we want to look at
startdate <- strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S")
enddate <- strptime("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S")

powerDat2 <- powerDat[(powerDat$DT >= startdate & powerDat$DT <= enddate),] # subset the data rows needed


## Construct Plot 3
png(filename = 'plot3.png', width = 480, height = 480)

# Set up the plot area
with(powerDat2, plot(DT, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
# Plot Sub_metering_1
with(powerDat2, points(DT, Sub_metering_1, type = "l"))
# Plot Sub_metering_2
with(powerDat2, points(DT, Sub_metering_2, type = "l", col = "red"))
# Plot Sub_metering_3
with(powerDat2, points(DT, Sub_metering_3, type = "l", col = "blue"))
# Add legend
legend("topright", lty = 1 , pt.cex = 1, cex = 0.8, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
