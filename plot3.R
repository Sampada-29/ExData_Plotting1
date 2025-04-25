# Import data from text file
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")

# Convert Date format
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

# Filter only dates from 2007-02-01 to 2007-02-02
power_feb <- subset(power, Date >= c(as.Date("2007-02-01")) & Date < c(as.Date("2007-02-03")))

# Combine Date and Time
power_feb$DateTime <- as.POSIXct(paste(power_feb$Date, power_feb$Time), format="%Y-%m-%d %H:%M:%S")

# Create plot of the Sub Metering data
plot(power_feb$DateTime, as.numeric(power_feb$Sub_metering_1), type="l", 
     ylab = "Energy Sub metering", xlab = "", xaxt = "n")

lines(power_feb$DateTime, as.numeric(power_feb$Sub_metering_2) ,col="red")
lines(power_feb$DateTime, as.numeric(power_feb$Sub_metering_3) ,col="blue")

axis(1, at=c(as.numeric(min(power_feb$DateTime)), as.numeric(median(power_feb$DateTime)+30), 
             as.numeric(max(power_feb$DateTime))+60), 
     labels=weekdays(c((min(power_feb$DateTime)), (median(power_feb$DateTime)+30), 
                       (max(power_feb$DateTime)+60)), abbreviate=TRUE))

# Adding legend with colors
legend(x = "topright", lty = 1,   
       col= c("black","red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
