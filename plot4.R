#Read Data, file should be in working directory
names <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), nrows = 1, header=F, quote="\"", sep=";")

data <- read.table(text = grep("^[1,2]/2/2007",readLines(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt")),value=TRUE), sep = ';', header=T, col.names = names)

#convert date to weekday
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

#plot3
if(dev.cur() == 1) dev.new()
par(mfrow=c(2,2))
#1
plot(data$DateTime, data$Global_active_power, xlab = '', ylab = "Global Active Power", type = "l", col = "black")
#2
plot(data$DateTime, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l", col = "black")
#3
plot(data$DateTime, data$Sub_metering_1, xlab = '', ylab = "Energy sub metering", type = "l", col = "black")
lines(data$DateTime, data$Sub_metering_2, xlab = '', type = "l", col = "red")
lines(data$DateTime, data$Sub_metering_3, xlab = '', type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), lwd = "1", bty = "n", cex = 0.5)
#4
plot(data$DateTime, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l", col = "black")

dev.copy(png,"plot4.png", width = 480, height = 480, units='px')
dev.off()
