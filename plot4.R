# as my system uses Chinese as the default language, I have to use the following statements to correctly print
# "Thu, Fri" in English on the picture
Sys.setenv(LANG = "en_US")
Sys.setlocale(locale = "en_US.UTF-8")

# read file, filter date, filter missing value, generate plot_data
power_data <- read.csv2("household_power_consumption.txt")
two_days <- power_data[which(power_data$Date%in%c("2/2/2007", "1/2/2007")), ]


# create an .png file
png(filename="plot4.png")

# generate timestamps
timestamps <- strptime(paste(as.character(two_days$Date), as.character(two_days$Time)), "%d/%m/%Y %H:%M:%S")

# split into 4 small pics
par(mfrow=c(2,2))

# draw 1
plot(timestamps, as.numeric(as.character(two_days$Global_active_power)), ylab="Global Active Power", xlab="", col="black", type="l")

# draw 2
plot(timestamps, as.numeric(as.character(two_days$Voltage)), ylab="Voltage", xlab="datetime", col="black", type="l")

# draw 3
plot(timestamps, as.numeric(as.character(two_days$Sub_metering_1)), type="l", col="black", xlab="", ylab="Energy sub metering")
lines(timestamps, as.numeric(as.character(two_days$Sub_metering_2)), col="red")
lines(timestamps, as.numeric(as.character(two_days$Sub_metering_3)), col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1), merge = TRUE, bty="n")

# draw 1
plot(timestamps, as.numeric(as.character(two_days$Global_reactive_power)), ylab="Global_reactive_power", xlab="datetime", col="black", type="l")

# close file
dev.off()
