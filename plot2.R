#Read Data, file should be in working directory
names <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), nrows = 1, header=F, quote="\"", sep=";")

data <- read.table(text = grep("^[1,2]/2/2007",readLines(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt")),value=TRUE), sep = ';', header=T, col.names = names)


#convert date to weekday
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
# data$weekday <- weekdays(data$Date, abbreviate = TRUE)

#Plot 2
if(dev.cur() == 1) dev.new()
plot(data$DateTime, data$Global_active_power, xlab = '', ylab = "Global Active Power (kilowatt)", type = "l")
dev.copy(png,"plot2.png", width = 480, height = 480, units='px')
dev.off()



