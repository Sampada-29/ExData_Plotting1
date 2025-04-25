# Import data from text file
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")

# Subset data from the dates 2007-02-01 and 2007-02-02
power <- power[power$Date %in% c("1/2/2007","2/2/2007"), ]

# Convert to numeric
Global_active_power <- as.numeric(power$Global_active_power)

# Plot the histogram
hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")