# Set correct working directory
setwd("/Users/tjenkins/Workspace/gettingandcleaningdata_coursera/ExData_Plotting1")

# Read data
dat <- read.table("data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?", colClasses = c("character","character",rep("numeric",7)))

# Subset data to leave only the dates 2007-02-01 and 2007-02-02
dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")

# Convert date and time
dat$Date <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")

# Create plot
par(mfrow=c(2,2), mar=c(5,4,3,2), cex.axis=0.8, cex.lab=0.8, cex.main=0.8)

# First plot
plot(dat$Date, dat$Global_active_power, type="l", xlab="",
     ylab="Global Active Power", col = "black")

# Second plot
plot(dat$Date, dat$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Third plot
plot(dat$Date, dat$Sub_metering_1, type = "l", col = "black", ylab="Energy sub metering", xlab="")
lines(dat$Date, dat$Sub_metering_2, type = "l", col = "red")
lines(dat$Date, dat$Sub_metering_3, type = "l", col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1,
       y.intersp = 0.5, col = c("black", "red", "blue"), cex=0.8, bty="n")

# Fourth plot
plot(dat$Date, dat$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Save image file
dev.copy(png,"assignment/plot4.png",width=480,height=480,units="px")
dev.off()