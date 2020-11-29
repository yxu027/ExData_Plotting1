#Read Data, file should be in working directory
names <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), nrows = 1, header=F, quote="\"", sep=";")

data <- read.table(text = grep("^[1,2]/2/2007",readLines(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt")),value=TRUE), sep = ';', header=T, col.names = names)

#convert date to weekday
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

#plot3
if(dev.cur() == 1) dev.new()
plot(data$DateTime, data$Sub_metering_1, xlab = '', ylab = "Energy sub metering", type = "l", col = "black")
lines(data$DateTime, data$Sub_metering_2, xlab = '', type = "l", col = "red")
lines(data$DateTime, data$Sub_metering_3, xlab = '', type = "l", col = "blue")

legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), lwd = "1")

dev.copy(png,"plot3.png", width = 480, height = 480, units='px')
dev.off()

