# Set correct working directory
setwd("/Users/tjenkins/Workspace/gettingandcleaningdata_coursera/ExData_Plotting1")

# Read data
dat <- read.table("data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?", colClasses = c("character","character",rep("numeric",7)))

# Subset data to leave only the dates 2007-02-01 and 2007-02-02
dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")

# Convert date and time
dat$Date <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")

# Create plot
plot(dat$Date, dat$Global_active_power, type="l", cex.lab = 0.9, cex.axis = 0.9,
     xlab="", ylab="Global Active Power (kilowatts)", col = "black")
dev.copy(png,"assignment/plot2.png",width=480,height=480,units="px")
dev.off()