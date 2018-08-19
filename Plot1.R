## Construct Plot 1

## Read and subset data
powerDat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?"
                       , colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
powerDat$DT <- paste(powerDat$Date, powerDat$Time, sep = "-") # Create a new column with both Date and Time info

powerDat$DT <- strptime(powerDat$DT, "%d/%m/%Y-%H:%M:%S") # convert DT into datetime format

# Store the start and end dates we want to look at
startdate <- strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S")
enddate <- strptime("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S")

powerDat2 <- powerDat[(powerDat$DT >= startdate & powerDat$DT <= enddate),] # subset the data rows needed


## Construct Plot 1 
png(filename = 'plot1.png', width = 480, height = 480)

hist(powerDat2$Global_active_power, col = "red", cex.axis = 0.9, xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
