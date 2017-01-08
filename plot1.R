# read data, filter date, filter missing value, generate plot data
power_data <- read.csv2("household_power_consumption.txt")
two_days <- power_data[which(power_data$Date%in%c("2/2/2007", "1/2/2007")), ]
no_missing <- subset(two_days, two_days$Global_active_power!="?")
plot_data <- no_missing$Global_active_power

# create .png file
png(filename="plot1.png")

# to convert a factor to numeric, it will need to first convert the value to character and then to numeric, otherwise the value would be somehow wrong
hist(as.numeric(as.character(plot_data)), main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

# close file
dev.off()
