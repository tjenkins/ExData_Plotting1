# Set correct working directory
setwd("/Users/tjenkins/Workspace/gettingandcleaningdata_coursera/ExData_Plotting1")

# Check if data exists and download/unzip if necessary
if(!file.exists("data/household_power_consumption.txt")) {
  if(!file.exists("data/household_power_consumption.zip")) {
    fileUrl="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, "data/household_power_consumption.zip", method = "curl")  
  }
  unzip("data/household_power_consumption.zip",exdir = "data")
}

# Read data
dat <- read.table("data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?", colClasses = c("character","character",rep("numeric",7)))

# Subset data to leave only the dates 2007-02-01 and 2007-02-02
dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")

# Convert date and time
dat$Date <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")

# Create plot
plot(dat$Date, dat$Sub_metering_1, type = "l", col = "black", ylab="Energy sub metering", xlab="", cex.lab = 0.9, cex.axis = 0.9)
lines(dat$Date, dat$Sub_metering_2, type = "l", col = "red")
lines(dat$Date, dat$Sub_metering_3, type = "l", col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1,
       y.intersp = 0.8, col = c("black", "red", "blue"), cex = 0.9)
dev.copy(png,"assignment/plot3.png",width=480,height=480,units="px")
dev.off()
