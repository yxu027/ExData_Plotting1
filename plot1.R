#Read Data, file should be in working directory
names <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), nrows = 1, header=F, quote="\"", sep=";")

data <- read.table(text = grep("^[1,2]/2/2007",readLines(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt")),value=TRUE), sep = ';', header=T, col.names = names)


#Plot 1
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.copy(png,"plot1.png", width = 480, height = 480, units='px')
dev.off()
